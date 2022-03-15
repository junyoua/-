import VueRouter from "vue-router";
import Vue from "vue";

Vue.use(VueRouter);

const routes=[
  {
    path: "/",
    name: "Home",
    component: () =>
        import("../views/Home/Home"),
  },
  {
    path: "/home",
    name: "Home",
    component: () =>
        import("../views/Home/Home"),
  },
  {
    path: "/login",
    name: "Login",
    component: () =>
        import("../views/Login/Login"),
  },
  {
    path: "/register",
    name: "Login",
    component: () =>
        import("../views/Login/Register"),
  },
  {
    path: "/form_add",
    name: "Form_add",
    component: () =>
        import("../views/Form/Form_add"),
  },
  {
    path: "/form_updata/:id",
    name: "Form_updata",
    component: () =>
        import("../views/Form/Form_updata"),
  },
  {
    path: "/about",
    name: "About",
    component: () =>
        import("../views/Home/About"),
  },
  {
    path: "/account_info",
    name: "Account_info",
    component: () =>
        import("../views/Home/Account_info"),
  },
  {
    path: "/comment/:id",
    name: "Comment",
    component: () =>
        import("../views/Home/Comment"),
  },
  {
    path: "/collection",
    name: "Collection",
    component: () =>
        import("../views/Home/Collection"),
  },
  {
    path: "/feedback",
    name: "Feedback",
    component: () =>
        import("../views/Feedback/Feedback"),
  },
  {
    path: "/backstage",
    name: "Backstage",
    component: () =>
        import("../views/Backstage/Backstage"),
  },
]
const  router=new VueRouter({
  mode: "history",
  routes,
})
export default router