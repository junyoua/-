<template>
  <div id="comment">
    <div id="content">
      <div class="message">
        <div class="box-info" v-for="(item,index) in personal" :key="index">
          <div class="user-info">
            <div class="left">
              <img class="touxiang" :src="['../PHP/touxiang/' + item.img]" alt="" v-if="item.img">
              <i class="touxiang el-icon-s-custom" v-show="!item.img"/>
              <h4>{{ item.name }}</h4>
            </div>
            <p>{{ item.time }}</p>
            <el-tag style="margin-left: 2vw;" v-show="item.value">{{ item.value }}</el-tag>
            <i class="zhan" @click="good(item.number)"><img src="../../assets/zhan1.png" alt="" >{{ item.number }}</i>
            <i class="el-icon-view zhan"> {{ item.visit }}</i>
          </div>
          <div class="box" :style="{background:item.color}">
            <img class="bg" :src="['../PHP/uploads/' + item.imgdata]" alt="" v-if="item.imgdata">
            <p class="nr">{{ item.content }}</p>
          </div>
          <div class="msgComment">
            <p class="reply-info"><span style="color: red;">{{ msglength }}</span> 条评论</p>
            <div class="info">
              <el-input
                  type="textarea"
                  placeholder="请先登录..."
                  v-model="textarea"
                  maxlength="70"
                  show-word-limit
                  disabled
                  v-show="state==false"
              >
              </el-input>
              <el-input
                  type="textarea"
                  placeholder="请发布评论..."
                  v-model="textarea"
                  maxlength="70"
                  show-word-limit
                  v-show="state==true"
              >
              </el-input>
              <el-button class="btn" type="primary" @click="login" v-show="state==false">登 录</el-button>
              <el-button class="btn" type="primary" v-show="state==true"  @click="release">发 布</el-button>
            </div>
            <ul class="info-item">
              <div class="info-item-list" v-for="(item,index) in msg" :key="index">
                <li class="item">
                <span class="top">
                   <el-tooltip class="item" effect="dark" :content="'性别:'+item.gender+' 简介:'+item.introduction+' 邮箱:'+item.mail" placement="top-start">
                  <img class="touxiang" :src="['../PHP/touxiang/' + item.img]" alt="" v-if="item.img">
                   </el-tooltip>
                  <i class="touxiang el-icon-s-custom" v-if="!item.img"/>
                  <p>{{ item.name }}</p>
                  <p>{{ item.time }}</p>
                    <el-button type="danger" style="margin-left: auto;margin-right: 0.5vw;" v-if="item.name===session"
                               @click="delete_msg(item.id,item.rid)">删 除</el-button>
                  </span>
                  <p class="nr">{{ item.content }}</p>
                </li>
              </div>
              <div class="info-item-list" v-show="msglength==0">
                <li class="item">
                  <p style="text-align: center;margin: 6vw 0;font-size: 16px;">暂无评论...</p>
                </li>
              </div>
            </ul>
          </div>
        </div>
      </div>
      <div class="tips">
        <div class="Make-a-wish" @click="xy">
          <i class="el-icon-edit-outline xy"> 许 愿</i>
        </div>
        <div class="content">
          <h4>站长提醒 :</h4>
          <p>请各位用户，评论时采用合法言论，不能出现非法字符，以及损害他人名誉等一旦发现将会采取封号措施，请各位用户好好表现，好好珍惜!</p>
          <p>—— 站 长</p>
        </div>
        <div class="Make-a-wish" @click="about">
          <i class="el-icon-document xy"> 公 告</i>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";


