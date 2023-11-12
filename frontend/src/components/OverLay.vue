<template>
  <div class="overlay">
    <div class="overlay-content">
          <slot></slot>
      <button type="button" class="btn btn-light" @click="$emit('close')">返回</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "OverLay"
}
</script>

<style scoped>
.overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  z-index: 999;
  display: flex;
  justify-content: center;
  align-items: center;
}

.overlay-content {
  width: 40%;
  background: white;
  padding: 20px;
  border-radius: 5px;
}
.btn {
  width: 100%;
  margin-top: 10px;
}
</style>