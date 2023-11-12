<template>
  <div class="card" :style="{ backgroundColor: bigTitle.color }">
    <div class="card-body big-title">
      {{bigTitle.content}}
    </div>
  </div>
</template>

<script>


export default {
  name: "BigTitle",
  props: {
    bigTitle: {
      type: Object,
      required: true,
    },
  },
}
</script>

<style scoped>
.card {
  margin-top: 52px;
  height: 142px;
  border: none;
  background-color: #e8ecf3;
}
.card-body {
  text-align: center;
  line-height: 110px;
}
.big-title {
  font-size: 24px;
}
</style>