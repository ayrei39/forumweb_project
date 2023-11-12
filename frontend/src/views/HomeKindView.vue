<template>
  <BigTitle :bigTitle="bigTitle" />
  <ContentBase>
    <div class="box">
      <div class="row">
        <div class="col-3">
          <SideBar/>
        </div>
        <div class="col-9">
          <HomeArticleList/>
        </div>
      </div>
    </div>
  </ContentBase>
</template>

<script>
import ContentBase from "@/components/ContentBase.vue";
import SideBar from "@/components/home/SideBar.vue";
import HomeArticleList from "@/components/home/HomeArticleList.vue";
import BigTitle from "@/components/BigTitle.vue";
import {useRoute} from "vue-router";
import {reactive} from 'vue';

export default {
  name: "HomeKindView",
  components: {SideBar, ContentBase, HomeArticleList, BigTitle},
  setup() {
    const route = useRoute();
    const kind = route.params.kind;
    const bigTitle = reactive({});

    if(kind === "general") {
      bigTitle.content = "综合讨论";
      bigTitle.color = "#888888";
    } else if(kind === "find") {
      bigTitle.content = "分享发现";
      bigTitle.color = "#c2b1e0";
    } else if(kind === "create") {
      bigTitle.content = "分享创造";
      bigTitle.color = "#54b9d1";
    } else if(kind === "blog") {
      bigTitle.content = "博客区";
      bigTitle.color = "#5f2f94";
    } else if(kind === "ask") {
      bigTitle.content = "问与答";
      bigTitle.color = "#f3b860";
    } else if(kind === "events") {
      bigTitle.content = "活动&项目";
      bigTitle.color = "#c35e70";
    } else {
      bigTitle.content = "升学就业";
      bigTitle.color = "#5d91cc";
    }


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