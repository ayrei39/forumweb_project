import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import LoginView from "@/views/LoginView.vue";
import NotFondView from "@/views/NotFondView.vue";
import RegisterView from "@/views/RegisterView.vue";
import UserProfileView from "@/views/UserProfileView.vue";
import ArticleContentView from "@/views/ArticleContentView.vue";
import HomeKindView from "@/views/HomeKindView.vue";

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/home/:kind/',
    name: 'homekind',
    component: HomeKindView
  },
  {
    path: '/user/:userId/',
    name: 'userprofile',
    component: UserProfileView
  },
  {
    path: '/login/',
    name: 'login',
    component: LoginView
  },
  {
    path: '/register/',
    name: 'register',
    component: RegisterView
  },
  {
    path: '/article/:articleId/',
    name: 'article',
    component: ArticleContentView
  },

  {
    path: '/404/',
    name: '404',
    component: NotFondView
  },
  {
    path: '/catchAll(.*)',
    redirect: '/404',
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
