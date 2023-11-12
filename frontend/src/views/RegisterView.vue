<template>
  <BigTitle :bigTitle="bigTitle" />
  <ContentBase>
    <div class="row justify-content-md-center">
      <div class="col-3">
        <form @submit.prevent="register">
          <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input v-model="username" type="text" class="form-control" id="username">
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input v-model="password" type="password" class="form-control" id="password">
          </div>
          <div class="mb-3">
            <label for="password_confirm" class="form-label">Confirm Password</label>
            <input v-model="password_confirm" type="password" class="form-control" id="password_confirm">
          </div>
          <div class="error-message">{{ error_message }}</div>
          <button type="submit" class="btn btn-primary">Register</button>
        </form>
        <div class="login">已有帐户？ <router-link :to="{name: 'login'}"> 登录</router-link></div>
      </div>
    </div>
  </ContentBase>
</template>

<script>
import ContentBase from "@/components/ContentBase.vue";
import {reactive, ref} from "vue";
import {useStore} from "vuex";
import router from "@/router";
import $ from 'jquery';
import BigTitle from "@/components/BigTitle.vue";

export default {
  name: "RegisterView",
  components: {
    ContentBase,
    BigTitle,
  },
  setup() {
    const store = useStore();
    let username = ref('');
    let password = ref('');
    let error_message = ref('');
    let password_confirm = ref('');
    const bigTitle = reactive({});

    bigTitle.content = "Register";
    bigTitle.color = "#e9ecf2";
    const register = () => {
      error_message.value = "";
      $.ajax({
        url: "http://127.0.0.1:3000/user/account/register/",
        type: "POST",
        data: {
          username: username.value,
          password: password.value,
          confirmPassword: password_confirm.value,
        },
        success(resp) {
          if (resp.error_message === "success") {
            store.dispatch("login", {
              username: username.value,
              password: password.value,
              success() {
                store.dispatch("getinfo", {
                  success() {
                    router.push({
                      name: "home",
                    });
                  }
                })
              },
              error() {
                error_message.value = "系统异常，请稍后重试";
              }
            });
          } else {
            error_message.value = resp.error_message;
          }
        }
      })
    };

    return {
      username,
      password,
      password_confirm,
      error_message,
      register,
      bigTitle,
    }
  }
}
</script>

<style scoped>
.btn {
  width: 100%;
}
.error-message {
  color: red;
}
.login {
  color: gray;
  margin-top: 10px;
  text-align: right;
}
</style>