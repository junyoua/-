<template>
  <footer id="Footer">
    <!--返回顶部-->
    <el-backtop  :visibility-height="60" style="right: 5vw;bottom:45px;" >
      <i class="el-icon-caret-top"></i>
    </el-backtop>
    <!--pc端底部-->
    <div class="center pc">
      <div class="top">
        <ul>
          <li>
            <el-tooltip class="item" effect="dark" content="关于许愿墙" placement="top">
              <el-button class="hover">关于许愿墙</el-button>
            </el-tooltip>
          </li>
          <li>
            <el-tooltip class="item" effect="dark" content="采用element组件" placement="top">
              <el-button class="hover"><i class="el-icon-eleme">采用element组件</i></el-button>
            </el-tooltip>
          </li>
          <li>
            <el-popover
                class="hover"
                placement="top-start"
                title="移动端"
                width="200"
                trigger="hover"
                content="兼容移动端是必不可少的.">
              <el-button slot="reference"><i class="el-icon-mobile">兼容移动端</i></el-button>
            </el-popover>
          </li>
          <li><i class="el-icon-loading"></i></li>
        </ul>
      </div>
      <div class="content">
        <div class="left">
          <ul class="ul">
            <li>
              <span>联系我们</span>
              <ol class="ol">
                <li>联系站长</li>
                <li @click="xy">我要许愿</li>
                <li>支持许愿墙</li>
              </ol>
            </li>
            <li>
              <span>了解我们</span>
              <ol class="ol">
                <li>许愿墙</li>
                <li>愿望</li>
                <router-link to='/about'>
                  <li>公告</li>
                </router-link>
                <router-link to='/feedback'>
                <li>反馈</li>
                </router-link>
              </ol>
            </li>
            <li>
              <span>网站功能</span>
              <ol class="ol">
                <li @click="xy">支持发布内容</li>
                <router-link to='/login'>
                  <li>支持登录</li>
                </router-link>
                <router-link to='/register'>
                  <li>支持注册</li>
                </router-link>
              </ol>
            </li>
          </ul>
          <p class="bottom">
            <img src="https://dcdn.it120.cc/2022/01/23/d53533de-8bde-4e43-9575-ebcafdb0efe7.png" alt="">
            <a href="https://beian.miit.gov.cn/#/Integrated/index">粤ICP备2021155124号-1</a>
          </p>
        </div>
        <div class="right">
          <img src="https://dcdn.it120.cc/2021/11/15/fd8135c7-849a-4416-9171-74df20522abf.png" alt="">
          <p>Copyright © 2021 - 2022 HZTI.XYZ. All Rights Reserved. </p>
        </div>
      </div>
    </div>
    <!--移动端底部-->
    <div class="phone" style="padding: 0 3vw;overflow: hidden; ">
      <div class="center" style="width: 100%;">
        <div class="top">
          <ul>
            <li>
              <el-tooltip class="item" effect="dark" content="关于许愿墙" placement="top">
                <el-button class="hover">关于许愿墙</el-button>
              </el-tooltip>
            </li>
            <li>
              <el-tooltip class="item" effect="dark" content="采用element组件" placement="top">
                <el-button class="hover"><i class="el-icon-eleme">采用element组件</i></el-button>
              </el-tooltip>
            </li>
            <li>
              <el-popover
                  class="hover"
                  placement="top-start"
                  title="移动端"
                  width="200"
                  trigger="hover"
                  content="兼容移动端是必不可少的.">
                <el-button slot="reference"><i class="el-icon-mobile">兼容移动端</i></el-button>
              </el-popover>
            </li>
            <li><i class="el-icon-loading"></i></li>
          </ul>
        </div>
      </div>
      <el-collapse v-model="activeName" accordion disabled>
        <el-collapse-item title="一致性 Consistency" name="1">
          <div>在界面中一致：所有的元素和结构需保持一致。</div>
          <div>与现实生活一致：与现实生活的流程、逻辑保持一致，遵循用户习惯的语言和概念。</div>
        </el-collapse-item>
        <el-collapse-item title="了解我们 Know us" name="2">
          <div>我们支持：许愿墙,愿望,公告,反馈</div>
          <div>控制反馈：通过界面样式和交互动效让用户可以清晰的感知自己的操作；</div>
          <div>页面反馈：操作后，通过页面元素的变化清晰地展现当前状态。</div>
        </el-collapse-item>
        <el-collapse-item title="网站功能 Function" name="3">
          <div>简化流程：设计简洁直观的操作流程；</div>
          <div>基本功能：支持发布;支持登录;支持注册;</div>
          <div>清晰明确：语言表达清晰且表意明确，让用户快速理解进而作出决策；</div>
          <div>帮助用户识别：界面简单直白，让用户快速识别而非回忆，减少用户记忆负担。</div>
        </el-collapse-item>
        <el-collapse-item title="可控 Controllability" name="4">
          <div>用户决策：根据场景可给予用户操作建议或安全提示，但不能代替用户进行决策；</div>
          <div>结果可控：用户可以自由的进行操作，包括撤销、回退和终止当前操作等。</div>
        </el-collapse-item>
      </el-collapse>
      <p class="bottom">
        <img src="https://dcdn.it120.cc/2022/01/23/d53533de-8bde-4e43-9575-ebcafdb0efe7.png" alt="">
        <a href="https://beian.miit.gov.cn/#/Integrated/index">粤ICP备2021155124号-1</a>
      </p>
    </div>
  </footer>
