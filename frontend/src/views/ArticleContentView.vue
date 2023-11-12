<template>
  <BigTitle :bigTitle="bigTitle" />
  <ContentBase>
    <div class="row">
      <div class="col-9">
        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-1 img-field" @click="open_user_profile(user.id)">
                <img class="img-fluid" :src="user.photo" alt="">
              </div>
              <div class="col-11 content">
                <div style="background-color: #e9ecf2;border-radius: 5px;">
                  <span class="name">{{user.name}}</span>
                  <span class="edit-time">编辑于：{{article.modifytime}}</span>
                </div>
                <pre>{{article.content}}</pre>
              </div>
            </div>
          </div>
        </div>
        <hr>
        <div class="card reply" v-for="reply in replys.value" :key="reply.id">
          <div class="card-body">
            <div class="row">
              <div class="col-1" @click="open_user_profile(reply.userId)">
                <img class="img-fluid" :src="reply.photo" alt="">
              </div>
              <div class="col-11">
                <div style="background-color: #e9ecf2;border-radius: 5px;">
                  <span class="name">{{reply.username}}</span>
                  <span class="edit-time">编辑于：{{reply.createtime}}</span>
                </div>
                <pre>{{ decodeBase64URL(reply.content) }}</pre>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-3">
        <ProgressBar/>
      </div>
    </div>
  </ContentBase>

</template>


<script>
import ContentBase from "@/components/ContentBase.vue";

import ProgressBar from "@/components/article/ProgressBar.vue";
import $ from "jquery";
import {useRoute} from "vue-router";
import {reactive} from "vue";
import {Base64} from "js-base64";
import router from "@/router";
import BigTitle from "@/components/BigTitle.vue";


export default {
  name: "ArticleContentView",
  components: {
    ContentBase,
    ProgressBar,
    BigTitle
  },

  methods: {
    decodeBase64URL(str) {
      let encodedString = str.replace(/-/g, '+').replace(/_/g, '/');
      let decodedString = Base64.decode(encodedString);
      return decodedString;
    },
  },

  setup() {
    const route = useRoute();
    const articleId = parseInt(route.params.articleId);
    const article = reactive({});
    const user = reactive({});
    const replys = reactive({});
    const bigTitle = reactive({});
    $.ajax({
      url: "http://127.0.0.1:3000/article/get/",
      type: "get",
      data: {
        articleId: articleId,
      },
      success(resp) {
        article.id = resp.id;
        user.id = resp.userId;
        article.title = resp.title;
        bigTitle.content = Base64.decode((resp.title).replace(/-/g, '+').replace(/_/g, '/'));
        article.content = resp.content;
        let encodedString = article.content.replace(/-/g, '+').replace(/_/g, '/');
        article.content = Base64.decode(encodedString);
        article.modifytime = resp.modifytime;
        $.ajax({
          url: "http://127.0.0.1:3000/user/getinfo/",
          type: "get",
          data: {
            userId: user.id,
          },
          success(resp) {
            user.photo = resp.photo;
            user.name = resp.username;
          }
        });

        if(resp.kind === "general") {
          bigTitle.color = "#888888";
        } else if(resp.kind === "find") {
          bigTitle.color = "#c2b1e0";
        } else if(resp.kind === "create") {
          bigTitle.color = "#54b9d1";
        } else if(resp.kind === "blog") {
          bigTitle.color = "#5f2f94";
        } else if(resp.kind === "ask") {
          bigTitle.color = "#f3b860";
        } else if(resp.kind === "events") {
          bigTitle.color = "#c35e70";
        } else {
          bigTitle.color = "#5d91cc";
        }
      }
    });
    $.ajax({
      url: "http://127.0.0.1:3000/reply/list/",
      type: "get",
      data: {
        article_id: articleId,
      },
      success(resp) {
        replys.value = resp;
        for (let reply of replys.value) {
          $.ajax({
            url: "http://127.0.0.1:3000/user/getinfo/",
            type: "get",
            data: {
              userId: reply.userId,
            },
            success(resp) {
              reply.username = resp.username;
              reply.photo = resp.photo;
            }
          });
        }
      }
    });
    const open_user_profile = userId => {
        router.push({
          name: "userprofile",
          params: {
            userId,
          }
        });
    }
    return {
      article,
      user,
      replys,
      open_user_profile,
      bigTitle,
    }
  },
};
</script>

<style scoped>
.img-field {
  display: flex;
  flex-direction: column;
}

img {
  border-radius: 50%;
}

.col-3 {
  display: flex; /* 设置为flex布局 */
  justify-content: center; /* 设置水平居中 */
}
pre {
  white-space:pre-wrap;
}
.reply {
  margin-bottom: 10px;
}
.edit-time {
  font-size: 12px;
  margin-left: 16px;
}
.name {
  font-weight: bold;
  margin-left: 5px;
}
</style>