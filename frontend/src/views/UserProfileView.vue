<template>
  <BigTitle :bigTitle="bigTitle"/>
  <ContentBase>
    <div class="row">
      <div class="col-3">
        <img class="img-fluid" :src="user.photo" alt="">
        <div class="person-information">
          <div>用户名: {{ user.username }}</div>
          <div>UID: {{ user.id }}</div>
        </div>
        <button type="button" class="btn btn-primary" v-if="is_me" @click="showOverlay1">修改信息</button>
        <OverLay v-if="show1" @close="closeOverlay" class="info-overlay">

          <form @submit.prevent="modify_information">
            <div class="row">

              <label for="username" class="col-2">新用户名：</label>
              <input v-model="username" type="text" class="col-10" id="username">
            </div>
            <div class="error-message">{{ error_message }}</div>
            <button type="submit" class="btn btn-primary">确认</button>
          </form>
        </OverLay>
        <button type="button" class="btn btn-primary" v-if="is_me" @click="showOverlay2">修改密码</button>
        <OverLay v-if="show2" @close="closeOverlay" class="info-overlay">

          <form @submit.prevent="modify_password">
            <div class="row">

              <div class="mb-3">
                <label for="old_password" class="form-label">Old Password</label>
                <input v-model="old_password" type="password" class="form-control" id="old_password">
              </div>

              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input v-model="password" type="password" class="form-control" id="password">
              </div>
              <div class="mb-3">
                <label for="password_confirm" class="form-label">Confirm New Password</label>
                <input v-model="password_confirm" type="password" class="form-control" id="password_confirm">
              </div>

            </div>
            <div class="error-message">{{ error_message }}</div>
            <button type="submit" class="btn btn-primary">确认</button>
          </form>
        </OverLay>

      </div>
      <div class="col-9">
        <UserProfilePosts :user="user" :posts="posts" @delete_a_post="delete_a_post"/>
      </div>
    </div>
  </ContentBase>
</template>

<script>
import ContentBase from "@/components/ContentBase.vue";
import UserProfilePosts from "@/components/user/UserProfilePosts.vue";
import {reactive, ref} from "vue";
import {useRoute} from "vue-router";
import $ from 'jquery';
import {useStore} from "vuex";
import {computed} from "vue";
import BigTitle from "@/components/BigTitle.vue";
import OverLay from "@/components/OverLay.vue";
import router from "@/router";

export default {
  name: "UserProfileView",
  components: {
    OverLay,
    ContentBase,
    UserProfilePosts,
    BigTitle,
  },

  setup() {
    const store = useStore();
    const route = useRoute();
    const userId = parseInt(route.params.userId);
    const user = reactive({});
    const posts = reactive({});
    const bigTitle = reactive({});

    let error_message = ref('');
    let username = ref('');
    let old_password = ref('');
    let password = ref('');
    let password_confirm = ref('');

    const modify_information = () => {
      // console.log("1");
      error_message.value = "";
      $.ajax({
        url: "http://127.0.0.1:3000/user/modify/",
        type: "post",
        data: {
          username: username.value,
        },
        headers: {
          'Authorization': "Bearer " + localStorage.getItem("jwt_token"),
        },
        success(resp) {
          if (resp.success_message === "修改成功") {
            console.log(resp);
            error_message.value = resp.success_message;
          } else {
            console.log(resp);
            error_message.value = resp.error_message;
          }
        },
        error() {
          console.log("3");
          error_message.value = "服务异常";
        }
      })
    };

    const modify_password = () => {
      // console.log("1");
      error_message.value = "";
      $.ajax({
        url: "http://127.0.0.1:3000/user/modify/passward/",
        type: "post",
        data: {
          oldPassword:old_password.value,
          newPassword:password.value,
          confirmNewPassword:password_confirm.value,
        },
        headers: {
          'Authorization': "Bearer " + localStorage.getItem("jwt_token"),
        },
        success(resp) {
          console.log("oldPassword"+old_password.value);
          console.log("newPassword"+password.value);
          console.log("confirmNewPassword"+password_confirm.value);
          if (resp.success_message === "修改成功") {
            console.log(resp);
            error_message.value = resp.success_message;
          } else {
            console.log(resp);
            error_message.value = resp.error_message;
          }
        },
        error() {
          console.log("3");
          error_message.value = "服务异常";
        }
      })
    };

    bigTitle.color = "#e9ecf2";
    $.ajax({
      url: "http://127.0.0.1:3000/user/getinfo/",
      type: "get",
      data: {
        userId: userId,
      },

      success(resp) {
        user.id = resp.id;
        user.username = resp.username;
        user.photo = resp.photo;
        bigTitle.content = resp.username + `的个人主页`;
      }
    });

    $.ajax({
      url: "http://127.0.0.1:3000/api/user/article/getlist/",
      type: "GET",
      data: {
        user_id: userId,
      },
      success(resp) {
        posts.count = resp.length;
        posts.posts = resp;
      }
    });

    const delete_a_post = post_id => {
      posts.posts = posts.posts.filter(post => post.id !== post_id);
      posts.count = posts.posts.length;

    };

    let is_me = computed(() => userId === Number(store.state.user.id));

    return {
      old_password,
      password,
      password_confirm,
      username,
      user,
      posts,
      delete_a_post,
      is_me,
      bigTitle,
      modify_information,
      error_message,
      modify_password
      // modify_me,
    }
  },

  methods: {
    showOverlay1() {
      if (localStorage.getItem("jwt_token")) {
        this.show1 = true;
      } else {
        router.push({
          name: "login"
        })
      }
    },
    showOverlay2() {
      if (localStorage.getItem("jwt_token")) {
        this.show2 = true;
      } else {
        router.push({
          name: "login"
        })
      }
    },
    closeOverlay() {
      this.show1 = false;
      this.show2 = false;
    },

  }, data() {
    return {
      show1: false,
      show2: false,
    };
  },

}
</script>

<style scoped>
.person-information {
  background-color: lightblue;
  margin-top: 10px;
  width: 100%;
  text-align: center;
}

.col-3 > .btn {
  margin-top: 5px;
  width: 100%;
}

form > .btn {
  margin-top: 10px;
  width: 100%;
}

.error-message {
  color: red;
}
</style>