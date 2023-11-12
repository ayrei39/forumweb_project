<template>
  <div class="side" :class="{ move: isMove }">
    <button type="button" class="btn btn-primary" @click="showOverlay">回复</button>
    <OverLay v-if="show" @close="closeOverlay" class="post-overlay">
      <form @submit.prevent="post_a_reply">
        <div class="mb-3">
          <label for="content" class="form-label">回复内容</label>
          <textarea v-model="content" type="password" class="form-control" id="content"></textarea>
        </div>
        <div class="error-message">{{ error_message }}</div>
        <button type="submit" class="btn btn-primary">发送</button>
      </form>
    </OverLay>
    <div class="time-label t1">最早内容</div>
    <div class="progress">
      <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    <div class="time-label">最新回复</div>
  </div>

</template>

<script>
import OverLay from "@/components/OverLay.vue";
import router from "@/router";
import {ref} from "vue";
import $ from "jquery";
import {Base64} from "js-base64";
import {useRoute} from "vue-router";
export default {
  name: "ProgressBar",
  components: {
    OverLay,
  },
  data() {
    return {
      isMove: false,
      show: false,
    };
  },

  mounted() {
    window.addEventListener('scroll', this.handleScroll);
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
    handleScroll() {
      // 获取文档高度和窗口高度
      let documentHeight = document.body.scrollHeight;
      let windowHeight = window.innerHeight;

      // 获取滚动距离和最大滚动距离
      let scrollTop = window.pageYOffset;
      let maxScrollTop = documentHeight - windowHeight;

      // 计算滚动百分比
      let scrollPercent = Math.round((scrollTop / maxScrollTop) * 100);

      // 更新进度条宽度
      let progressBar = document.querySelector('.progress-bar');
      progressBar.style.height = scrollPercent + '%';


      // 如果滚动距离大于导航栏高度，就给导航栏添加类名
      if (scrollTop > 0) {
        this.isMove = true;
      } else {
        // 否则就移除这个类名
        this.isMove = false;
      }
    },
  },
  setup() {
    const route = useRoute();
    const articleId = parseInt(route.params.articleId);
    let content = ref('');
    let error_message = ref('');
    const post_a_reply = () => {
      error_message.value = "";
      $.ajax({
        url: "http://127.0.0.1:3000/reply/add/",
        type: "post",
        data: {
          articleId: articleId,
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
            router.replace({
              name: "article",
              params:{
                articleId:articleId,
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
      post_a_reply,
      error_message,
      content,
    }
  }
}
</script>

<style scoped>
.side {
  margin-top: 20px;
  text-align: center;
  width: 160px;
}
.btn {
  width: 100%;
}
.progress-bar {
  width: 100%;
  height: 0%;
  transition: width 0.5s;
}

.progress {
  height: 300px;
  width: 8px;
  margin: 0 auto;
}
.t1 {
  margin-top: 20px;
}
.move {
  top: 232px;
  position: fixed;
}
.error-message {
  color: red;
}
</style>