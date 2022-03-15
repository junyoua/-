<template>
  <main id="main">
    <div class="content">
      <div class="breadcrumb">
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item><a href="/">首页</a></el-breadcrumb-item>
          <el-breadcrumb-item>许愿墙</el-breadcrumb-item>
        </el-breadcrumb>
      </div>
      <!--内容-->
      <div class="box">
        <span class="xy" @click="xy">许愿</span>
        <div class="content-box">
          <el-row v-show="isactive">
            <el-col :sm="24" :lg="24">
              <el-result icon="error" title="错误提示" subTitle="查询成功，但没有任何数据!">
                <template slot="extra">
                  <el-button type="primary" size="medium" @click="gohome">返回</el-button>
                </template>
              </el-result>
            </el-col>
          </el-row>
          <ul class="infinite-list" infinite-scroll-disabled="true" style="overflow:auto">
            <li class="list-item"  v-for="(item,index) in count" :key="index" v-if="index<num">
              <div class="item" v-if="item.imgdata">
                <p class="label" v-show='item.value'>{{item.value}}</p>
                <img class="imgbackground" :src="['./PHP/uploads/' + item.imgdata]" alt="">
                <p class="time">{{ item.time }}</p>
                <p class="item-content">{{ item.content }}</p>
                <div class="item-bottom">
                  <div class="left">
                    <img src="../../assets/zhan.png" alt="" @click="good(index,item.id,item.number)"><span>{{ item.number }}</span>
                  </div>
                  <div class="name" v-show="item.img"><img class="touxiang" :src="['./PHP/touxiang/' + item.img]" alt=""><span>{{ item.name }}</span></div>
                  <div class="name" v-show="!item.img"><i class="el-icon-s-custom">：</i><span>{{ item.name }}</span></div>
                  <div class="right">
                    <i class="el-icon-star-off" @click="collection(item.id)" />
                    <el-badge :value="item.comment" class="comment">
                      <i class="el-icon-chat-dot-round" size="small"  @click="comment(item.id)"/>
                    </el-badge>
                  </div>
                </div>
                <i class="delete el-icon-close" @click="delete_item(item.name,item.id)"/>
                <i class="updata el-icon-edit" @click="updata_item(item.name,item.id)"/>
              </div>
              <div class="item" :style="{'background-color':item.color}" v-else>
                <p class="label" v-show='item.value'>{{item.value}}</p>
                <p class="time" :style="{'background-color':item.color,'opacity':'1'}">{{ item.time }}</p>
                <p class="item-content">{{ item.content }}</p>
                <div class="item-bottom">
                  <div class="left" @click="good(index,item.id,item.number)"><img src="../../assets/zhan.png" alt=""><span>{{ item.number }}</span></div>
                  <div class="name" v-if="item.img"><img class="touxiang" :src="['./PHP/touxiang/' + item.img]" alt=""><span>{{ item.name }}</span></div>
                  <div class="name" v-else><i class="el-icon-s-custom">：</i><span>{{ item.name }}</span></div>
                  <div class="right">
                    <i class="el-icon-star-off" @click="collection(item.id)"/>
                    <el-badge :value="item.comment" class="comment" >
                      <i class="el-icon-chat-dot-round" size="small"  @click="comment(item.id)"/>
                    </el-badge>
                  </div>
                </div>
                <i class="delete el-icon-close" @click="delete_item(item.name,item.id)"/>
                <i class="updata el-icon-edit" @click="updata_item(item.name,item.id)"/>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </main>
</template>

<script>
import axios from "axios";
/**
 * @description 许愿墙
 * @author youyou
 * @date 2022-01-18 09:12:00
 * @lastModifiedBy youyou
 * @lastModifiedTime 2022-02-04 14:14:00
 */

