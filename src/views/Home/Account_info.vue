<template>
  <div class="account">
    <div class="account-box" v-for="(item,index) in info" :key="index">
      <div class="top">
        <el-upload
            class="avatar-uploader"
            action="https://hzti.xyz/PHP/user_img.php"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload">
          <img v-if="imageUrl" :src="imageUrl" class="avatar">
          <i v-else class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
        <h2>{{ item.username }}</h2>
      </div>
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span>信息</span>
          <el-button @click.native="change" style="float: right; padding: 3px 0" type="text"><i
              class="el-icon-edit-outline"/> 编辑
          </el-button>
        </div>
        <keep-alive>
          <div class="info" v-if="isActive==true">
            <el-form ref="form" label-width="80px" label-position="left">
              <el-form-item label="性别">
                <p>{{ item.gender }}</p>
                <p v-if="item.gender==''||item.gender==null">暂无</p>
              </el-form-item>
              <el-form-item label="简介">
                <p>{{ item.introduction }}</p>
                <p v-if="item.introduction==null||item.introduction==''">暂无</p>
              </el-form-item>
              <el-form-item label="状态">
                <p>{{ item.state }}</p>
                <p v-if="item.state==null||item.state==''">暂无</p>
              </el-form-item>
              <el-form-item label="邮箱">
                <p>{{ item.mail }}</p>
                <p v-if="item.mail==null||item.mail==''">暂无</p>
              </el-form-item>
              <el-form-item label="注册时间">
                <p>{{ item.time }}</p>
              </el-form-item>
            </el-form>
          </div>
          <div class="info" v-else>
            <el-form ref="form" label-width="80px" label-position="left">
              <el-form-item label="性别">
                <el-select v-model="value" placeholder="请选择">
                  <el-option
                      v-for="(item,index) in cities"
                      :value="item.value "
                      :key="index"
                      :label="item.label">
                    <span style="float: left">{{ item.label }}</span>
                    <span style="float: right; color: #8492a6; font-size: 13px">{{ item.value }}</span>
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="简介">
                <el-input
                    type="textarea"
                    autosize
                    maxlength="35"
                    placeholder="请输入内容"
                    v-model="textarea">
                </el-input>
              </el-form-item>
              <el-form-item label="状态">
                <el-radio-group v-model="radio">
                  <el-radio :label="1">在学校</el-radio>
                  <el-radio :label="2">求职中</el-radio>
                  <el-radio :label="3">已工作</el-radio>
                </el-radio-group>
              </el-form-item>
              <el-form-item label="邮箱">
                <el-input v-model="mail" maxlength="18" placeholder="请输入邮箱"></el-input>
              </el-form-item>
              <el-form-item label="注册时间">
                <p>{{ item.time }}</p>
              </el-form-item>
              <div class="bottom">
                <el-button @click="change">取消</el-button>
                <el-button type="primary" @click="modify">修改</el-button>
              </div>
            </el-form>
          </div>
        </keep-alive>
      </el-card>
    </div>
  </div>
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
  name: "Account_info",
  data() {
    return {
      cities: [{
        value: 'male',
        label: '男'
      }, {
        value: 'woman',
        label: '女'
      }],
      value: '',
      radio: 1,
      textarea: '',
      mail: '',
      isActive: true,
      info: [],
      imageUrl: '',
    }
  },
  created() {
   this.grinfo();
  },
  methods: {
    grinfo(){
      let name =this.$cookies.get("session");
      if (name) {
        axios({
          url: 'https://hzti.xyz/PHP/info_search.php',
          method: "POST",
          params: {
            text: name
          }
        }).then(res => {
          this.info = res.data;
          this.textarea = res.data[0].introduction;
          this.mail = res.data[0].mail;
          this.value = res.data[0].gender;
          if (res.data[0].img){
            this.imageUrl = './PHP/touxiang/'+res.data[0].img;
          }
        })
      } else {
        this.$message({
          message: 'Ts：请先登录！',
          type: 'error'
        });
        this.$router.push("/login");
      }
    },
    // 图片上传
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
      if(file.name.split(".")[1]==='jpeg'||file.name.split(".")[1]==='png'||file.name.split(".")[1]==='gif') {
        let img = file.name;
        let name = this.$cookies.get("session");
        if (img.trim()) {
          axios({
            url: 'https://hzti.xyz/PHP/user_img_updata.php',
            method: "post",
            params: {
              name: name,
              img: img
            }
          }).then(res => {
            if (res.data === 1) {
              axios({
                url: 'https://hzti.xyz/PHP/content_imginto.php',
                method: "post",
                params: {
                  name: name,
                  img: img
                }
              })
              this.$message({
                message: '图片上传成功!',
                type: 'success'
              });
              this.grinfo();
            } else {
              this.$message({
                message: '错误，图片上传失败,请反馈!',
                type: 'error'
              });
            }
          })
        }
      }else{
        this.$message({
          message: '警告，上传非法格式的文件!',
          type: 'warning'
        });
      }
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg'||'image/png'||'image/gif';
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 或者 PNG格式!');
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isJPG && isLt2M;
    },
  // 图片上传结束
    change() {
      this.isActive = !this.isActive;
    },
    modify() {
      let name = this.$cookies.get("session");
      axios({
        url: 'https://hzti.xyz/PHP/info_updata.php',
        method: "POST",
        params: {
          text: name,
          mail: this.mail,
          sex: this.value,
          state: this.radio,
          textarea: this.textarea,
        }
      }).then(res => {
        if (res.data == 1) {
          this.isActive = false;
          this.$message({
            message: 'Ts：修改成功！',
            type: 'success'
          });
          this.grinfo();
          this.isActive=true;
        } else {
          this.$message({
            message: 'Ts：修改失败,请反馈！',
            type: 'error'
          });
        }
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.avatar-uploader{
 padding-left: 5%;
  margin-top: 15px;
}
.avatar-uploader,.top h2{
  display: inline-block;
}
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 110px;
  height: 110px;
  line-height: 110px;
  text-align: center;
  border: 1px dashed #8c939d;
  border-radius: 6px;
}
.avatar {
  width: 110px;
  height: 110px;
  display: block;
  border-radius: 6px;
}
.account {
  padding: 80px 30px 30px 30px;
  height: auto;
  background-color: #f0f2f5;

  .top {
    width: 100%;
    height: 140px;
    background-color: #fff;
    border-radius: 3px;
    box-shadow: 0 2px 12px 0 #e1e1e1;

    h2 {
      padding: 50px 10px;
      vertical-align: top;
    }
  }

  .box-card {
    width: 100%;
    margin: 25px auto 5px auto;

    .clearfix:before,
    .clearfix:after {
      display: table;
      content: "";
    }

    .clearfix:after {
      clear: both
    }

    .info {
      height: auto;

      .el-radio {
        margin: 10px 10px 10px 0;
      }

      p {
        color: #aaa;
      }

      .bottom {
        width: 215px;
        margin-left: 80px;

        button:last-child {
          margin-left: 30px;
        }
      }
    }
  }
}

@media (max-width: 700px) {
  .account {
    padding: 80px 20px 30px 20px;
  }
}
</style>