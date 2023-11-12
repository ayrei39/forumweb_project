<template>
  <BigTitle :bigTitle="bigTitle" />
  <ContentBase>
    <div class="row">
      <div class="col-3">
          <img class="img-fluid" :src="user.photo" alt="">
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
import {reactive} from "vue";
import { useRoute } from "vue-router";
import $ from 'jquery';
import {useStore} from "vuex";
import { computed } from "vue";
import BigTitle from "@/components/BigTitle.vue";
export default {
  name: "UserProfileView",
  components: {
    ContentBase,
    UserProfilePosts,
    BigTitle,
  },

  setup() {
    const store = useStore();
    const route = useRoute();
    const userId = parseInt (route.params.userId);
    const user = reactive({});
    const posts = reactive({});
    const bigTitle = reactive({});

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
      posts.posts = posts.posts.filter(post => post.id != post_id);
      posts.count = posts.posts.length;

    };

    const is_me = computed(() => userId === store.state.user.id);

    return {
      user,
      posts,
      delete_a_post,
      is_me,
      bigTitle,
    }
  }
}
</script>

<style scoped>
</style>