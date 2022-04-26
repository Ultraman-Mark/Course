import { createRouter, createWebHistory } from "vue-router"; //和vue2 路由不同
import Index from "./views/index.vue"
import List from "./views/list.vue"
import Detail from "./views/detail.vue"

const routerHistory = createWebHistory();

const router = createRouter({
    history: routerHistory,
    base: process.env.BASE_URL,
    routes: [{
        path:"/:pathMatch(.*)",
        redirect: "/index",

    },{
        path:"/index",
        component:Index
    },{
        path:"/list",
        component:List
    },{
        path:"/detail",
        component:Detail
    }]
})

export default router;
