import { createApp } from "vue";
import App from "@/app.vue";
import router from "./router";
import store from "./store";
import axios from "axios";
import VueAxios from "vue-axios";
import "bootstrap/dist/css/bootstrap.css";
import "bootstrap/dist/js/bootstrap.js";
import "bootstrap-icons/font/bootstrap-icons.css";
import { encryptString, decryptString } from "./tools/crypto";



////////////////////////////// fontawesome
import FontAwesomeIcon from "@/plugin/fontawesome";



////////////////////////////// 自定義元件
// import myLoading from "./components/ui/loading/myLoading";
// import myPagination from "./components/ui/pagination/myPagination.vue";
// import tableButton from "./components/ui/button/tableButton.vue";
// import dataButton from "./components/ui/button/dataButton.vue";
// import HmDialog from "./components/ui/dialog/dialog.vue";
// import collapseComponents from "./components/ui/collapseComponents/collapseComponents.vue";



const app = createApp(App);


app.config.globalProperties.$encryptString = encryptString; // 全域加密
app.config.globalProperties.$decryptString = decryptString; // 全域解密



app
  .use(store)
  .use(router)
  .component("font-awesome-icon", FontAwesomeIcon)
  .use(VueAxios, axios)
  .mount("#app");


// app.use(myLoading);
// app.component("myPagination", myPagination);
// app.component("tableButton", tableButton);
// app.component("dataButton", dataButton);
// app.component("HmDialog", HmDialog);
// app.component("collapseComponents", collapseComponents);
