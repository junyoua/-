<template>
  <Nav id="Header">
    <el-header class="header">
      <span class="left" @click="gohome">
        <img src="../assets/logo.png" alt="">
        许愿墙
      </span>
      <div class="secrch">
        <el-autocomplete
            class="secrch_input"
            v-model="state"
            @change="handleSelect"
            :fetch-suggestions="querySearchAsync"
            placeholder="全站搜索内容"
            @select="handleSelect"
        >
          <i class="el-icon-search search-i" slot="append"  @click="handleSelect"/>
        </el-autocomplete>
      </div>
      <ul class="right">
        <li @click="goabout"><span>公告</span></li>
        <li>
          <div  class="xiala">
            <span class="tx-box" style="color:#409eff" v-show="tx.trim()"><img class="tx" :src="tx" alt=""  > {{textname}}</span>
            <i class="el-icon-s-custom name" @click="goLogin" v-if="!tx.trim()" style="color:#409eff">{{ textname }}</i>
            <ol  class="ol">
              <div id="triangle-up"></div>
              <li v-show="this.textstate!=='登录！'" @click="info">个人资料</li>
              <li v-show="this.textstate!=='登录！'" @click="collection">我的收藏</li>
              <li v-show="this.textstate!=='登录！'" @click="feedback">反馈</li>
              <li @click="remove">{{ textstate }}</li>
            </ol>
          </div>
        </li>
      </ul>
    </el-header>
  </Nav>
</template>

<script>
import axios from "axios";
import $ from "jquery"
/**
 * @description 许愿墙
 * @author youyou
 * @date 2022-01-18 09:12:00
 * @lastModifiedBy youyou
 * @lastModifiedTime 2022-02-04 14:14:00
 */

export default {
  name: "Header",
  data() {
    return {
      restaurants: [],
      state: '',
      timeout: null,
      textname: '请登录！',
      textstate: '登录！',
      loading: true,
      text: '',
      tx:'',
    }
  },
  created() {
    axios({
      url: 'https://hzti.xyz/PHP/value_search.php',
      method: "POST",
    }).then(res => {
      this.restaurants = res.data;
    })
    this.txx()
  },
  mounted() {
    let state=Boolean(this.$cookies.get("session")&&this.$cookies.get("disdjsaddkdjksskjxcqwqw"));
    if (state) {
      this.textname = this.$cookies.get("session");
      this.textstate = '退出';
      this.$nextTick(function () {
        $(".name").css("color", "#8cc4fd");
      })
    }
  },
  methods: {
    collection(){
      this.$router.push("/collection");
    },
    feedback(){
      this.$router.push("/feedback");
    },
    txx(){
      let state=Boolean(this.$cookies.get("session")&&this.$cookies.get("disdjsaddkdjksskjxcqwqw"));
      if (state){
        axios({
          url: 'https://hzti.xyz/PHP/user_touxiang.php',
          method: "POST",
          params:{
            text:this.$cookies.get("session")
          }
        }).then(res => {
          if (res.data[0].img){
            this.tx = '../PHP/touxiang/'+res.data[0].img;
          }
        })
      }
    },
    gohome() {
      this.$router.push("/");
    },
    goabout(){
      this.$router.push("/about");
    },
    goLogin() {
      if (this.textname == "请登录！") {
        this.$router.push("/login");
      }
    },
    querySearchAsync(queryString, cb) {
      let restaurants = this.restaurants;
      let results = queryString ? restaurants.filter(this.createStateFilter(queryString)) : restaurants;
      clearTimeout(this.timeout);
      this.timeout = setTimeout(() => {
        cb(results);
      }, 1300 * Math.random());
    },
    createStateFilter(queryString) {
      return (state) => {
        return (state.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
      };
    },
    handleSelect(item) {
      this.text = item.value ? item.value : this.state;
      const search = this.text
      sessionStorage.setItem("search", search);
      this.$router.go(0);
    },
    remove() {
      if (this.textstate == "登录！") {
        this.$router.push("/login");
        document.documentElement.scrollTop = 0;
      } else {
        this.$cookies.remove("session");
        this.$cookies.remove("disdjsaddkdjksskjxcqwqw");
        localStorage.clear();
        this.$session.destroy();
        this.$router.go(0);
      }
    },
    info(){
      this.$router.push("/account_info");
    }
  },
}
</script>

<style lang="scss" scoped>
$color: #409eff;
$textcolor: #8cc4fd;
.header {
  min-width: 375px;
  display: flex;
  width: 100%;
  align-items: center;
  justify-content: space-between;
  font-size: 15px;
  height: 25vw;
  border: 1px solid #eee;
  background: #fff;
  color: $textcolor;
  position: fixed;
  left: 0;
  top: 0;
  z-index: 999;

  .left {
    font-size: 16px;
    color: $color;
    flex: 1;
    cursor: pointer;


    img {
      width: 3.3vw;
      vertical-align: middle;
    }
  }


  .secrch {
    flex: 1;

    & > div {
      width: 80%;
    }
    /deep/.el-input-group__append{
      cursor: pointer!important;
    }
  }


  .right {
    display: flex;
    align-items: center;
    font-weight: 400;
    margin-left: 1vw;

    li {
      margin: 0 1vw;
      cursor: pointer;

      &:hover {
        color: $color;
      }
      /deep/.el-dropdown .name{
        height: 24px!important;
        line-height: 30px!important;
      }
      .tx{
        width: 30px;
        height: 30px;
        border-radius: 3px;
        vertical-align: middle;
      }
      .xiala{
        position: relative;
        display: flex;
        height: 50px;
        align-items: center;
        justify-content: center;
        &:hover .ol{
          display: block;
        }
        .ol{
          width: 80px;
          height: auto;
          background-color:#fff;
          position: absolute;
          right: 0px;
          top: 50px;
          margin: 0;
          border-radius: 5px;
          box-shadow: 0px 0px 3px #bbb;
          display: none;
          #triangle-up {
            width: 0;
            height: 0;
            margin-top: -8px;
            margin-left: 8px;
            border-left: 5px solid transparent;
            border-right: 5px solid transparent;
            border-bottom: 10px solid #fff5f5;
          }
          li{
            margin: 0;
            line-height: 1.3!important;
            text-align: center;
            margin: 10px 0;
            color: #767676;
          }
          li:hover{
            color: $color;
          }
        }
      }


      &>div i{
        width: 77px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
      }

      .el-icon-s-custom:before {
        padding-right: 0.1vw;
      }
    }
  }
}
@media (max-width: 600px) {
  .header{
    .left{
      text-align: center;
    }
  }
  /deep/.el-header{
    padding: 0 5px!important;
  }
  .secrch {
    flex: 2.1;
    & > div {
      width: 100%;
    }
    /deep/.el-input__inner{padding:0 0px!important;width:100%!important; text-align: center;min-width: 100px!important;}
  }

}
</style>