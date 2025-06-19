// router/index.ts
import { createRouter, createWebHistory, RouteRecordRaw } from "vue-router"

const router = createRouter({
  history: createWebHistory(),
  routes: [
    // {
    //   path: "/",
    //   name: "home",
    //   component: () => import("@/pages/index.vue")
    // },
    {
      path: "/loginScreen",
      name: "loginScreen",
      component: () => import("@/view/loginScreen.vue"),
    },
    {
      path: "/homeView",
      name: "homeView",
      component: () => import("@/view/homeView.vue"),
      children: [
        // {
        // path: "/companyMaintenance",
        // name: "CompanyMaintain",
        // component: () => import("@/views/subfunction/managerGroup/CompanyMaintenance.vue"),
        // },
      ],
    }
  ]
})

export default router;