export default {
  name: "Home",
  data() {
    return {
      count: [],
      num: 9,
      gong: '',
      scroll: false,
      scrollHeight: '',
      isactive:false,
    }
  },
  created() {
    this.shuju()
    this.scroll1()
    this.getnr()
  },

  methods: {
    collection(id){
      let state = Boolean(this.$cookies.get("session") && this.$cookies.get("disdjsaddkdjksskjxcqwqw"));
      if (state) {
      axios({
        url: 'https://hzti.xyz/PHP/collection_add.php',
        method: "post",
        params: {
          name: this.$cookies.get("session"),
          rid: id,
        }
      }).then(res => {
        if (res.data == 1) {
          this.$message({
            message: 'Tips:收藏成功!',
            type: 'success'
          });
        }else{
          this.$message({
            message: 'Tips:收藏失败,请反馈!',
            type: 'error'
          });
        }
      })
      }else{
        this.$message({
          message: '错误，请先登录后再收藏!',
          type: 'error'
        });
        this.$router.push("/login");
      }
    },
    state(){
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
            this.$router.push("/login");
            this.$message({
              message: '警告，登录失效,该账号已被封禁!',
              type: 'error'
            });
            return false;
          }
        })
      }
      // 每次刷新检查账号是否被封禁结束
    },
    comment(id){
      this.$router.push("/comment/"+id);
    },
    getnr() {
      let that = this;
      setTimeout(function () {
        if (that.$store.state.text) {
          axios({
            url: 'https://hzti.xyz/PHP/content_search.php',
            method: "post",
            params: {
              content: that.$store.state.text,
            }
          }).then(res => {
            that.count = res.data;
            if (res.data) {
              sessionStorage.removeItem("search");
            }
            if (res.data.length==0){
              sessionStorage.removeItem("search");
              that.isactive=true;
            }
          })
        }
      }, 1000)
    },
    good(index,id, number) {
      let state=Boolean(this.$cookies.get("session")&&this.$cookies.get("disdjsaddkdjksskjxcqwqw"));
      if (state) {
        let name = this.$cookies.get("session");
        axios({
          url: 'https://hzti.xyz/PHP/good_search.php',
          method: "post",
          params: {
            id: id,
            name: name,
            number: number,
          }
        }).then(res => {
          if (res.data == 1) {
            this.$message({
              message: 'Tips:点赞成功！',
              type: 'success'
            });
            this.shuju();
            this.state();
          } else {
            axios({
              url: 'https://hzti.xyz/PHP/good_delete.php',
              method: "post",
              params: {
                id: id,
                name: name,
                number: number,
              }
            }).then(res => {
              if (res.data == 1) {
                this.$message({
                  message:'Tips:取消点过成功!',
                  type: 'success'
                });
                this.shuju();
                this.state();
              }
            })
          }
        })
      } else {
        this.$message({
          message: '警告，请先登录再点赞!',
          type: 'warning'
        });
      }
    },
    xy() {
      let state=Boolean(this.$cookies.get("session")&&this.$cookies.get("disdjsaddkdjksskjxcqwqw"));
      if (state) {
        this.$router.push("/form_add");
      } else {
        this.$message({
          message: '警告，请先登录再发布!',
          type: 'warning'
        });
      }
    },
    scroll1() {
      this.$nextTick(function () {
        let aa = setInterval(() => {
          let element = document.documentElement.scrollTop;
          let scroll = this.scrollHeight < element ? "有滚动条" : "无滚动条";
          this.scrollHeight = element;
          if (scroll == "有滚动条") {
            this.load()
          }
          if (this.scroll === true) {
            clearInterval(aa);
          }
        }, 2000)
      })
    },
    load() {
      setTimeout(() => {
        if (this.gong >= this.num) {
          const he = Math.round(this.gong / 6);
          this.num += he;
        } else {
          this.scroll = true;
        }
      }, 800)
    },
    shuju() {
      axios({
        url: 'https://hzti.xyz/PHP/content_query.php',
        method: "post",
      }).then(res => {
        this.count = res.data;
        this.gong = res.data.length;
      })
    },
    updata_item(name, id) {
      let state=Boolean(this.$cookies.get("session")&&this.$cookies.get("disdjsaddkdjksskjxcqwqw"));
      if (state) {
        if (name == this.$cookies.get("session")) {
          this.state();
          this.$router.push("/form_updata/" + id);
        } else {
          this.$message({
            message: '警告，不能修改别人的哦!',
            type: 'warning'
          });
        }
      } else {
        this.$message({
          message: '警告，请先登录再修改!',
          type: 'warning'
        });
      }
    },
    delete_item(name, id) {
      this.state();
      let state=Boolean(this.$cookies.get("session")&&this.$cookies.get("disdjsaddkdjksskjxcqwqw"));
      if (state) {
        if (name == this.$cookies.get("session")) {
          //发送请求
          axios({
            url: 'https://hzti.xyz/PHP/content_delete.php',
            method: "post",
            params: {
              id: id
            }
          }).then(res => {
            if (res.data == 1) {
              this.$message({
                message: '删除成功！',
                type: 'success'
              });
              this.shuju();
            }
          })
        } else {
          this.$message.error('不能删除别人的数据！');
        }
      } else {
        this.$message.error('请先登录，谢谢！');
      }
    },
    gohome(){
      location.reload();
    }
  },
}
</script>