export default {
  name: "Comment",
  data() {
    return {
      personal: [],
      msg: [],
      msglength: 0,
      textarea: '',
      state: false,
      visit: null,
      params: 0,
      session: null,
    }
  },
  beforeRouteLeave(to, form, next) {
    if (form.name === "Comment") {
      this.$nextTick(function () {
        this.visitupdata();
      })
    }
    next()
  },
  created() {
    this.comment_query();
    this.params = this.$route.params.id;
    this.session = this.$cookies.get("session");
    this.$nextTick(function () {
      let state = Boolean(this.$cookies.get("session") && this.$cookies.get("disdjsaddkdjksskjxcqwqw"));
      if (state) {
        this.state = true;
      }
    })
    this.userinfo();
  },
  mounted() {
    document.documentElement.scrollTop = 0;
  },
  watch: {
    msglength(newVal, oldVal) {
      if (newVal !== oldVal) {
        this.commentup();
      }
    }
  },
  methods: {
    commentup() {
      axios({
        url: 'https://hzti.xyz/PHP/comment_updata.php',
        method: "post",
        params: {
          id: this.params,
          comment: this.msglength
        }
      })
    },
    userinfo() {
      axios({
        url: 'https://hzti.xyz/PHP/comment_info.php',
        method: "post",
        params: {
          rid: this.$route.params.id
        }
      }).then(res => {
        this.personal = res.data;
        this.visit = res.data[0].visit;
      })
    },
    visitupdata() {
      this.$nextTick(function () {
        axios({
          url: 'https://hzti.xyz/PHP/comment_visitupdata.php',
          method: "post",
          params: {
            id: this.params,
            num: this.visit,
          }
        })
      })
    },
    comment_query() {
      axios({
        url: 'https://hzti.xyz/PHP/comment_query.php',
        method: "post",
        params: {
          rid: this.$route.params.id
        }
      }).then(res => {
        this.msg = res.data;
        this.msglength = this.msg.length;
      })
    },
    delete_msg(id, rid) {
      axios({
        url: 'https://hzti.xyz/PHP/comment_delete.php',
        method: "post",
        params: {
          id: id,
          rid: rid,
          name: this.session,
        }
      }).then(res => {
        let that = this;
        if (res.data === 1) {
          this.$message({
            message: 'Tips，删除成功!',
            type: 'success'
          });
          that.comment_query();
        } else {
          this.$message({
            message: '错误，删除失败,请反聩给管理员!',
            type: 'error'
          });
        }
      })
    },
    release() {
      let state = Boolean(this.$cookies.get("session") && this.$cookies.get("disdjsaddkdjksskjxcqwqw"));
      if (state) {
        if (this.textarea.trim()) {
          axios({
            url: 'https://hzti.xyz/PHP/comment_insert.php',
            method: "post",
            params: {
              rid: this.params,
              name: this.session,
              content: this.textarea,
            }
          }).then(res => {
            let that = this;
            if (res.data === 1) {
              this.$message({
                message: 'Tips，发布成功!',
                type: 'success'
              });
              that.comment_query();
              that.textarea = "";
            } else {
              this.$message({
                message: '错误，发布失败,请反聩给管理员!',
                type: 'error'
              });
            }
          })
        } else {
          this.$message({
            message: '错误，发布内容不能为空白!',
            type: 'error'
          });
        }
      } else {
        this.$message({
          message: '错误，请先登录!',
          type: 'error'
        });
        this.$router.push("/login");
      }
    },
    xy() {
      let state = Boolean(this.$cookies.get("session") && this.$cookies.get("disdjsaddkdjksskjxcqwqw"));
      if (state) {
        this.$router.push("/form_add");
      } else {
        this.$message({
          message: '警告，请先登录!',
          type: 'warning'
        });
        this.$router.push("/login");
      }
    },
    about() {
      this.$router.push("/about");
    },
    login() {
      this.$router.push("/login");
    },
    good(number) {
      let state = Boolean(this.$cookies.get("session") && this.$cookies.get("disdjsaddkdjksskjxcqwqw"));
      if (state) {
        let name = this.$cookies.get("session");
        axios({
          url: 'https://hzti.xyz/PHP/good_search.php',
          method: "post",
          params: {
            id: this.params,
            name: name,
            number: number,
          }
        }).then(res => {
          if (res.data == 1) {
            this.$message({
              message: 'Tips:点赞成功！',
              type: 'success'
            });
            this.userinfo();
          } else {
            axios({
              url: 'https://hzti.xyz/PHP/good_delete.php',
              method: "post",
              params: {
                id: this.params,
                name: name,
                number: number,
              }
            }).then(res => {
              if (res.data == 1) {
                this.$message({
                  message:'Tips:取消点过成功!',
                  type: 'success'
                });
                this.userinfo();
              }
            })
          }
        })
      } else {
        this.$message({
          message: '警告，请先登录再点赞!',
          type: 'warning'
        });
        this.$router.push("/login");
      }
    },
  },
}
</script>

