<template>
  <div class="d-flex flex-column flex-shrink-0 p-3 ">
    <button type="button" class="btn btn-primary" @click="showOverlay">发布帖子</button>
    <OverLay v-if="show" @close="closeOverlay" class="post-overlay">
      <form @submit.prevent="post_a_post">
        <div class="mb-3">
          <label for="title" class="form-label">标题</label>
          <input v-model="title" type="text" class="form-control" id="title">
        </div>
        <div class="mb-3">
          <label for="kind" class="form-label">分类</label>
          <select v-model="kind" class="form-control" id="kind">
            <option value="general">综合讨论</option>
            <option value="find">分享发现</option>
            <option value="create">分享创造</option>
            <option value="blog">博客区</option>
            <option value="ask">问与答</option>
            <option value="events">活动&项目</option>
            <option value="future">升学就业</option>
          </select>
        </div>
        <div class="mb-3">
          <label for="content" class="form-label">内容</label>
          <textarea v-model="content" type="password" class="form-control" id="content"></textarea>
        </div>
        <div class="error-message">{{ error_message }}</div>
        <button type="submit" class="btn btn-primary">发送</button>
      </form>
    </OverLay>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li>
        <router-link :to="{name: 'home'}" class="nav-link link-dark">
          <div class="subject">
            <div class="subject-icon" style="background-color: #e9ecf2;"></div>
            全部主题
          </div>
        </router-link>
      </li>

      <li>
        <router-link :to="{name: 'homekind',params:{kind:'general'}}" class="nav-link link-dark">

          <div class="subject">
            <div class="subject-icon" style="background-color: #888888;"></div>
            综合讨论
          </div>
        </router-link>
      </li>
      <li>
        <router-link :to="{name: 'homekind',params:{kind:'find'}}" class="nav-link link-dark">
          <div class="subject">
            <div class="subject-icon" style="background-color: #c2b1e0;"></div>
            分享发现
          </div>
        </router-link>
      </li>
      <li>
        <router-link :to="{name: 'homekind',params:{kind:'create'}}" class="nav-link link-dark">
          <div class="subject">
            <div class="subject-icon" style="background-color: #54b9d1;"></div>
            分享创造
          </div>
        </router-link>
      </li>
      <li>
        <router-link :to="{name: 'homekind',params:{kind:'blog'}}" class="nav-link link-dark">
          <div class="subject">
            <div class="subject-icon" style="background-color: #5f2f94;"></div>
            博客区
          </div>
        </router-link>
      </li>
      <li>
        <router-link :to="{name: 'homekind',params:{kind:'ask'}}" class="nav-link link-dark">
          <div class="subject">
            <div class="subject-icon" style="background-color: #f3b860;"></div>
            问与答
          </div>
        </router-link>
      </li>
      <li>
        <router-link :to="{name: 'homekind',params:{kind:'events'}}" class="nav-link link-dark">
          <div class="subject">
            <div class="subject-icon" style="background-color: #c35e70;"></div>
            活动&项目
          </div>
        </router-link>
      </li>
      <li>
        <router-link :to="{name: 'homekind',params:{kind:'future'}}" class="nav-link link-dark">
          <div class="subject">
            <div class="subject-icon" style="background-color: #5d91cc;"></div>
            升学就业
          </div>
        </router-link>
      </li>
    </ul>

  </div>
</template>

<script>
import OverLay from "@/components/OverLay.vue";
import router from "@/router";
import $ from 'jquery';
import {ref} from "vue";
import {Base64} from "js-base64";
export default {
  name: "SideBar",
  components: {
    OverLay,
  },
  data() {
    return {
      show: false,
    };
  },
  methods: {
    showOverlay() {
      if(localStorage.getItem("jwt_token")){
        this.show = true;
      } else {
        router.push({
          name: "login"
        })
      }
    },
    closeOverlay() {
      this.show = false;
    },
  },
setup() {
  let title = ref('');
  let kind = ref('');
  let content = ref('');
  let error_message = ref('');
  const post_a_post = () => {
    error_message.value = "";
    $.ajax({
      url: "http://127.0.0.1:3000/api/user/article/add/",
      type: "post",
      data: {
        title: (Base64.encode(title.value)).replace(/\+/g, "-")
            .replace(/\//g, "_")
            .replace(/=+$/, ""),
        kind:kind.value,
        content: (Base64.encode(content.value)).replace(/\+/g, "-")
            .replace(/\//g, "_")
            .replace(/=+$/, ""),
      },
      headers: {
        'Authorization': "Bearer " + localStorage.getItem("jwt_token"),
      },
      success(resp) {
        if(resp.error_message === "success") {
          error_message.value = "发送成功";
          router.push({
            name: "article",
            params:{
              articleId:resp.id,
            }
          });
        } else {
          error_message.value = resp.error_message;
        }
      },
      error() {
        error_message.value = "服务异常";
      }
    })
  };
  return {
    post_a_post,
    error_message,
    title,
    kind,
    content,
  }
}
}
</script>

<style scoped>
.subject {
  margin-left: 20%;
  margin-bottom: 20px;
  height: 16px;
  font-size: 14px;

}
.subject-icon {
  width: 14px;
  height: 14px;
  display: inline-block;
  margin-right: 4px;
  border-radius: 20%;
}
.btn {
  width: 100%;
}
.error-message {
  color: red;
}
</style>