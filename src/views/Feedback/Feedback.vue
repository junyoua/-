<template>
  <div id="feedback">
    <div class="feedback-box">
      <div class="top">
        <p>反 馈</p>
      </div>
      <div class="textarea">
      <el-input
          type="textarea"
          placeholder="请输入需要反馈的内容"
          v-model="textarea"
          maxlength="100"
          show-word-limit
      >
      </el-input>
      </div>
      <div class="btn">
      <el-button type="primary" icon="el-icon-check" @click="submit" v-if="isShow==false" round> 提 &nbsp;交</el-button>
      <el-button type="primary" icon="el-icon-check" disabled :loading="true"  round v-else> 提 &nbsp;交&nbsp;中</el-button>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "feedback",
  data(){
    return{
      textarea:'',
      isShow:false,
    }
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
 methods:{
   submit(){
     let state=Boolean(this.$cookies.get("session")&&this.$cookies.get("disdjsaddkdjksskjxcqwqw"));
     if (state&&this.textarea.trim()&&this.textarea.length>10) {
       this.isShow=true;
       axios({
         url: 'https://hzti.xyz/PHP/feedback.php',
         method: "post",
         params: {
           name: this.$cookies.get("session"),
           content:this.textarea,
         }
       }).then(res => {
         if(res.data===1){
           this.$message({
             message: 'Tips:反馈提交成功，感谢反馈！',
             type: 'success'
           });
           this.$router.push("/");
         }else{
           this.$message({
             message: 'Tips:提交失败，请反馈！',
             type: 'error'
           });
         }
       })
     }else {
       this.$message({
         message: 'Tips:提交失败，内容不能少于10个字！',
         type: 'error'
       });
     }
   }
 }
}
</script>

<style lang="scss" scoped>
 #feedback{
   padding: 70px 0 10px 0;
   background-color: #f0f2f5;
   position: relative;
   min-height: 100vh;
   .feedback-box{
     position: absolute;
     top: 50%;
     left: 50%;
     margin-top: -18%;
     margin-left: -45%;
     width: 90%;
     height:auto;
     background-color: #fff;
     overflow: hidden;
     border-radius: 5px;
     .top{
       width: 100%;
       height: 4vw;
       border-bottom: 1px solid #eeeeee;
       p{
         font-size: 1.3vw;
         line-height: 4vw;
         padding: 0 3vw;
         font-weight: bold;
         letter-spacing: 0.5vw;
       }
     }
     .textarea{
       padding: 5vw 2%;

     /deep/.el-textarea{
       height: 10vw;
     }
     /deep/.el-textarea__inner{
       height: 100%;
     }
     }
     .btn{
       margin: 3vw auto 5vw auto ;
       text-align: center;
      button{
        text-align: center;
      }
     }
   }
 }

@media (max-width: 600px) {
  #feedback {
    .feedback-box {
      margin-top: -50%!important;
      .top {
        height: 13vw !important;

        p {
          line-height: 13vw !important;
          padding: 0 5vw !important;
          font-size: 3.5vw !important;
        }
      }
      .textarea{
          padding: 10vw 2%!important;
      }
      /deep/.el-textarea {
        height: 36vw !important;
      }

      .btn {
        margin: 6vw auto 10vw auto!important;
      }
    }
  }
}
</style>