<style lang="scss" scoped>
#comment {
  padding: 60px 0;
  height: auto;
  background-color: #f0f2f5;
  zoom: 1;
  min-width: 1034px;

  &::after {
    content: "";
    height: 0;
    font-size: 0;
    display: block;
    clear: both;
    visibility: hidden;
  }

  #content {
    width: 85%;
    height: auto;
    margin: 2% auto;
    border-radius: 3px;
    position: relative;
    zoom: 1;


    &::after {
      content: "";
      height: 0;
      font-size: 0;
      display: block;
      clear: both;
      visibility: hidden;
    }

    .message {
      width: 73.2%;
      height: auto;
      background-color: #f0f2f5;
      border-radius: 4px;
      float: left;

      .box-info {
        width: 100%;
        height: auto;
        border-radius: 4px;

        .user-info {
          display: flex;
          align-items: center;
          justify-content: left;
          width: 100%;
          height: 4vw;
          font-size: 1vw;
          background-color: #fff;
          border-bottom: 2px solid #eee;
          border-radius: 4px;

          .left {
            display: flex;
            align-items: center;
            height: 100%;
            margin: 0 4vw 0 2vw;

            h4 {
              margin: 0 1vw;
            }

            img {
              width: 3.5vw;
              height: 3.5vw;
              border-radius: 0.2vw;
            }
          }

          .zhan {
            flex: 1;
            text-align: right;
            font-size: 1.7vw;
            padding-right: 3vw;
            cursor: pointer;
            color: #555;
            img{
              width: 30px;
              height: 30px;
              vertical-align: sub;
            }
          }
        }

        .box {
          min-height: 20vw;
          overflow: hidden;
          border-radius: 0 0 4px 4px;

          .bg {
            width: 100%;
            height: 40vw;
            display: block;
            overflow: hidden;
            transition: 1.3s;
            cursor: pointer;
            &:hover{
              transform:scale(1.2);
            }
          }

          .nr {
            position: absolute;
            top: 4vw;
            left: 0;
            text-indent: 2em;
            margin: 1vw 0;
            font-size: 1.5vw;
            color: #409eff;
          }
        }

        .msgComment {
          margin: 1vw 0 0 0;
          height: auto;
          border-radius: 4px;
          background-color: #fff;
          overflow: hidden;

          .reply-info {
            height: 3.5vw;
            line-height: 3.5vw;
            padding-left: 2vw;
            letter-spacing: 1px;
            font-size: 1vw;
            font-weight: bold;
            border-bottom: 1px solid #eee;
          }

          .info {
            padding: 1vw 1vw;

            /deep/ .el-textarea {
              width: 90%;
              vertical-align: middle;
            }
            /deep/.el-button,/deep/ .el-button{
             margin-left: 0.5vw;
            }

          }

          .info-item {
            .item {
              height: auto;
              border-top: 1px solid #eee;
              border-bottom: 1px solid #eee;
              font-size: 1vw;
              margin-top: 0.5vw;
              cursor: pointer;
              transition: 1.5s;

              &:hover {
                background-color: #409EFF;
                color: #fff;
              }

              &:hover .nr {
                color: #fff;
              }

              .nr {
                text-indent: 2em;
                margin: 0.6vw 0 1vw 0;
                color: #666666;
                padding: 0 0.5vw;
              }

              .top {
                display: flex;
                align-items: center;
                justify-content: left;
                padding: 1vw 1vw 0.3vw 2.3vw;

                .touxiang {
                  width: 2.5vw;
                  height: 2.5vw;
                  border-radius: 10vw;
                  vertical-align: middle;
                  margin-right: 0.3vw;
                  line-height: 2.5;
                  &:before{
                    margin-left: 0.8vw;
                  }
                }

                p {
                  margin: 0 3vw 0 0;

                  &:nth-child(3) {
                    margin: 0 0.4vw 0 0.3vw;
                  }
                }
              }
            }
          }
        }
      }
    }


    .tips {
      width: 26%;
      height: auto;
      border-radius: 4px;
      float: right;
      position: sticky;
      top: 60px;
      left: 0;

      .Make-a-wish {
        height: 4.5vw;
        background-color: #fff;
        border-radius: 4px;

        .xy {
          display: block;
          text-align: center;
          line-height: 4.5vw;
          letter-spacing: 3px;
          border-radius: 4px;
          font-size: 1vw;
          cursor: pointer;
          transition: 1.5s;

          &:hover {
            background-color: #8cc4fd;
            color: #ffffff;
          }
        }
      }

      .content {
        height: auto;
        background-color: #fff;
        overflow: hidden;
        padding: 0 0.5vw;
        font-size: 1vw;
        transition: 1.3s;
        cursor: pointer;
        border-radius: 4px;
        margin: 0.5vw 0;

        &:hover {
          background-color: #8cc4fd;
          color: #ffffff;

          p {
            color: #fff5f5;

            &:last-child {
              color: #eee;
            }
          }
        }

        h4 {
          margin-top: 1.7vw;
          font-size: 1.2vw;
        }

        p {
          margin: 1.7vw 0;
          text-indent: 2em;
          color: red;

          &:last-child {
            margin: 30px 0 20px 0;
            text-align: right;
            letter-spacing: 1px;
            color: #333;
          }
        }
      }
    }
  }
}

