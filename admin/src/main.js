import { createApp } from 'vue'
import App from './app.vue'
import router from './router'
import axios, { AxiosRequestConfig, AxiosResponse, AxiosError } from 'axios';
import filter from './filter/filter'

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

// 全局过滤器
// Object.keys(filter).forEach(key => {
//     app.filter(key, filter[key])
// });
app.config.globalProperties.$filters = {
    filter(list,key){
        if (!list || !key) {
            return "";
        } else {
            let result = "";
            for(let i=0;i < list.length; i++){
                if (key === list[i]["key"]) {
                    result = list[i]["value"];
                }
            }
            return result;
        }
    }
}

export default axios;

console.log("环境:",process.env.NODE_ENV);
