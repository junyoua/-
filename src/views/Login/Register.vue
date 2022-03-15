<template>
  <div class="login">
    <div class="login-box">
      <h2 class="login-a" @click="goLogin">登录</h2>
      <h2>注册</h2>
      <form>
        <div class="user-box">
          <input type="text" v-model="nr.text" @blur="tip" required="">
          <label>Username</label>
        </div>
        <div class="user-box">
          <input type="password" v-model="nr.pwd" @keyup.enter="common" @blur="tip_pwd" required="">
          <label>Password</label>
        </div>
        <div class="zce" @click="common">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
          Submit
        </div>
      </form>
    </div>
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

import axios from "axios";

export default {
  name: "Register",
  data() {
    return {
      nr: {text: '', pwd: ''},
      res: '',
    }
  },
  methods: {
    goLogin() {
      this.$router.push("./login");
    },
    tip() {
      let that = this;
      let username = /^[a-zA-Z0-9\u4e00-\u9fa5]{3,12}$/;
      if (username.test(this.nr.text) == false) {
        this.$message({
          message: 'Ts：账号至少3位!中文字母数字都可以!',
          type: 'error'
        });
      } else {
        axios({
          url: 'https://hzti.xyz/PHP/user_search.php',
          method: "POST",
          params: {
            text: this.nr.text,
          }
        }).then(res => {
          that.res = res.data
        })
      }
    },
    tip_pwd() {
      // eslint-disable-next-line no-useless-escape
      let password = /^[a-z0-9A-Z\.]{6,14}$/;
      if (password.test(this.nr.pwd) == false) {
        this.$message({
          message: 'PwTs：必须字母和数字组成，至少6位！',
          type: 'error'
        });
      } else {
        this.$message({
          message: 'PwTs：密码格式正确！',
          type: 'success'
        });
      }
    },
    common() {
      let that = this;
      let username = /^[a-zA-Z0-9\u4e00-\u9fa5]{3,12}$/;
      // eslint-disable-next-line no-useless-escape
      let password = /^[a-z0-9A-Z\.]{6,14}$/;
      if (username.test(this.nr.text) == true && password.test(this.nr.pwd) == true) {
        axios({
          url: 'https://hzti.xyz/PHP/user.php',
          method: "post",
          params: {
            name: this.nr.text,
            password: this.nr.pwd
          }
        }).then(res => {
          if (res.data == 1) {
            this.$message({
              message: 'Ts：账号注册成功！',
              type: 'success'
            });
            let time = setInterval(function () {
              that.$router.push("./login");
              clearInterval(time);
            }, 1600)

          } else {
            this.$message({
              message: 'Ts：账号注册失败,请反聩给管理员！',
              type: 'error'
            });
          }
        })

      } else {
        this.$message({
          message: 'PwTs：必须字母和数字组成，至少6位！',
          type: 'error'
        });
      }
    }
  },
  watch: {
    res(newName) {
      if (newName == '1') {
        this.$message({
          message: 'Ts：账号已经有了!',
          type: 'error'
        });
      } else {
        this.$message({
          message: 'Ts：账号格式正确!',
          type: 'success'
        });
      }
    }
  }
}
</script>

<style>
#nprogress  .bar {
  display: none;
}
html {
  height: 100%;
}

body {
  margin: 0;
  padding: 0 !important;;
  font-family: sans-serif;
}

.login {
  width: 100%;
  height: 100vh;
  background: #223750;
}

.login-box {
  position: fixed;
  top: 50%;
  left: 50%;
  width: 375px;
  padding: 40px;
  transform: translate(-50%, -50%);
  background: #0b111a;
  box-sizing: border-box;
  box-shadow: 0 15px 25px rgba(0, 0, 0, .6);
  border-radius: 10px;
}

.login-a {
  position: absolute;
  right: 3.25vh;
  top: 2vh;
  font-size: 2.7vh;
  cursor: pointer;
  background-color: #223750;
  border-radius: 1.5vh;
  padding: 7px 15px 10px 15px !important;
}

.login-box h2 {
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: center;
}

.login-box .user-box {
  position: relative;
}

.login-box .user-box input {
  width: 100%;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  margin-bottom: 30px;
  border: none;
  border-bottom: 1px solid #fff;
  outline: none;
  background: transparent;
}

.login-box .user-box label {
  position: absolute;
  top: 0;
  left: 0;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  pointer-events: none;
  transition: .5s;
}

.login-box .user-box input:focus ~ label,
.login-box .user-box input:valid ~ label {
  top: -20px;
  left: 0;
  color: #03e9f4;
  font-size: 12px;
}

.login-box form .zce {
  position: relative;
  display: inline-block;
  padding: 10px 20px;
  color: #03e9f4;
  font-size: 16px;
  text-decoration: none;
  text-transform: uppercase;
  overflow: hidden;
  transition: .5s;
  margin-top: 40px;
  letter-spacing: 4px;
  cursor: pointer;
}

.login-box .zce:hover {
  background: #03e9f4;
  color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 5px #03e9f4,
  0 0 25px #03e9f4,
  0 0 50px #03e9f4,
  0 0 100px #03e9f4;
}

.login-box .zce span {
  position: absolute;
  display: block;
}

.login-box .zce span:nth-child(1) {
  top: 0;
  left: -100%;
  width: 100%;
  height: 2px;
  background: linear-gradient(90deg, transparent, #03e9f4);
  animation: btn-anim1 1s linear infinite;
}

@keyframes btn-anim1 {
  0% {
    left: -100%;
  }
  50%, 100% {
    left: 100%;
  }
}

.login-box .zce span:nth-child(2) {
  top: -100%;
  right: 0;
  width: 2px;
  height: 100%;
  background: linear-gradient(180deg, transparent, #03e9f4);
  animation: btn-anim2 1s linear infinite;
  animation-delay: .25s
}

@keyframes btn-anim2 {
  0% {
    top: -100%;
  }
  50%, 100% {
    top: 100%;
  }
}

.login-box .zce span:nth-child(3) {
  bottom: 0;
  right: -100%;
  width: 100%;
  height: 2px;
  background: linear-gradient(270deg, transparent, #03e9f4);
  animation: btn-anim3 1s linear infinite;
  animation-delay: .5s
}

@keyframes btn-anim3 {
  0% {
    right: -100%;
  }
  50%, 100% {
    right: 100%;
  }
}

.login-box .zce span:nth-child(4) {
  bottom: -100%;
  left: 0;
  width: 2px;
  height: 100%;
  background: linear-gradient(360deg, transparent, #03e9f4);
  animation: btn-anim4 1s linear infinite;
  animation-delay: .75s
}

@keyframes btn-anim4 {
  0% {
    bottom: -100%;
  }
  50%, 100% {
    bottom: 100%;
  }
}

.el-alert {
  width: 60%;
  margin: 0 auto;
}
@media (max-width: 600px) {
  .login-box{
    width: 100%!important;
  }
}
</style>