import { createRouter, RouteRecordRaw, createWebHistory, RouteLocationNormalized } from "vue-router"



const routes: Array<RouteRecordRaw> = [
  {
    path: "/",
    redirect: "/loginScreen",
  },
  {
    path: "/loginScreen",
    name: "loginScreen",
    component: () => import("@/view/loginScreen.vue"),
  },
  {
    path: "/homeView",
    name: "homeView",
    component: () => import("@/view/homeView.vue"),
    meta: {
      functionTitle: "首頁",
    },
    children: [
      // {
      //   name: "role-management",
      //   path: "role-management",
      //   component: () => import("@/views/systemManagement/roleManagement.vue"),
      //   meta: {
      //     functionTitle: "組織與權控管理",
      //     subTitle: "角色與權限管理",
      //   },
      // },
    ],
  }
]
const router = createRouter({ history: createWebHistory(process.env.BASE_URL), routes });



router.beforeEach((to, from, next) => {
  // clearInterval(heartbeatInterval);
  // console.log("to:", to, "from:", from);

  const token = localStorage.getItem("userToken");
  if (to.name !== "signInScreen" && !token) {
    // clearLocalStorageKey(true);

  } else {
    // console.log("router.beforeEach:", to.name);


    if (to.name !== "signInScreen") {
      // heartbeatInterval = setInterval(sendHeartbeat, 1500);
      // checkOtherTabs();
    }


    if (to.name !== "signInScreen" && to.name !== "homePage") {
      // 除了 signInScreen、homePage 以外，切換到其他頁面，都必須要檢查是否有此頁面的權限


    } else {
      next();
    }
  }
});



export default router;

// 參考資料：
// 4-1 Vue Router 與前後端路由：https://book.vue.tw/CH4/4-1-vue-router-intro.html
// 4-2 Vue Router 路由設定：https://book.vue.tw/CH4/4-2-route-settings.html
// 4-3 <router-link> 建立路由連結：https://book.vue.tw/CH4/4-3-router-link.html
// 4-4 路由守衛（Navigation Guards）：https://book.vue.tw/CH4/4-4-navigation-guards.html
// https://ithelp.ithome.com.tw/articles/10276947
// https://hackmd.io/@vanCS/ByuzU-rcs
