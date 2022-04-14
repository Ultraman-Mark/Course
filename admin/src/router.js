import Vue from "vue"
import { createRouter, createWebHistory } from "vue-router";//和vue2 路由不同
import Login from "./views/login.vue"
import Admin from  "./views/admin.vue"
import Welcome from  "./views/admin/welcome.vue"
import Chapter from "./views/admin/chapter.vue"
import Course from "./views/admin/course.vue"
import Section from "./views/admin/section.vue"
import Category from "./views/admin/category.vue"

const routerHistory = createWebHistory();

const router = createRouter({
    history: routerHistory,//history写法不同
    routes: [
        {
            path:"/:pathMatch(.*)",
            component: Login,
        }, {
            path:"/login",
            component: Login,
        },{
            path:"/",
            name:"admin",
            component:Admin,
            children:[{
                path:"welcome",
                name:"welcome",
                component: Welcome,
            },{
                path:"business/course",
                name:"business/course",
                component:Course,
            },{
                path:"business/chapter",
                name:"business/chapter",
                component:Chapter,
            },{
                path:"business/section",
                name:"business/section",
                component:Section,
            },{
                path:"business/category",
                name:"business/category",
                component:Category,
            }]
        }
    ],
});

export default router;







