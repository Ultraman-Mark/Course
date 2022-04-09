import { createApp } from 'vue'
import App from './app.vue'
import router from './router'
import axios from "axios";

const app = createApp(App);

app.use(router);
app.mount('#app');
app.config.globalProperties.$axios = axios
