<template>
  <div id="form_updata">
    <el-form :model="ruleForm" :rules="rules" label-width="80px" class="demo-ruleForm">
      <el-form-item label="修改人">
        <el-input v-model="ruleForm.name" disabled></el-input>
      </el-form-item>
      <el-form :inline="true" :model="formInline" class="demo-form-inline hot">
        <el-form-item label="热门标签" class="label">
          <el-select v-model="formInline.region" >
            <el-option label="朋友" value="朋友"></el-option>
            <el-option label="亲人" value="亲人"></el-option>
            <el-option label="老师" value="老师"></el-option>
            <el-option label="同学" value="同学"></el-option>
            <el-option label="诗歌" value="诗歌"></el-option>
            <el-option label="其他" value="其他"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <el-form-item label="修改内容" prop="desc">
        <el-input type="textarea" v-model="ruleForm.desc"></el-input>
      </el-form-item>
      <div class="upload">
        <p class="wz">图片上传</p>
        <el-upload
            class="avatar-uploader"
            action="https://hzti.xyz/PHP/img.php"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload">
          <img v-if="imageUrl" :src="imageUrl" class="avatar">
          <i v-else class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
      </div>
      <div class="block">
        <span class="demonstration">背景颜色</span>
        <el-color-picker v-model="color"></el-color-picker>
      </div>
      <el-form-item class="bottom">
        <el-button type="primary" @click="submitForm('ruleForm')">立即修改</el-button>
        <el-button @click="resetForm()">重置</el-button>
        <el-button type="warning" @click="hui">返回</el-button>
      </el-form-item>
    </el-form>
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
  name: "Form_updata",
  data() {
    return {
      imageUrl: '',
      color: '#f0ad4e',
      img: '',
      ruleForm: {
        name: '',
        desc: ''
      },
      formInline: {
        region: '其他'
      },
      rules: {
        desc: [
          {required: true, message: '请填写修改内容', trigger: 'blur'}
        ]
      }
    };
  },
  created() {
    document.documentElement.scrollTop = 0;
    let that = this;
    this.$nextTick(function () {
      that.ruleForm.name = that.$cookies.get("session");
    })
  },
  methods: {
    hui() {
      this.$router.push("/");
      document.documentElement.scrollTop = 0;
    },
    // 图片上传
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
      this.img = file.name;
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg'||'image/png'||'image/gif';
      const isLt5M = file.size / 1024 / 1024 < 5;

      if (!isJPG) {
        this.$message.error('修改图片只能是 JPG 格式!');
      }
      if (!isLt5M) {
        this.$message.error('修改图片大小不能超过 5MB!');
      }
      return isJPG && isLt5M;
    },
    // 图片上传结束
    submitForm() {
      let nr = this.ruleForm.desc;
      let color = this.color;
      let img = this.img;
      let name = this.ruleForm.name;
      let label = this.formInline.region;
      let state=Boolean(this.$cookies.get("session")&&this.$cookies.get("disdjsaddkdjksskjxcqwqw"));
      if (state) {
        if (this.ruleForm.desc.trim()) {
          //发送请求
          axios({
            url: 'https://hzti.xyz/PHP/content_updata.php',
            method: "post",
            params: {
              id: this.$route.params.id,
              name: name,
              content: nr,
              color: color,
              img: img,
              label:label
            }
          }).then(res => {
            if (res.data == 1) {
              this.$message({
                message: '恭喜你，修改许愿成功，等待管理员通过！',
                type: 'success'
              });
              document.documentElement.scrollTop = 0;
              this.$router.push("/");
            } else {
              this.$message({
                message: '警告，修改许愿失败,请反馈!',
                type: 'warning'
              });
            }
          })
        } else {
          this.$notify.error({
            title: '错误',
            message: '内容不能为空！'
          });
        }
      } else {
        this.$notify.error({
          title: '错误',
          message: '请登录后再修改！'
        });
      }
    },
    resetForm() {
      this.ruleForm.desc="";
      this.color = "#f0ad4e";
    }
  }
}
</script>

<style scoped>
#form_updata {
  margin: 3vw 0;
  padding: 62px 2vw 0 2vw;
}

.el-input, .el-textarea {
  width: 95% !important;
}

.upload .wz {
  width: 70px;
  text-align: right;
  font-size: 14px;
}

.upload .wz, .upload .avatar-uploader {
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
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
  border: 1px dashed #409EFF;
  margin-left: 3vw;
  border-radius: 0.2vw;
}

.avatar {
  width: 178px;
  height: 178px;
  display: block;
  margin-left: 12px;
  border-radius: 5px;
}

.block {
  padding: 0 4.5vw;
  margin: 4vw 0 8vw 0;
  color: #000000;
  font-size: 14px;
}
.hot .label {
  padding: 0 3px;
  display: flex;
}

.hot .label::before {
  margin-top: 5px;
  content: "*";
  color: #F56C6C;
  margin-right: 2px;
}

.el-color-picker {
  vertical-align: middle;
  margin-left: 1vw;
}

.bottom {
  padding-bottom: 3vw;
}

@media (min-width: 601px) {
  .avatar-uploader-icon {
    margin-left: 1vw !important;
  }

  .block {
    padding: 0 0.8vw !important;
  }
}
</style>