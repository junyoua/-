<template>
  <div id="app">
    <span v-loading.fullscreen.lock="fullscreenLoading"></span>
    <Header v-if="notLogin" v-show="notRegister"/>
    <router-view />
    <Footer v-if="notLogin" v-show="notRegister"/>
  </div>
</template>

<script>
/**
 * @description 许愿墙
 * @author youyou
 * @date 2022-01-18 09:12:00
 * @lastModifiedBy youyou
 * @lastModifiedTime 2022-02-04 14:14:00
 */
import Header from "@/components/Header.vue";
import Footer from "@/components/Footer.vue";
import axios from "axios";

export default {
  name: 'app',
  data() {
    return {
      fullscreenLoading: false,
    }
  },
  components: {
    Header,
    Footer
  },
  created() {
    this.openFullScreen1();
    if (window.performance.navigation.type != 1) {
      const h = this.$createElement;
      this.$notify({
        title: '热烈欢迎',
        duration: '4500',
        offset: 75,
        message: h('i', {style: 'color: #409eff'}, '欢迎各位来到我的许愿墙...')
      });
    }
  },
  computed: {
    // 计算是否是登录页面
    notLogin() {
      return this.$route.path !== "/login";
    },
    notRegister() {
      return this.$route.path !== "/register";
    }
  },
  mounted() {
    // 每次刷新检查账号是否被封禁
    let state = Boolean(this.$cookies.get("session") && this.$cookies.get("disdjsaddkdjksskjxcqwqw"));
    if (state) {
      axios({
        url: 'https://hzti.xyz/PHP/user_state.php',
        method: "post",
        params: {
          name: this.$cookies.get("session")
        }
      }).then(res => {
        if (res.data == 1) {
          window.console.log("登录失效,该账号已被封禁!");
          this.$cookies.remove("session");
          this.$cookies.remove("disdjsaddkdjksskjxcqwqw");
          localStorage.clear();
          this.$session.destroy();
          this.$router.push("./login");
          this.$message({
            message: '警告，登录失效,该账号已被封禁!',
            type: 'error'
          });
        }
      })
    }
    // 每次刷新检查账号是否被封禁结束

    window.console.log("版本号:%c V2.0.0", "color:red;");
    window.console.log("@author%c youyou", "color:red;");
    window.console.log("%c" +
        "             \"$$$$$e.\n" +
        "                \"$$$$$$$e.\n" +
        "                   *$$$$$$$$e\n" +
        "               ....  ^*$$$$$$$b\n" +
        "                *$$$$$$$$$$$$$$$\n" +
        "                  *$$$$$$$$$$$$$b\n" +
        "                    \"$$$$$$$$$$$$.\n" +
        "               $$$eeec3$$$$$$$$$$$\n" +
        "                *$$$$$$$$$$$$$$$$$L\n" +
        "                 \"$$$$$$$$$$$$$$$$$ ..eeee.\n" +
        "                   \"$$$$$$$$$$$$$$$$$$$$$$$$b\n" +
        " zP                  $$$$$$$$$$$$$$$$$$$$$$$$$$$\n" +
        "  *$$bc            d$$$$$$$$$$$$$$$$$$$$$$$$$$\"\n" +
        "    \"$$$$$be...e$$$$$$$$$$$$$$$$$$$$$$$$$$$\"\n" +
        "      *$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$P*\"\n" +
        "       ^$$$$$$$$$$$$$$$$$$$$$$$$$$$$F\n" +
        "        $$$$$$$$$$$$$$$$$$$$$$$$$$$$\"\n" +
        "        $$$$$$$*\"     $$$$$$$$$$$$$$\n" +
        "       $$$$$P\"      .$$$$$$$$$$$$$$$\n" +
        "      $$$$\"        .$$$$$$$$$$$$$$$$\n" +
        "    .$$*          .$$$$$$$$$$$$$$$$\"\n" +
        "   zP\"           .$$P**$$$$$$$$$$$\"\n" +
        "                     z$$$$$$$$$$$P\n" +
        "                    d$$$$$$$$$$$P\n" +
        "                   $$$$*)$$$$$$\"\n" +
        "                 .$*\"  d$$$$$$\n" +
        "                     z$$$$$$\"\n" +
        "                    $$$$$$\"\n" +
        "                  z$$$$P\"\n" +
        "                .$$$$\"\n" +
        "                ", "color:#409eff;");
    let name1 = this.$cookies.get("session");
    let name2 = localStorage.getItem("34sdsdsds56adsxcxw4er");
    if (!(name1 == name2)) {
      window.console.log("登录失效!");
      this.$cookies.remove("session");
      this.$cookies.remove("disdjsaddkdjksskjxcqwqw");
      localStorage.clear();
      this.$session.destroy();
      this.$router.push("./login");
      this.$message({
        message: '警告，登录状态失效，请重新登录!',
        type: 'error'
      });
    }
  },
  methods: {
  openFullScreen1() {
    this.fullscreenLoading = true;
    setTimeout(() => {
      this.fullscreenLoading = false;
    }, 800);
  },
}
}
</script>

<style lang="scss">
* {
  margin: 0;
  padding: 0;
  list-style: none;
}

body, html {
  min-width: 375px;
}
#nprogress {
  .spinner{
    display: none!important;
  }
.bar {
  top: 60px!important;
  .peg{
    display: none;
  }
}
}

</style>
