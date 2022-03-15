import Vue from 'vue'
import App from './App.vue'
import router from "./router";
import axios from "axios";
import VueAxios from 'vue-axios'
import store from "@/store";
import $ from "jquery";
window.jQuery=$;
window.$=$;
import ElementUI from "element-ui";
import "element-ui/lib/theme-chalk/index.css";
Vue.use(ElementUI);
// 允许后端写入Session
// axios.defaults.withCredentials = true;
import VueSession from 'vue-session'
import VueCookies from 'vue-cookies'
import './utils/nprogress'
Vue.config.productionTip = false;
Vue.use(VueAxios,axios);
Vue.use(VueSession)
Vue.use(VueCookies)

new Vue({
  router,
  store,
  render: h => h(App),
  mounted() {
    document.dispatchEvent(new Event('render-event'));
  }
}).$mount('#app')