@media (max-width: 600px) {
  #comment {
    min-width: auto !important;
    padding: 55px 0 15px 0 !important;

    #content {
      width: 95% !important;
      margin: 5vw auto !important;
      min-height: auto !important;

      .user-info {
        height: 13vw !important;
        font-size: 3.7vw !important;
        .zhan{
          font-size: 4.5vw !important;
          text-align: center!important;
          padding: 1.5vw!important;
        }

        .left {
          margin: 0 0 0 4vw !important;
          h4{
            width: 51px!important;
            white-space: nowrap!important;
            text-overflow: ellipsis;
            overflow: hidden!important;
          }

          img {
            width: 8vw !important;
            height: 8vw !important;
            border-radius: 1vw !important;
          }
        }
        p{
          width: 27%;
          white-space: nowrap;
          text-overflow: ellipsis;
          overflow: hidden;
        }
      }

      .box {
        .bg {
          height: 80vw !important;
        }

        .nr {
          top: 16vw !important;
          font-size: 4.5vw !important;
        }
      }

      .msgComment {
        margin: 4vw 0 !important;

        .reply-info {
          height: 12vw !important;
          line-height: 12vw !important;
          padding-left: 5vw !important;
          font-size: 4vw !important;
        }

        .info {
          margin-top: 13px !important;
          /deep/.el-button,/deep/ .el-button{
            margin-left: 1.1vw!important;
          }
        }

        /deep/ .el-textarea {
          width: 77.6% !important;
        }

        /deep/ .el-textarea__inner {
          height: 80px !important;
        }

        .item {
          margin-top: 1.5vw !important;

          .top {
            font-size: 3.6vw !important;
            padding: 1.6vw 1vw 0.5vw 2.3vw !important;

            .touxiang {
              width: 8vw !important;
              height: 8vw !important;
              line-height: 2!important;
              &:before{
                margin-left: 2.5vw!important;
              }
            }
          }

          .nr {
            font-size: 3.7vw !important;
            text-indent: 3em !important;
            margin: -0.5vw 0 3.5vw 0!important;
          }
        }
      }
    }
  }

}

@media (max-width: 1200px) {
  .message {
    width: 100% !important;
    transition: 1.5s;
  }
  .tips {
    display: none;
  }
  .touxiang {
    line-height: 2.4vw!important;
  }
}
</style>