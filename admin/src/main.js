import Vue from 'vue'
import App from './app.vue'
import router from './router'
import axios from "axios";
import filter from "../public/filter/filter";
Vue.config.productionTip = false;
Vue.prototype.$ajax = axios;

axios.interceptors.request.use(function (config) {
    console.log("请求：", config);
    return config;
  }, error => {

  });
axios.interceptors.request.use(function (response) {
  console.log("返回结果", response);
  return response;
}, error => {

});

// 全局过滤器
Object.keys(filter).forEach(key => {
  Vue.filter(key, filter[key]);
});

new Vue({
  router,
  render: h => h(App),
}).$mount('#app');