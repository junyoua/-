<template>
  <div id="Collection">
    <div class="box">
      <div class="title">
        <h2>我的收藏</h2>
      </div>
      <div v-for="(item,index) in data" :key="index" class="collection-box" :style="{'background-color':item.color}">
        <div class="top">
          <div style="display: flex;align-items: center;">
            <img v-if="item.img" :src="['./PHP/touxiang/' + item.img]" alt="">
            <h4>{{ item.name }}</h4>
          </div>
          <el-button class="btn" type="primary" v-if="item.value">{{ item.value }}</el-button>
          <p>评论:{{ item.comment }}</p>
          <p>点赞:{{ item.number }}</p>
          <p>{{ item.time }}</p>
          <el-button type="danger" icon="el-icon-delete" @click="collection_delete(item.rid)" circle></el-button>
        </div>
        <div class="content">
          <p>{{ item.content }}</p>
          <img class="imgbg" v-if="item.imgdata" :src="['./PHP/uploads/' + item.imgdata]" alt="">
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Collection",
  data() {
    return {
      data: [],
    }
  },
  created() {
    this.collection_data();
  },
  mounted() {
    document.documentElement.scrollTop = 0;
    let state=Boolean(this.$cookies.get("session")&&this.$cookies.get("disdjsaddkdjksskjxcqwqw"));
    if (!state) {
      this.$message({
        message: 'Tips:请先登录，谢谢！',
        type: 'error'
      });
      this.$router.push("/login");
    }
  },
  methods: {
    collection_data() {
      axios({
        url: 'https://hzti.xyz/PHP/collection_query.php',
        method: "post",
        params: {
          name: this.$cookies.get("session")
        }
      }).then(res => {
        this.data = res.data;
      })
    },
    collection_delete(rid) {
      axios({
        url: 'https://hzti.xyz/PHP/collection_delete.php',
        method: "post",
        params: {
          rid: rid,
          name: this.$cookies.get("session")
        }
      }).then(res => {
        if (res.data == 1) {
          this.$message({
            message: 'Tips:删除成功!',
            type: 'success'
          });
          this.collection_data();
        } else {
          this.$message({
            message: 'Tips:删除失败，请反馈!',
            type: 'error'
          });
        }
      })
    }
  }
}
</script>

<style lang="scss" scoped>
#Collection {
  $color: #409eff;
  padding: 80px 0;
  background-color: #f4f4f4;

  .box {
    width: 90%;
    margin: 0 auto;

    .title {
      width: 100%;
      height: 4vw;
      background-color: #fff;
      text-align: center;
      font-size: 1vw;
      line-height: 4vw;
      color: $color;
      letter-spacing: 1vw;
      border-radius: 5px;
      cursor: pointer;
      transition: 3s;

      &:hover {
        background-color: $color;
        color: #fff5f5;
      }
    }

    .collection-box {
      margin: 1vw 0;
      width: 100%;
      border-radius: 5px;
      height: 30vw;
      overflow: hidden;
      background-color: $color;
      border: 1px solid #F56C6C;

      .top {
        display: flex;
        align-items: center;
        justify-content: space-around;
        font-size: 1vw;
        height: 3.5vw;
        background-color: #fff;
        opacity: .93;
        color: $color;
        cursor: pointer;
        transition: 1.5s;

        &:hover {
          background-color: #e6a23c;
        }

        img {
          width: 3vw;
          height: 3vw;
          border-radius: 3px;
        }
      }

      .content {
        height: 89%;
        position: relative;
        overflow: hidden;

        p {
          position: absolute;
          top: 0;
          left: 0;
          z-index: 1;
          font-size: 2vw;
          letter-spacing: 1px;
          text-indent: 2em;
          line-height: 4vw;
        }

        .imgbg {
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          cursor: pointer;
          transition: 3s;

          &:hover {
            transform: scale(1.2);
          }
        }
      }
    }
  }
}

@media (max-width: 600px) {
  .title {
    font-size: 3vw!important;
    height: 12vw !important;
    line-height: 12vw !important;
  }
  .collection-box {
    margin: 2vw 0 !important;
    height: 60vw !important;

    .top {
      font-size: 3.2vw !important;
      height: 12vw !important;

      .btn {
        display: none;
      }

      img {
        width: 9vw !important;
        height: 9vw !important;
      }
    }

    .content {
      p {
        font-size: 4vw!important;
        line-height: 8vw!important;
      }
    }
  }
}

@media (min-width: 601px) and(max-width: 1150px) {
  .collection-box {
    margin: 2vw 0 !important;
    height: 40vw !important;

    .top {
      height: 6.5vw !important;
    }
  }
}
</style>