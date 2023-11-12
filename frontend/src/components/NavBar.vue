<template>
  <nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top" :class="{ shadow: isShadow }">
    <div class="container navbar-fixed-top ">
      <router-link class="navbar-brand home-link" :to="{name: 'home'}">Fangumi</router-link>
      <button class="navbar-toggler" type="button"
              data-bs-toggle="offcanvas" data-bs-target="#staticBackdrop" aria-controls="staticBackdrop"
              aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="offcanvas offcanvas-start" data-bs-backdrop="static" tabindex="-1" id="staticBackdrop"
           aria-labelledby="staticBackdropLabel">
        <div class="offcanvas-header">
          <router-link class="navbar-brand home-link" :to="{name: 'home'}">Fangumi</router-link>

          <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item" data-bs-dismiss="offcanvas" aria-label="Close">
              <router-link class="nav-link" :to="{name: 'home'}">首页</router-link>
            </li>
          </ul>
          <ul class="navbar-nav" v-if="$store.state.user.is_login" data-bs-dismiss="offcanvas" aria-label="Close" >
            <li class="nav-item">
              <router-link class="nav-link" :to="{name: 'userprofile', params: {userId: $store.state.user.id}}">
                {{ $store.state.user.username }}
              </router-link>
            </li>
            <li class="nav-item">
              <a class="nav-link" style="cursor: pointer" @click="quit">quit</a>
            </li>
          </ul>
          <ul class="navbar-nav" v-else-if="!$store.state.user.pulling_info" data-bs-dismiss="offcanvas" aria-label="Close">
            <li class="nav-item">
              <router-link class="nav-link" :to="{name: 'login'}">登录</router-link>
            </li>
            <li class="nav-item">
              <router-link class="nav-link" :to="{name: 'register'}">注册</router-link>
            </li>
          </ul>

        </div>
      </div>
    </div>

  </nav>

</template>

<script>
import {useStore} from "vuex";
import router from "@/router";
export default {
  name: 'NavBar',

  data() {
    return {
      isShadow: false, // 是否显示阴影
    };
  },
  mounted() {
    // 监听滚动事件
    window.addEventListener("scroll", this.handleScroll);
  },
  methods: {
    handleScroll() {
      // 获取滚动距离
      let scrollTop = document.documentElement.scrollTop || document.body.scrollTop;

      // 如果滚动距离大于导航栏高度，就给导航栏添加一个带有阴影的类名
      if (scrollTop > this.$el.offsetHeight) {
        this.isShadow = true;
      } else {
        // 否则就移除这个类名
        this.isShadow = false;
      }
    }
  },
  setup() {
    const store = useStore();
    const jwt_token = localStorage.getItem("jwt_token");
    if(jwt_token) {
      store.commit("updateToken", jwt_token);
      store.dispatch("getinfo", {
        success() {
          store.commit("updatePullingInfo", false);
        },
        error() {
          store.commit("updatePullingInfo", false);
        }
      })
    } else {
      store.commit("updatePullingInfo", false);
    }

    const quit = () => {
      store.dispatch('quit');
    };

    const open_userlist = () => {
      if (store.state.user.is_login) {
        router.push({
          name: "userlist",
        });
      } else {
        router.push({
          name: "login"
        });
      }
    }

    return {
      open_userlist,
      quit,
      jwt_token,
    }
  },




}
</script>

<style scoped>

nav {
  background-color: white;
  height: 52px;
}

.home-link {
  font-size: 18px;
}

.nav-link {
  font-size: 13px;
}

.shadow {
  box-shadow: 0 2px 2px black;
  transition: 200ms;
}
</style>


