<template>
  <el-card class="box-card">
    <div slot="header" class="clearfix" >
      <span>关于本站</span>
    </div>
    <el-skeleton :rows="6" animated v-if="isActive==false"/>
    <div class="box" v-else>
    <img src="https://dcdn.it120.cc/2022/01/21/52850473-295c-4ba5-b110-fc8e7ca0f711.jpg" alt=""><span>youyou</span>
    <p>1.现代人之间面对面交流逐渐减少，倾诉的机会变少了，有些人比较腼腆保守， 不敢大声说出自己的心里话，期盼，表白之类的，容易造成压力过大，许愿墙可以匿名，提供大家安全隐秘方便的倾诉平台。</p>
    <p>2.可以写下自己的目标、理想、愿望等，激励自己奋斗，积极向上。</p>
    <p>3.有些是无法寄出的信，有些是无法实现的梦，有些是无法说出的话，有些是无法做到的事......写出来做一个精神寄托。</p>
    <p>4.本站许愿墙最初是承载愿望的实体，一种建筑，人们在上面涂涂画画或贴上小纸片，写上自己的愿望、期盼、祝福等；也用在网络上，一般是网站独立的一个空间页面，供人们展示许愿、祈祷、祝福等，提供一站式许愿交流服务。</p>
    <p style="text-align: right;margin-top: 60px;">——最后祝大家心想事成，万事如意！站长youyou，前端开发者。</p>
    </div>
  </el-card>
</template>

<script>
/**
 * @description 许愿墙
 * @author youyou
 * @date 2022-01-18 09:12:00
 * @lastModifiedBy youyou
 * @lastModifiedTime 2022-02-04 14:14:00
 */
export default {
  name: "About",
  data(){
    return{
      isActive:false
    }
  },
  methods:{

  },
 created() {
   document.documentElement.scrollTop = 0;
    let that=this;
    setTimeout(function (){
      that.isActive=true;
    },1500);
 }
}
</script>

<style scoped>
.box-card{
  padding-top: 62px;
  width: 100%;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}
.clearfix:after {
  clear: both
}
.box{
  color: #aaa;
  position: relative;
}
.box img{
  width: 40px;
  height: 40px;
  border-radius: 4px;
}
.box p{
  text-indent: 2em;
  margin: 15px 0;
  letter-spacing: 1px;
}

.box span{
  position: absolute;
  top: 9px;
  left: 50px;
  vertical-align: top;

}

</style>