</template>

<script>
import $ from "jquery"
/**
 * @description 许愿墙
 * @author youyou
 * @date 2022-01-18 09:12:00
 * @lastModifiedBy youyou
 * @lastModifiedTime 2022-02-04 14:14:00
 */
export default {
  name: "Footer",
  data() {
    return {
      activeName: ['0']
    }
  },
  created() {
    this.$nextTick(function () {
      if ($(".el-collapse-item__header")) {
        $(".el-collapse-item__header").css({
          "background-color": "transparent",
          "color": "#333"
        });
        $(".el-collapse-item__wrap").css("background-color", "rgb(254 253 252)");
        $(".el-collapse-item__content").css("color", "#aaa");
      }
    })
  },
  methods: {
    xy(){
      let state=Boolean(this.$cookies.get("session")&&this.$cookies.get("disdjsaddkdjksskjxcqwqw"));
      if (state) {
        this.$router.push("/form_add");
      }else{
        this.$message({
          message: '警告，请登录后再点击!',
          type: 'warning'
        });
      }
    }
  }
}
</script>

<style lang="scss" scoped>
$color: #409eff;
$textcolor: #8cc4fd;
$bgcolor: #fcfafa;
*{
  text-decoration: none;
}
#Footer {
  width: 100%;
  height: 100%;
  background-color: $bgcolor;

  .center {
    width: 80%;
    height: auto;
    background-color: $bgcolor;
    margin: 0 auto;

    .top {
      width: 100%;
      height: 6vw;
      display: block;
      color: #333;
      border-bottom: 1px solid #eeeeee;

      ul {
        display: flex;
        height: 100%;
        align-items: center;
        overflow: hidden;
        justify-content: space-between;

        li {

          &:hover {
            color: $color;
            cursor: pointer;
          }
          /deep/.el-icon-loading{
            font-size: 1vw;
          }
          i:before {
            padding-right: 0.2vw;
          }

          .el-icon-loading:before {
            padding-right: 0;
          }
          button{
            font-size: 1vw;
          }

          .hover {
            border: none;
            background-color: transparent;

            button {
              border: none;
              font-size: 1vw;
              background-color: transparent;
            }
          }
        }
      }
    }

    .content {
      width: 100%;
      height: 30vw;
      display: flex;
      justify-content: space-around;
      align-items: center;

      .left {
        flex: 1;
        height: 100%;
        padding-left: 1.6vw;

        .ul {
          display: flex;
          margin-top: 1vw;

          li {
            flex: 1;

            &:last-child {
              flex: 1.3;
            }

            span {
              color: #5f6464;
              font-size: 1.3vw;
              text-align: center;
              font-weight: bold;
            }

            ol {
              margin-top: 1vw;

              li {
                color: #5f6464;
                font-size: 1vw;
                margin: 1.3vw 0;
                cursor: pointer;

                &:hover {
                  color: $color;
                }
              }
            }
          }
        }

        .bottom {
          font-size: 1vw;
          text-align: center;
          margin-top: 10.9vw;
          margin-left: -2.5vw;

          img {
            vertical-align: middle;
            width: 1vw;
            height: 1vw;
          }

          a {
            text-decoration: none;
            color: #5f6464;
            margin-left: 0.2vw;
            vertical-align: middle;
          }
        }
      }

      .right {
        flex: 1;
        height: 100%;
        font-size: 1vw;

        img {
          display: block;
          width: 20vw;
          height: 20vw;
          margin: 2vw auto 3.2vw auto;
        }

        p {
          text-align: center;
          color: #5f6464;
        }
      }
    }
  }
}

@media (max-width: 600px) {
  .pc {
    display: none;
  }
  #Footer .center .top {
    height: 11vw;
    i{
      font-size: 3vw!important;
    }
    .el-icon-loading{
      font-size: 3vw!important;
    }
    button {
      font-size: 3vw !important;
    }

    .hover {
      margin: 0;
      padding: 0vw 1.8vw;

      button {
        padding: 0vw 1.8vw;
        font-size: 4vw!important;
        span{
          font-size: 4vw!important;
        }
      }

    }
  }
  .bottom {
    font-size: 16px;
    text-align: center;
    margin: 5vw;

    img {
      vertical-align: middle;
    }

    a {
      text-decoration: none;
      color: #5f6464;
      margin-left: 0.2vw;
      vertical-align: middle;
    }
  }
}

@media (min-width: 601px) {
  .phone {
    display: none;
  }

}
@media (min-width: 601px)and(max-width: 1000px) {
  .bottom {
    margin-top: 8vw!important;
  }
}
</style>