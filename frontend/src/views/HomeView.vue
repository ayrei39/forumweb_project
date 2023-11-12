<template>
  <BigTitle :bigTitle="bigTitle" />
  <ContentBase>

      <div class="row">
        <div class="col-3">
          <SideBar />
        </div>
        <div class="col-9">
          <HomeArticleList/>
        </div>
      </div>

  </ContentBase>
</template>

<script>
import ContentBase from "@/components/ContentBase.vue";
import SideBar from "@/components/home/SideBar.vue";
import HomeArticleList from "@/components/home/HomeArticleList.vue";
import BigTitle from "@/components/BigTitle.vue";
import {reactive} from "vue";
export default {
  name: 'HomeView',
  components: {
    BigTitle,
    SideBar,
    ContentBase,
    HomeArticleList,
  },
  data() {
    return {
      show: false,
    };
  },
  methods: {
    showOverlay() {
      this.show = true;
    },
    closeOverlay() {
      this.show = false;
    },
  },
  setup() {
    const bigTitle = reactive({});

    bigTitle.content = "欢迎来到Fangumi";
    bigTitle.color = "#e9ecf2";

    return {
      bigTitle,
    }
  }
}
</script>

<style scoped>

.big-title {
  font-size: 24px;
}
</style>