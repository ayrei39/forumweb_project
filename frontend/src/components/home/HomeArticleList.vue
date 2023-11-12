<template>
  <div class="card" @click="open_article(article.id)" v-for="article in articles.slice().reverse()" :key="article.id">
    <div class="card-body">
      <div class="row">
        <div class="col-1 img-field">
          <img class="img-fluid" :src="article.photo" alt="">
        </div>
        <div class="col-10">
          <div class="articleTitle">{{ decodeBase64URL(article.title) }}</div>
          <div class="author-name">{{ article.username }}</div>
          <div class="post-time">{{ article.modifytime }}</div>
        </div>
        <div class="col-1">
          <div class="kind" :style="{ backgroundColor: article.color }">
            <span class="kind-name">
              {{ article.kind }}
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import router from "@/router";
import {ref} from "vue";
import $ from "jquery";
import {Base64} from 'js-base64';
import {useRoute} from "vue-router";

export default {
  name: "HomeArticleList",

  methods: {
    decodeBase64URL(str) {
      let encodedString = str.replace(/-/g, '+').replace(/_/g, '/');
      return Base64.decode(encodedString);
    },
  },

  setup() {
    let articles = ref([]);
    const route = useRoute();
    let kind = route.params.kind;
    if (kind === undefined) {
      kind = "all";
    }
    $.ajax({
      url: 'http://127.0.0.1:3000/api/article/kind/',
      type: "get",
      data: {
        kind: kind,
      },
      success(resp) {
        articles.value = resp;
        for (let item of articles.value) {
          if(item.kind === "general") {
            item.color = '#888888';
          }
          if(item.kind === "find") {
            item.color = '#c2b1e0';
          }
          if(item.kind === "create") {
            item.color = '#54b9d1';
          }
          if(item.kind === "blog") {
            item.color = '#5f2f94';
          }
          if(item.kind === "ask") {
            item.color = '#f3b860';
          }
          if(item.kind === "events") {
            item.color = '#c35e70';
          }
          if(item.kind === "future") {
            item.color = '#5d91cc';
          }
          $.ajax({
            url: "http://127.0.0.1:3000/user/getinfo/",
            type: "get",
            data: {
              userId: item.userId,
            },
            success(resp) {
              item.username = resp.username;
              item.photo = resp.photo;
            }
          });
        }
      }
    });

    const open_article = articleId => {
      router.push({
        name: "article",
        params: {
          articleId,
        }
      });
    }

    return {
      open_article,
      articles,
    };
  },

}
</script>

<style scoped>
.card {

}

img {
  border-radius: 50%;
}

.articleTitle {
  line-height: 32px;
  font-weight: bold;
  height: 50%;
}

.card {
  margin-bottom: 20px;
  cursor: pointer;
  border: none;
}

.card:hover {
  background-color: #f4f6f9;
  transition: 500ms;
}

.img-field {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.author-name {
  font-size: 12px;
  color: gray;
  height: 50%;
  margin-top: 6px;
  display: inline-block;
  margin-right: 6px;
}

.post-time {
  font-size: 12px;
  color: gray;
  height: 50%;
  margin-top: 6px;
  display: inline-block;
}

.kind {
  height: 20px;
  width: 60px;
  font-size: 14px;
  line-height: 20px;
  text-align: center;
  border-radius: 2px;
  font-weight: bold;
  color: white;
}
</style>