<template>
  <BigTitle :bigTitle="bigTitle" />
  <ContentBase>
    <div class="row justify-content-md-center">
      <div class="col-3">
        <form @submit.prevent="login">
          <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input v-model="username" type="text" class="form-control" id="username">
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input v-model="password" type="password" class="form-control" id="password">
          </div>
          <div class="error-message">{{ error_message }}</div>
          <button type="submit" class="btn btn-primary">Login</button>
        </form>
        <div class="register">还没有帐户？<router-link :to="{name: 'register'}"> 立即注册</router-link></div>
      </div>
    </div>
  </ContentBase>
</template>

<script>
import ContentBase from "@/components/ContentBase.vue";
import {reactive, ref} from "vue";
import {useStore} from "vuex";
import router from "@/router";
import BigTitle from "@/components/BigTitle.vue";
export default {
  name: "LoginView",
  components: {
    ContentBase,
    BigTitle,
  },
  setup() {
    const store = useStore();
    let username = ref('');
    let password = ref('');
    let error_message = ref('');
    const bigTitle = reactive({});

    bigTitle.content = "Login";
    bigTitle.color = "#e9ecf2";
    const login = () => {
      error_message.value = "";
      store.dispatch("login",{
        username: username.value,
        password: password.value,
        success() {
          store.dispatch("getinfo", {
            success() {
              router.push({ name: 'home' });
            }
          })
        },
        error() {
          error_message.value = "用户名或密码错误";
        },
      });
    };

    return {
      username,
      password,
      error_message,
      login,
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
.register {
  color: gray;
  margin-top: 10px;
  text-align: right;
}
</style>