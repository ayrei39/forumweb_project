<template>
  <nav-bar/>
<!--  <BigTitle/>-->
  <router-view :key="$route.fullPath" />
</template>

<script>
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap/dist/js/bootstrap';
import NavBar from './components/NavBar.vue';
// import BigTitle from "@/components/BigTitle.vue";

export default {
  name: 'App',
  components: {
    // BigTitle,
    NavBar
  }
}
</script>


<style>

</style>