<style lang="scss" scoped>
#main {
  width: 100%;
  height: auto;
  padding-top: 62px;
  background-size: 100% 100%;
  background: #f0f2f5;
  -webkit-touch-callout: none; /* iOS Safari */
  -webkit-user-select: none; /* Chrome/Safari/Opera */
  -khtml-user-select: none; /* Konqueror */
  -moz-user-select: none; /* Firefox */
  -ms-user-select: none; /* Internet Explorer/Edge */
  user-select: none;

  .content {
    width: 80%;
    height: 100%;
    margin: 0px auto 0 auto;

    .breadcrumb {
      height: 3vw;
      display: flex;
      align-items: center;
      padding: 0.5vw 1vw;
      /deep/.el-breadcrumb{
        font-size: 1vw;
      }
    }

    .box {
      height: 100%;

      .xy {
        display: block;
        width: 30%;
        font-size: 1vw;
        line-height: 45px;
        border-radius: 6px;
        background-color: #fff;
        text-align: center;
        margin: 0 auto;
        height: 3rem;
        letter-spacing: 1vw;
        cursor: pointer;
        color: #595b60;
        &:hover{
          background-color: #409eff;
          color: #fff;
          transition: 1.5s;
        }
      }

      .content-box {
        width: 100%;
        height: auto;
        margin-top: 2vw;
        padding-bottom: 4vw;
        background-color: transparent;

        .infinite-list {
          display: flex;
          justify-content: space-around;
          align-items: center;
          flex-wrap: wrap;

          .list-item {
            width: 32%;
            height: 16.5vw;
            margin: 2vw 0;
            &:nth-child(1){
            margin-top: 50px;
            }
            &:nth-child(2){
              margin-top: 50px;
            }
            &:nth-child(3){
              margin-top: 50px;
            }
            .item {
              width: 100%;
              height: 100%;
              border-radius: 0.5vw 0.5vw;
              background-color: #f0ad4e;
              cursor: pointer;
              transition: 0.4s;
              position: relative;


              &:hover{
                margin-top: -1vw;
                box-shadow: 0px 6px 15px #d6d6d6;
              }

              .imgbackground {
                width: 100%;
                height: 81%;
                border-radius: 6px;
              }

              .time {
                position: absolute;
                bottom: 0;
                right: 0;
                color: #333;
                font-size: 0.8vw;
                background-color: #fff;
                border-radius: 0.2vw 0 1.2vw 0.2vw;
                opacity: .7;
                padding: 0.3vw 0.3vw 13.5% 0.3vw;
                text-overflow: ellipsis;
                cursor: text;
                display: -webkit-box;
                -webkit-line-clamp: 1;
                -webkit-box-orient: vertical;
                overflow: hidden;
              }

              .item-content {
                position: absolute;
                top: 0vw;
                left: 0vw;
                text-indent: 1em;
                padding: 1.5vw 1.85vw 0 1vw;
                line-height: 23px;
                font-size: 15px;
                width: 90%;
                letter-spacing: 1.5px;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 5;
                -webkit-box-orient: vertical;
                overflow: hidden;
                cursor: text;
                user-select: text;
                color: #fff;
                white-space:normal;
                word-break:break-all;
              }

              .delete {
                position: absolute;
                right: 0.8vw;
                top: 0.6vw;
                color: #fff;
                cursor: pointer;
                font-size: 1vw;
              }

              .updata {
                position: absolute;
                right: 0.8vw;
                top: 2vw;
                color: #fff;
                cursor: pointer;
                font-size: 1vw;
              }
              .label{
                font-size: 1vw;
                position: absolute;
                right: 0.1vw;
                top: -9.7%;
                height: 7.5%;
                color: #fff;
                padding: 0 1vw;
                letter-spacing: 0.1vw;
                overflow: hidden;
                layout-flow:vertical-ideographic;
                text-align: center;
                border-radius: 4px;
                background-color: #409eff;
                opacity: .7;
              }
              .item-bottom {
                position: absolute;
                bottom: 0;
                left: 0;
                height: 20%;
                width: 100%;
                background-color: #fff;
                border-radius: 0 0 0.5vw 0.5vw;
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 1vw;

                .left {
                  text-align: center;
                  overflow: hidden;
                  flex: 1.2;

                  span, img{
                    font-size: 1.5vw;
                    width: 26px;
                    height: 26px;
                    vertical-align: middle;
                  }
                }

                .name {
                  color: #333333;
                  font-size: 1vw;
                  display: -webkit-box;
                  -webkit-line-clamp: 1;
                  -webkit-box-orient: vertical;
                  overflow: hidden;
                  text-align: center;
                  flex: 2;
                  .touxiang{
                    width: 2.5vw;
                    height: 2.5vw;
                    border-radius: 10vw;
                    vertical-align: middle;
                    margin-right: 0.3vw;
                  }

                  i {
                    letter-spacing: -0.5px;
                  }

                  span {
                    color: #d9534f;
                    letter-spacing: 0.1vw;

                  }
                }

                .right {
                  flex: 1;
                  /deep/.el-badge__content{
                    padding: 0.15vw 0.35vw;
                    font-size: 1vw;
                    border-radius: 3vw;
                  }
                  i{
                    cursor: pointer;
                    margin-left: 0.6vw;
                    font-size: 1.5vw;
                    vertical-align: middle;
                  }
                  img {
                    cursor: pointer;
                    margin-left: 1vw;
                    width: 24px;
                    height: 24px;
                    font-size: 1.5vw;
                    vertical-align: middle;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
@media (max-width: 600px) {
  #main {
    .content {
      width: 95%;
      .breadcrumb {
        padding: 2vw 1vw!important;
        /deep/.el-breadcrumb__item{
          font-size: 3vw!important;
        }
      }

      .xy {
        font-size: 4vw!important;
        width: 60% !important;
        margin: 1.5vw auto !important;
      }
      .time {
        font-size: 3vw!important;
      }
      .label{
        font-size: 3vw!important;
      }

      .updata {
        top: 6vw !important;
        font-size: 4vw!important;
      }
      .delete {
        font-size: 4vw!important;
      }


      .item-content {
        padding: 4.5vw 4vw 0 4vw !important;
        line-height: 5vw !important;
        font-size: 4.1vw!important;
      }

      .content-box {
        padding-bottom: 10vw !important;
      }

      .infinite-list .list-item {
        width: 90% !important;
        height: 55vw !important;
        margin: 5.8vw 0 3vw 0 !important;

        .item {
          border-radius: 1.5vw 1.5vw !important;
          .label{
            top: -9.5%!important;
            text-align: center;
          }
          .time {
            padding: 1.1vw 1.1vw 12vw 2vw !important;
          }

          .item-bottom {
            border-radius: 0 0 1.5vw 1.5vw !important;
            font-size: 2vw!important;
            .left {
              span, i {
                font-size: 5vw!important;
              }
            }
            .name {
              font-size: 3.5vw!important;
            }
            .right{
              flex: 1!important;
              /deep/.el-badge__content{
                margin-right: 1.3vw!important;
                padding: 0.03vw 1.5vw!important;
                font-size: 3vw!important;
              }
              img{
                width: 6.6vw!important;
                height: 6.6vw!important;
              }
              i{
                font-size: 5.6vw!important;
                margin: 0vw 2vw 0 1vw!important
              }
              .comment{
                vertical-align: top!important;
              }
            }
            .touxiang {
              width: 8.5vw!important;
              height: 8.5vw!important;
            }
          }
        }
      }
    }
  }
}
@media (min-width: 601px)and(max-width: 999px) {
  .item-content {
    padding: 3vw 0vw 0 2vw !important;
    font-size: 1vw!important;
  }
  .list-item{
    width: 46%!important;
    height: 24vw!important;
    margin: 3.5vw 0 2.5vw 0 !important;
    .updata{
      top: 2.8vw!important;
    }
    .item-bottom {
      font-size: 2.5vw !important;

      .left {
        span, i {
          font-size: 2.5vw !important;
        }
      }

      .right {
        flex: 1 !important;
        /deep/.el-badge__content{
          padding: 0.1vw 0.6vw!important;
          font-size: 1vw!important;
        }
        i {
          font-size: 2.3vw !important;
        }

        .comment {
          vertical-align: top !important;
        }
      }
    }
  }
  .label{
    top: -3vw!important;
    padding: 2px 10px!important;
  }
}
</style>