import { createApp } from 'vue'
import App from './app.vue'
import router from './router'
import axios, { AxiosRequestConfig, AxiosResponse, AxiosError } from 'axios';

const app = createApp(App);

app.use(router);
app.mount('#app');
app.config.globalProperties.$axios = axios

/**
 * axios拦截器
 */
axios.interceptors.request.use(
    function (config) {
        console.log("请求:",config);
        return config;
    }, error => {});

axios.interceptors.response.use(
     function (response) {
    console.log("返回:",response);
    return response;
},error => {
         return error;
    });

export default axios;
