<template>
<div class="card">
  <div class="card-body">
<!--    对posts中的每一个post都构建一个div-->
    <div v-for="post in posts.posts" :key="post.id"  @click="open_article(post.id)">
      <div class="card single-post" >
        <div class="card-body">
          {{ decodeBase64URL(post.title) }}
          <button @click="delete_a_post(post.id)" v-if="is_me" type="button" class="btn btn-danger btn-sm">Delete</button>
        </div>
      </div>
    </div>
  </div>
</div>
</template>

<script>
import {computed} from "vue";
import {useStore} from "vuex";
import $ from 'jquery';
import {Base64} from "js-base64";
import router from "@/router";


export default {
  name: "UserProfilePosts",
  methods: {
    decodeBase64URL(str) {
      let encodedString = str.replace(/-/g, '+').replace(/_/g, '/');
      let decodedString = Base64.decode(encodedString);
      return decodedString;
    },
  },
  props: {
    posts: {
      type: Object,
      required: true,
    },
    user: {
      type: Object,
      require: true,
    }
  },
  setup(props,context) {

    const store = useStore();
    let is_me = computed(() =>  store.state.user.id === props.user.id);
    const jwt_token = localStorage.getItem("jwt_token");
    const delete_a_post = post_id => {
      $.ajax({
        url: "http://127.0.0.1:3000/api/user/article/remove/",
        type: "delete",
        data: {
          article_id: post_id,
        },
        headers: {
          'Authorization': "Bearer " + jwt_token,
        },
        success(resp) {
          if (resp.result === "success") {
            context.emit('delete_a_post',post_id);

          }
        }
      })
    };
    const open_article = id => {
      router.push({
        name: "article",
        params: {
          articleId: id,
        }
      });
    }

    return {
      open_article,
      delete_a_post,
      is_me,
    }
  }
}
</script>

<style scoped>
.single-post {
  margin-bottom: 10px;
}
.btn {
  float: right;
  font-size: 12px;
}
</style>