import Vue from "vue"
import { createRouter, createWebHistory } from "vue-router";//和vue2 路由不同
import Login from "./views/login.vue"
import Admin from  "./views/admin.vue"
import Welcome from  "./views/admin/welcome.vue"
import Chapter from "./views/admin/chapter.vue"
import Course from "./views/admin/course.vue"
import Section from "./views/admin/section.vue"
import Category from "./views/admin/category.vue"
import Teacher from "./views/admin/teacher.vue"
import File from "./views/admin/file.vue"
import Content from "./views/admin/content.vue"
import User from "./views/admin/user.vue"
import Resource from "./views/admin/resource.vue"
import Role from "./views/admin/role.vue"
import Member from "./views/admin/member.vue"
import Sms from "./views/admin/sms.vue"

const routerHistory = createWebHistory();

const router = createRouter({
    history: routerHistory,//history写法不同
    routes: [
        {
            path:"/:pathMatch(.*)",
            component: Login,
        },{
            path:"",
            component: Login,
        },,{
            path:"/login",
            component: Login,
        },{
            path:"/",
            name:"admin",
            component:Admin,
            meta: {
                loginRequire: true
            },
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
            },{
                path:"business/teacher",
                name:"business/teacher",
                component:Teacher,
            },{
                path: "business/content",
                name: "business/content",
                component: Content,
            },{
                path:"file/file",
                name:"file/file",
                component:File,
            },{
                path:"system/user",
                name:"system/user",
                component:User,
            },{
                path:"system/resource",
                name:"system/resource",
                component:Resource,
            },{
                path:"system/role",
                name:"system/role",
                component:Role,
            },{
                path:"business/member",
                name:"business/member",
                component:Member,
            },{
                path:"business/sms",
                name:"business/sms",
                component:Sms,
            }]
        }
    ],
});

export default router;







