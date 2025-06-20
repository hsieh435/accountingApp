<template>
  <div class="container-fluid">
    <div>
      <!-- <navBarMenu></navBarMenu> -->
    </div>
    <div class="container-fluid container-main">
      <!-- <navBreadCrumb></navBreadCrumb> -->
      <router-view />
    </div>
  </div>
</template>
<script setup lang="ts">
import { defineAsyncComponent, ref, computed, onMounted, watch } from "vue";
import store from "@/store";
import { getLocalStorageItem } from "@/tools/tools";



const navBarMenu = defineAsyncComponent(() => import("@/components/ui/navBarMenu.vue"));
const navBreadCrumb = defineAsyncComponent(() => import("@/components/ui/navBreadCrumb.vue"));



</script>
<style lang="scss" scoped>
.container-fluid {
  height: 100vh;
  width: 100%;
  --bs-gutter-x: 0rem;
  --bs-gutter-y: 0;
  margin-right: auto;
  margin-left: auto;
  padding-right: calc(var(--bs-gutter-x) * 0.5);
  padding-left: calc(var(--bs-gutter-x) * 0.5);
}

.container-main {
  height: calc(100vh - 40px);
  margin: 0px 0px 0px 0px;
  padding: 0px 0px 0px 0px;
  position: absolute;
  left: 0px;
  top: 40px;
}

.openSidebarMode {
  width: 240px;
}

.closeSidebarMode {
  width: 0px;
}

.fullFunction {
  width: 100vw;
}

.notFullFunction {
  width: calc(100vw - 240px);
  position: absolute;
  left: 240px;
  top: 40px;
}
</style>
