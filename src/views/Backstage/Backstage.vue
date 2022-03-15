<template>
  <div id="backstage">
    <keep-alive>
      <el-container style="height: 100%; border: 1px solid #eee">
        <el-aside width="200px" class="asideleft" style="background-color: rgb(238, 241, 246)">
          <el-menu :default-openeds="['1','2', '3']">
            <el-submenu index="1">
              <template slot="title"><i class="el-icon-s-promotion"></i>内容展示</template>
              <el-menu-item-group>
                <template slot="title">内容审核 Content review</template>
                <el-menu-item index="0-1" @click="review">内容审核</el-menu-item>
              </el-menu-item-group>
              <el-menu-item-group>
                <template slot="title">用户 user</template>
                <el-menu-item index="1-1" @click="userdata">用户资料</el-menu-item>
                <el-menu-item index="1-2" @click="login">用户登录</el-menu-item>
              </el-menu-item-group>
              <el-menu-item-group title="内容 content">
                <el-menu-item index="1-3" @click="content">内容列表</el-menu-item>
              </el-menu-item-group>
              <el-menu-item index="1-4" @click="good">点赞列表</el-menu-item>
              <el-menu-item index="1-7" @click="collection">收藏列表</el-menu-item>
              <el-menu-item-group title="评论 comment">
                <el-menu-item index="1-5" @click="comment">评论列表</el-menu-item>
              </el-menu-item-group>
              <el-menu-item-group title="反馈 feedback">
                <el-menu-item index="1-6" @click="feedback">反馈列表</el-menu-item>
              </el-menu-item-group>
            </el-submenu>

            <el-submenu index="2">
              <template slot="title"><i class="el-icon-edit"></i>日常操作</template>
              <el-menu-item-group>
                <template slot="title">添加</template>
                <el-menu-item index="2-1" @click="userstate">用户资料</el-menu-item>
                <el-menu-item index="2-2" @click="contentstate">内容列表</el-menu-item>
                <el-menu-item index="2-3" @click="commentstate">评论列表</el-menu-item>
              </el-menu-item-group>
              <el-menu-item-group title="修改">
                <el-menu-item index="2-4" @click="userupdata">用户资料</el-menu-item>
                <el-menu-item index="2-5" @click="contentupdata">内容列表</el-menu-item>
                <el-menu-item index="2-6" @click="commentupdata">评论列表</el-menu-item>
                <el-menu-item index="2-7" @click="feedbackupdata">反馈列表</el-menu-item>
              </el-menu-item-group>
              <el-menu-item-group title="删除">
                <el-menu-item index="2-8" @click="delect1">用户资料</el-menu-item>
                <el-menu-item index="2-9" @click="delect2">用户登录</el-menu-item>
                <el-menu-item index="2-10" @click="delect3">内容列表</el-menu-item>
                <el-menu-item index="2-11" @click="delect4">点赞列表</el-menu-item>
                <el-menu-item index="2-14" @click="delect7">收藏列表</el-menu-item>
                <el-menu-item index="2-12" @click="delect5">评论列表</el-menu-item>
                <el-menu-item index="2-13" @click="delect6">反馈列表</el-menu-item>
              </el-menu-item-group>
            </el-submenu>
            <el-submenu index="3">
              <template slot="title"><i class="el-icon-setting"></i>设置</template>
              <el-menu-item index="3-1" @click="backstage_login">后台登录数据</el-menu-item>
              <el-menu-item index="3-1" @click="gohome">退出</el-menu-item>
            </el-submenu>
          </el-menu>
        </el-aside>

        <el-container>
          <el-header style="text-align: right; font-size: 12px;display: flex;">
            <i class="el-icon-s-fold" style="float:left;margin-top:24px;margin-left:1%;cursor: pointer;" @click="show()"/>
            <span style="text-align: center;flex: 1;padding-left: 20px;color: #409EFF;font-size: 23px;letter-spacing: 5px;">{{title}}</span>
            <el-dropdown>
              <i class="el-icon-setting" style="margin-right: 15px"></i>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item @click.native="review">内容审核</el-dropdown-item>
                <el-dropdown-item @click.native="userdata">内容展示</el-dropdown-item>
                <el-dropdown-item @click.native="userstate">操作</el-dropdown-item>
                <el-dropdown-item @click.native="gohome">退出</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
            <span style="color: #f64646;">root</span>
          </el-header>

          <el-main>
            <!--查询-->
            <el-table :data="userd" stripe  v-show="state===1">
              <el-table-column prop="id" label="id" width="70">
              </el-table-column>
              <el-table-column prop="username" label="姓名" width="120">
              </el-table-column>
              <el-table-column prop="password" label="密码">
              </el-table-column>
              <el-table-column prop="gender" label="性别">
              </el-table-column>
              <el-table-column prop="introduction" label="个人简介">
              </el-table-column>
              <el-table-column prop="img" label="头像">
              </el-table-column>
              <el-table-column prop="state" label="状态">
              </el-table-column>
              <el-table-column prop="mail" label="邮箱">
              </el-table-column>
              <el-table-column prop="ip" label="ip地址">
              </el-table-column>
              <el-table-column prop="adopt" label="账号封禁状态">
              </el-table-column>
              <el-table-column prop="time" label="时间" width="160">
              </el-table-column>
            </el-table>
            <el-table :data="userlogin" stripe  v-show="state===2">
              <el-table-column prop="id" label="id" width="100">
              </el-table-column>
              <el-table-column prop="name" label="姓名" width="150">
              </el-table-column>
              <el-table-column prop="ip" label="ip地址" width="150">
              </el-table-column>
              <el-table-column prop="time" label="时间">
              </el-table-column>
            </el-table>
            <el-table :data="contentdata" stripe v-show="state===3">
              <el-table-column prop="id" label="id" width="100">
              </el-table-column>
              <el-table-column prop="name" label="姓名" width="150">
              </el-table-column>
              <el-table-column prop="value" label="标签">
              </el-table-column>
              <el-table-column prop="content" label="内容">
              </el-table-column>
              <el-table-column prop="color" label="背景颜色">
              </el-table-column>
              <el-table-column prop="imgdata" label="背景">
              </el-table-column>
              <el-table-column prop="number" label="点赞量">
              </el-table-column>
              <el-table-column prop="show" label="审核状态">
              </el-table-column>
              <el-table-column prop="visit" label="游览量">
              </el-table-column>
              <el-table-column prop="comment" label="评论数量">
              </el-table-column>
              <el-table-column prop="num" label="搜索量">
              </el-table-column>
              <el-table-column prop="ip" label="ip地址">
              </el-table-column>
              <el-table-column prop="time" label="时间">
              </el-table-column>
            </el-table>
            <el-table :data="gooddata" stripe v-show="state===4">
              <el-table-column prop="id" label="id">
              </el-table-column>
              <el-table-column prop="name" label="姓名">
              </el-table-column>
              <el-table-column prop="rid" label="点赞id">
              </el-table-column>
            </el-table>
            <el-table :data="collectiondata" stripe v-show="state===22">
              <el-table-column prop="id" label="id">
              </el-table-column>
              <el-table-column prop="name" label="姓名">
              </el-table-column>
              <el-table-column prop="rid" label="收藏id">
              </el-table-column>
              <el-table-column prop="time" label="收藏时间">
              </el-table-column>
            </el-table>
            <el-table :data="commentdata" stripe v-show="state===5">
              <el-table-column prop="id" label="id">
              </el-table-column>
              <el-table-column prop="rid" label="内容id">
              </el-table-column>
              <el-table-column prop="name" label="姓名">
              </el-table-column>
              <el-table-column prop="content" label="评论内容">
              </el-table-column>
              <el-table-column prop="comment_ip" label="评论ip">
              </el-table-column>
              <el-table-column prop="time" label="评论时间">
              </el-table-column>
            </el-table>
            <el-table :data="feedbackdata" stripe v-show="state===6">
              <el-table-column prop="id" label="id">
              </el-table-column>
              <el-table-column prop="name" label="姓名">
              </el-table-column>
              <el-table-column prop="content" label="反馈内容">
              </el-table-column>
              <el-table-column prop="time" label="时间">
              </el-table-column>
              <el-table-column prop="ip" label="ip地址">
              </el-table-column>
            </el-table>
            <!--查询结束-->
            <!--删除-->
            <el-table :data="userd" stripe v-show="state===7">
              <el-table-column prop="id" label="id" width="70">
              </el-table-column>
              <el-table-column prop="username" label="姓名" width="120">
              </el-table-column>
              <el-table-column prop="password" label="密码">
              </el-table-column>
              <el-table-column prop="gender" label="性别">
              </el-table-column>
              <el-table-column prop="introduction" label="个人简介">
              </el-table-column>
              <el-table-column prop="img" label="头像">
              </el-table-column>
              <el-table-column prop="state" label="状态">
              </el-table-column>
              <el-table-column prop="mail" label="邮箱">
              </el-table-column>
              <el-table-column prop="ip" label="ip地址">
              </el-table-column>
              <el-table-column prop="adopt" label="账号封禁状态">
              </el-table-column>
              <el-table-column prop="time" label="时间" width="160">
              </el-table-column>
              <el-table-column label="删除">
                <template slot-scope="scope">
                  <el-button type="danger" @click="delect_1(scope.row.id)">删除</el-button>
                </template>
              </el-table-column>
            </el-table>
            <el-table :data="userlogin" stripe v-show="state===8">
              <el-table-column prop="id" label="id" width="100">
              </el-table-column>
              <el-table-column prop="name" label="姓名" width="150">
              </el-table-column>
              <el-table-column prop="ip" label="ip地址" width="150">
              </el-table-column>
              <el-table-column prop="time" label="时间">
              </el-table-column>
              <el-table-column label="删除">
                <template slot-scope="scope">
                  <el-button type="danger" @click="delect_2(scope.row.id)">删除</el-button>
                </template>
              </el-table-column>
            </el-table>
            <el-table :data="contentdata" stripe v-show="state===9">
              <el-table-column prop="id" label="id" width="100">
              </el-table-column>
              <el-table-column prop="name" label="姓名" width="150">
              </el-table-column>
              <el-table-column prop="value" label="标签">
              </el-table-column>
              <el-table-column prop="content" label="内容">
              </el-table-column>
              <el-table-column prop="color" label="背景颜色">
              </el-table-column>
              <el-table-column prop="imgdata" label="背景">
              </el-table-column>
              <el-table-column prop="number" label="点赞量">
              </el-table-column>
              <el-table-column prop="visit" label="游览量">
              </el-table-column>
              <el-table-column prop="show" label="审核状态">
              </el-table-column>
              <el-table-column prop="comment" label="评论数量">
              </el-table-column>
              <el-table-column prop="num" label="搜索量">
              </el-table-column>
              <el-table-column prop="ip" label="ip地址">
              </el-table-column>
              <el-table-column prop="time" label="时间">
              </el-table-column>
              <el-table-column label="删除">
                <template slot-scope="scope">
                  <el-button type="danger" @click="delect_3(scope.row.id)">删除</el-button>
                </template>
              </el-table-column>
            </el-table>
            <el-table :data="gooddata" stripe v-show="state===10">
              <el-table-column prop="id" label="id">
              </el-table-column>
              <el-table-column prop="name" label="姓名">
              </el-table-column>
              <el-table-column prop="rid" label="点赞id">
              </el-table-column>
              <el-table-column label="删除">
                <template slot-scope="scope">
                  <el-button type="danger" @click="delect_4(scope.row.id)">删除</el-button>
                </template>
              </el-table-column>
            </el-table>
            <el-table :data="collectiondata" stripe v-show="state===23">
              <el-table-column prop="id" label="id">
              </el-table-column>
              <el-table-column prop="name" label="姓名">
              </el-table-column>
              <el-table-column prop="rid" label="收藏id">
              </el-table-column>
              <el-table-column prop="time" label="收藏时间">
              </el-table-column>
              <el-table-column label="删除">
                <template slot-scope="scope">
                  <el-button type="danger" @click="delect_7(scope.row.id)">删除</el-button>
                </template>
              </el-table-column>
            </el-table>
            <el-table :data="commentdata" stripe v-show="state===11">
              <el-table-column prop="id" label="id">
              </el-table-column>
              <el-table-column prop="rid" label="内容id">
              </el-table-column>
              <el-table-column prop="name" label="姓名">
              </el-table-column>
              <el-table-column prop="content" label="评论内容">
              </el-table-column>
              <el-table-column prop="comment_ip" label="评论ip">
              </el-table-column>
              <el-table-column prop="time" label="评论时间">
              </el-table-column>
              <el-table-column label="删除">
                <template slot-scope="scope">
                  <el-button type="danger" @click="delect_5(scope.row.id)">删除</el-button>
                </template>
              </el-table-column>
            </el-table>
            <el-table :data="feedbackdata" stripe v-show="state===12">
              <el-table-column prop="id" label="id">
              </el-table-column>
              <el-table-column prop="name" label="姓名">
              </el-table-column>
              <el-table-column prop="content" label="反馈内容">
              </el-table-column>
              <el-table-column prop="time" label="时间">
              </el-table-column>
              <el-table-column prop="ip" label="ip地址">
              </el-table-column>
              <el-table-column label="删除">
                <template slot-scope="scope">
                  <el-button type="danger" @click="delect_6(scope.row.id)">删除</el-button>
                </template>
              </el-table-column>
            </el-table>
            <!--删除结束-->
            <!--添加-->
            <div stripe v-show="state===13">
              name:
              <el-input v-model="nameinput" placeholder="请输入用户名"></el-input>
              密码：
              <el-input v-model="pwdinput" placeholder="请输入密码"></el-input>
              性别：
              <el-radio v-model="sexradio" label="男">男</el-radio>
              <el-radio v-model="sexradio" label="女">女</el-radio>
              <br/>
              个人简介：
              <el-input v-model="grinput" placeholder="请输入个人简介"></el-input>
              标签：
              <el-input v-model="labelinput" placeholder="请输入标签内容"></el-input>
              邮箱：
              <el-input v-model="emailinput" placeholder="请输入邮箱"></el-input>
              账号状态
              <el-radio v-model="radio" label="0">正常</el-radio>
              <el-radio v-model="radio" label="1">封号</el-radio>
              <br/>
              头像：
              <el-input v-model="txinput" placeholder="请输入头像路径"></el-input>
              <el-button type="primary" @click="useradd">添加</el-button>
            </div>
            <div stripe v-show="state===14">
              name:
              <el-input v-model="nameinput" placeholder="请输入用户名"></el-input>
              标签：
              <el-input v-model="labelinput" placeholder="请输入标签内容"></el-input>
              内容：
              <el-input v-model="contentinput" placeholder="请输入内容"></el-input>
              背景颜色：
              <el-input v-model="colorinput" placeholder="请输入背景颜色"></el-input>
              背景图片：
              <el-input v-model="bginput" placeholder="请输入背景图片"></el-input>
              头像：
              <el-input v-model="txinput" placeholder="请输入头像路径"></el-input>
              点赞量：
              <el-input v-model="numberinput" placeholder="请输入点赞量"></el-input>
              搜索量：
              <el-input v-model="numinput" placeholder="请输入搜索量"></el-input>
              游览量：
              <el-input v-model="ylinput" placeholder="请输入游览量"></el-input>
              审核状态：(0不通过,1通过)
              <el-input v-model="slinput" placeholder="请输入审核状态"></el-input>
              评论量：
              <el-input v-model="plinput" placeholder="请输入评论量"></el-input>
              <el-button type="primary" @click="contentadd">添加</el-button>
            </div>
            <div stripe v-show="state===15">
              name:
              <el-input v-model="nameinput" placeholder="请输入用户名"></el-input>
              内容：
              <el-input v-model="contentinput" placeholder="请输入内容"></el-input>
              内容id:
              <el-input v-model="ridinput" placeholder="请输入内容id"></el-input>
              <el-button type="primary" @click="commentadd">添加</el-button>
            </div>
            <!--添加结束-->
            <!--修改开始-->
            <el-table :data="userd" stripe v-show="state===16">
              <el-table-column label="id">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.id" disabled></el-input>
                </template>
              </el-table-column>
              <el-table-column label="name">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.username"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="密码">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.password"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="性别 *">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.gender"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="个人简介">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.introduction"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="标签">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.state"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="邮箱">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.mail"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="头像">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.img"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="账号状态">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.adopt"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="修改">
                <template slot-scope="scope">
                  <el-button type="danger"
                             @click="userupda(scope.row.id,scope.row.username,scope.row.password,scope.row.gender,scope.row.introduction,scope.row.state,scope.row.mail,scope.row.img,scope.row.adopt)">
                    修改
                  </el-button>
                </template>
              </el-table-column>
            </el-table>
            <el-table :data="contentdata" stripe v-show="state===17">
              <el-table-column label="id">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.id" disabled></el-input>
                </template>
              </el-table-column>
              <el-table-column label="name">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.name"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="头像">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.img"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="标签">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.value"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="内容">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.content"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="背景颜色">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.color"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="背景图片">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.imgdata"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="点赞量">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.number"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="搜索量">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.num"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="查看量">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.visit"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="评论量">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.comment"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="审核状态">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.show"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="IP地址">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.ip" disabled></el-input>
                </template>
              </el-table-column>
              <el-table-column label="修改">
                <template slot-scope="scope">
                  <el-button type="danger"
                             @click="contentupda(scope.row.id,scope.row.name,scope.row.img,scope.row.value,scope.row.content,scope.row.color,scope.row.imgdata,scope.row.number,scope.row.num,scope.row.visit,scope.row.comment,scope.row.show)">
                    修改
                  </el-button>
                </template>
              </el-table-column>
            </el-table>
            <el-table :data="commentdata" stripe v-show="state===18">
              <el-table-column label="id">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.id" disabled></el-input>
                </template>
              </el-table-column>
              <el-table-column label="内容id">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.rid"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="名字">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.name"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="评论内容">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.content"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="评论内容ip">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.comment_ip"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="时间">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.time"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="修改">
                <template slot-scope="scope">
                  <el-button type="danger"
                             @click="commentupda(scope.row.id,scope.row.rid,scope.row.name,scope.row.content)">
                    修改
                  </el-button>
                </template>
              </el-table-column>
            </el-table>
            <el-table :data="feedbackdata" stripe v-show="state===19">
              <el-table-column label="id">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.id" disabled></el-input>
                </template>
              </el-table-column>
              <el-table-column label="name">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.name"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="内容">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.content"></el-input>
                </template>
              </el-table-column>
              <el-table-column label="ip地址">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.ip" disabled></el-input>
                </template>
              </el-table-column>
              <el-table-column label="时间">
                <template slot-scope="scope">
                  <el-input type="text" v-model="scope.row.time" disabled></el-input>
                </template>
              </el-table-column>
              <el-table-column label="修改">
                <template slot-scope="scope">
                  <el-button type="danger" @click="feedbackupda(scope.row.id,scope.row.name,scope.row.content)">修改
                  </el-button>
                </template>
              </el-table-column>
            </el-table>
            <!--修改结束-->
            <!--后台登录数据-->
            <el-table :data="backstagelogin" stripe v-show="state===20">
              <el-table-column prop="id" label="id">
              </el-table-column>
              <el-table-column prop="name" label="name">
              </el-table-column>
              <el-table-column prop="ip" label="ip地址">
              </el-table-column>
              <el-table-column prop="time" label="时间">
              </el-table-column>
            </el-table>
            <el-table :data="contentdata" stripe v-show="state===21">
              <el-table-column prop="id" label="id" width="100">
              </el-table-column>
              <el-table-column prop="name" label="姓名" width="150">
              </el-table-column>
              <el-table-column prop="content" label="内容">
              </el-table-column>
              <el-table-column label="通过">
                <template slot-scope="scope">
                  <el-button type="danger"
                             @click="adoptupdata(scope.row.id)">
                    通过
                  </el-button>
                </template>
              </el-table-column>
            </el-table>
          </el-main>
        </el-container>
      </el-container>
    </keep-alive>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Backstage",
  data() {
    return {
      isactive:0,
      title:null,
      state: 1,
      userd: [],
      userlogin: [],
      gooddata: [],
      commentdata: [],
      feedbackdata: [],
      contentdata: [],
      radio: '0',
      idinput: '',
      sexradio: '男',
      nameinput: '',
      pwdinput: '',
      grinput: '',
      labelinput: '',
      emailinput: '',
      txinput: '',
      contentinput: '',
      colorinput: '',
      bginput: '',
      numberinput: '',
      numinput: '',
      ylinput: '',
      plinput: '',
      ridinput: '',
      slinput:'',
      backstagelogin:[],
      collectiondata:[],
    }
  },
  created() {
    this.userdata();
  },
  beforeRouteEnter(to, from, next) {
    let passwd = prompt('Please input the backstage password!');
    next(vm => {
      if (to.path==="/backstage"&&from.path==="/"&&passwd==="li961125.."&&vm.$cookies.get("session")==="123456" && vm.$cookies.get("disdjsaddkdjksskjxcqwqw")){
        window.console.log("后台登录成功!");
        axios({
          url: 'https://hzti.xyz/PHP/backstage/feedback_login.php',
          method: "post",
          params: {
            name: vm.$cookies.get("session"),
          }
        })
      }else{
        vm.$router.go(-1);
        return false;
      }
    });
  },
  methods: {
    adoptupdata(id){
      axios({
        url: 'https://hzti.xyz/PHP/backstage/content_review_updata.php',
        method: "post",
        params:{
          id:id
        }
      }).then(res => {
        if (res.data===1){
          axios({
            url: 'https://hzti.xyz/PHP/backstage/content_review.php',
            method: "post",
          }).then(res => {
            this.contentdata = res.data;
          })
          this.$message({
            message: 'Tips:通过成功!',
            type: 'success'
          });
        }
      })
    },
    review(){
      this.title="内容审核";
      this.state=21;
      axios({
        url: 'https://hzti.xyz/PHP/backstage/content_review.php',
        method: "post",
      }).then(res => {
        this.contentdata = res.data;
        document.documentElement.scrollTop = 0;
        // eslint-disable-next-line no-undef
        $(".asideleft").hide();
        this.isactive=0;
      })
    },
    show(){
      if (this.isactive==0){
        // eslint-disable-next-line no-undef
        $(".asideleft").show();
        this.isactive=1;
      }else{
        // eslint-disable-next-line no-undef
        $(".asideleft").hide();
        this.isactive=0;
      }
    },
    backstage_login(){
      this.title="后台登录信息";
      this.state = 20;
      axios({
        url: 'https://hzti.xyz/PHP/backstage/feedback_login_search.php',
        method: "post",
      }).then(res => {
        this.backstagelogin = res.data;
        document.documentElement.scrollTop = 0;
        // eslint-disable-next-line no-undef
        $(".asideleft").hide();
        this.isactive=0;
      })
    },
    contentupda(id,name,img,value,content,color,imgdata,number,num,visit,comment,show){
      axios({
        url: 'https://hzti.xyz/PHP/backstage/contentupdata.php',
        method: "post",
        params: {
          id: id,
          name: name,
          img: img,
          label: value,
          content: content,
          color: color,
          show:show,
          imgdata: imgdata,
          number: number,
          num: num,
          visit: visit,
          comment: comment,
        }
      }).then(res => {
        if (res.data === 1) {
          this.commentda();
          this.$message({
            message: 'Tips:修改成功!',
            type: 'success'
          });
        }
      })
    },
    commentupda(id,rid, name, content){
      axios({
        url: 'https://hzti.xyz/PHP/backstage/commentupdata.php',
        method: "post",
        params: {
          id: id,
          rid: rid,
          name: name,
          content: content,
        }
      }).then(res => {
        if (res.data === 1) {
          this.commentda();
          this.$message({
            message: 'Tips:修改成功!',
            type: 'success'
          });
        }
      })
    },
    feedbackupda(id, name, content) {
      axios({
        url: 'https://hzti.xyz/PHP/backstage/feedbackupdata.php',
        method: "post",
        params: {
          id: id,
          name: name,
          content: content,
        }
      }).then(res => {
        if (res.data === 1) {
          this.commentda();
          this.$message({
            message: 'Tips:修改成功!',
            type: 'success'
          });
        }
      })
    },
    userupda(id, username, password, gender, introduction, state, mail, img, adopt) {
      axios({
        url: 'https://hzti.xyz/PHP/backstage/userupdata.php',
        method: "post",
        params: {
          id: id,
          name: username,
          pwd: password,
          sex: gender,
          gr: introduction,
          label: state,
          email: mail,
          state: adopt,
          tx: img,
        }
      }).then(res => {
        if (res.data === 1) {
          this.commentda();
          this.$message({
            message: 'Tips:修改成功!',
            type: 'success'
          });
        }
      })
    },

    // 初始化数据开始
    userda() {
      axios({
        url: 'https://hzti.xyz/PHP/backstage/userdata.php',
        method: "post",
      }).then(res => {
        this.userd = res.data;
        this.title="用户资料";
        document.documentElement.scrollTop = 0;
        // eslint-disable-next-line no-undef
        $(".asideleft").hide();
        this.isactive=0;
      })
    },
    userlog() {
      axios({
        url: 'https://hzti.xyz/PHP/backstage/userlogindata.php',
        method: "post",
      }).then(res => {
        this.userlogin = res.data;
        document.documentElement.scrollTop = 0;
        // eslint-disable-next-line no-undef
        $(".asideleft").hide();
        this.isactive=0;
      })
    },
    contentda() {
      axios({
        url: 'https://hzti.xyz/PHP/backstage/contentdata.php',
        method: "post",
      }).then(res => {
        this.contentdata = res.data;
        document.documentElement.scrollTop = 0;
        // eslint-disable-next-line no-undef
        $(".asideleft").hide();
        this.isactive=0;
      })
    },
    goodda() {
      axios({
        url: 'https://hzti.xyz/PHP/backstage/gooddata.php',
        method: "post",
      }).then(res => {
        this.gooddata = res.data;
        document.documentElement.scrollTop = 0;
        // eslint-disable-next-line no-undef
        $(".asideleft").hide();
        this.isactive=0;
      })
    },
    collectionda(){
      axios({
        url: 'https://hzti.xyz/PHP/backstage/collectiondata.php',
        method: "post",
      }).then(res => {
        this.collectiondata = res.data;
        document.documentElement.scrollTop = 0;
        // eslint-disable-next-line no-undef
        $(".asideleft").hide();
        this.isactive=0;
      })
    },
    commentda() {
      axios({
        url: 'https://hzti.xyz/PHP/backstage/commentdata.php',
        method: "post",
      }).then(res => {
        this.commentdata = res.data;
        document.documentElement.scrollTop = 0;
        // eslint-disable-next-line no-undef
        $(".asideleft").hide();
        this.isactive=0;
      })
    },
    feedbackda() {
      axios({
        url: 'https://hzti.xyz/PHP/backstage/feedbackdata.php',
        method: "post",
      }).then(res => {
        this.feedbackdata = res.data;
        document.documentElement.scrollTop = 0;
        // eslint-disable-next-line no-undef
        $(".asideleft").hide();
        this.isactive=0;
      })
    },
    // 初始化数据结束
    gohome() {
      this.$router.push("/");
      // eslint-disable-next-line no-undef
      $("#Header").show();
      // eslint-disable-next-line no-undef
      $("#Footer").show();
    },
    feedbackupdata() {
      this.title="反馈列表修改";
      this.state = 19;
      this.feedbackda();
    },
    commentupdata() {
      this.title="评论列表修改";
      this.state = 18;
      this.commentda();
    },
    contentupdata() {
      this.title="内容列表修改";
      this.state = 17;
      this.contentda();
    },
    userupdata() {
      this.title="用户资料修改";
      this.state = 16;
    },
    userstate() {
      this.title="用户资料添加";
      this.state = 13;
    },
    contentstate() {
      this.title="内容列表添加";
      this.state = 14;
    },
    commentstate() {
      this.title="评论列表添加";
      this.state = 15;
    },
    // 数据添加
    commentadd() {
      axios({
        url: 'https://hzti.xyz/PHP/comment_insert.php',
        method: "post",
        params: {
          name: this.nameinput,
          rid: this.ridinput,
          content: this.contentinput,
        }
      }).then(res => {
        if (res.data === 1) {
          this.commentda();
          this.$message({
            message: 'Tips:添加成功!',
            type: 'success'
          });
        }
      })
    },
    contentadd() {
      axios({
        url: 'https://hzti.xyz/PHP/backstage/contentadd.php',
        method: "post",
        params: {
          name: this.nameinput,
          label: this.labelinput,
          content: this.contentinput,
          color: this.colorinput,
          imgdata: this.bginput,
          img: this.txinput,
          num: this.numinput,
          number: this.numberinput,
          visit: this.ylinput,
          show: this.slinput,
          comment: this.plinput,
        }
      }).then(res => {
        if (res.data === 1) {
          this.contentda();
          this.$message({
            message: 'Tips:添加成功!',
            type: 'success'
          });
        }
      })
    },
    useradd() {
      axios({
        url: 'https://hzti.xyz/PHP/backstage/useradd.php',
        method: "post",
        params: {
          name: this.nameinput,
          pwd: this.pwdinput,
          sex: this.sexradio,
          gr: this.grinput,
          label: this.labelinput,
          email: this.emailinput,
          state: this.radio,
          tx: this.txinput,
        }
      }).then(res => {
        if (res.data === 1) {
          this.userda();
          this.$message({
            message: 'Tips:添加成功!',
            type: 'success'
          });
        }
      })
    },
    // 数据添加结束
    // 数据删除
    delect_1(id) {
      axios({
        url: 'https://hzti.xyz/PHP/backstage/user_delect.php',
        method: "post",
        params: {
          id: id
        }
      }).then(res => {
        if (res.data === 1) {
          this.userda();
          this.$message({
            message: 'Tips:删除成功!',
            type: 'success'
          });
        }
      })
    },
    delect_2(id) {
      axios({
        url: 'https://hzti.xyz/PHP/backstage/userlogin_delect.php',
        method: "post",
        params: {
          id: id
        }
      }).then(res => {
        if (res.data === 1) {
          this.userlog();
          this.$message({
            message: 'Tips:删除成功!',
            type: 'success'
          });
        }
      })
    },
    delect_3(id) {
      axios({
        url: 'https://hzti.xyz/PHP/backstage/content_delect.php',
        method: "post",
        params: {
          id: id
        }
      }).then(res => {
        if (res.data === 1) {
          this.contentda();
          this.$message({
            message: 'Tips:删除成功!',
            type: 'success'
          });
        }
      })
    },
    delect_4(id) {
      axios({
        url: 'https://hzti.xyz/PHP/backstage/good_delect.php',
        method: "post",
        params: {
          id: id
        }
      }).then(res => {
        if (res.data === 1) {
          this.goodda();
          this.$message({
            message: 'Tips:删除成功!',
            type: 'success'
          });
        }
      })
    },
    delect_5(id) {
      axios({
        url: 'https://hzti.xyz/PHP/backstage/comment_delect.php',
        method: "post",
        params: {
          id: id
        }
      }).then(res => {
        if (res.data === 1) {
          this.commentda();
          this.$message({
            message: 'Tips:删除成功!',
            type: 'success'
          });
        }
      })
    },
    delect_7(id){
      axios({
        url: 'https://hzti.xyz/PHP/backstage/collectiondata_delect.php',
        method: "post",
        params: {
          id: id
        }
      }).then(res => {
        if (res.data === 1) {
          this.collectionda();
          this.$message({
            message: 'Tips:删除成功!',
            type: 'success'
          });
        }
      })
    },
    delect_6(id) {
      axios({
        url: 'https://hzti.xyz/PHP/backstage/feedback_delect.php',
        method: "post",
        params: {
          id: id
        }
      }).then(res => {
        if (res.data === 1) {
          this.feedbackda();
          this.$message({
            message: 'Tips:删除成功!',
            type: 'success'
          });
        }
      })
    },
    // 数据删除结束
    delect1() {
      this.title="用户资料删除";
      this.state = 7;
      this.userda();
    },

    delect2() {
      this.title="用户登录删除";
      this.state = 8;
      this.userlog();
    },
    delect3() {
      this.title="内容列表删除";
      this.state = 9;
      this.contentda();
    },

    delect4() {
      this.title="点赞列表删除";
      this.state = 10;
      this.goodda()
    },

    delect5() {
      this.title="评论列表删除";
      this.state = 11;
      this.commentda();
    },
    delect7(){
      this.title="收藏列表删除";
      this.state = 23;
      this.collectionda();
    },
    delect6() {
      this.title="反馈列表删除";
      this.state = 12;
      this.feedbackda();
    },
    userdata() {
      this.state = 1;
      this.userda();
    },
    login() {
      this.state = 2;
      this.title="用户登录";
      this.userlog();
    },
    content() {
      this.state = 3;
      this.title="内容列表";
      this.contentda();
    },
    collection(){
      this.state = 22;
      this.title="收藏列表";
      this.collectionda();
    },
    good() {
      this.state = 4;
      this.title="点赞列表";
      this.goodda();
    },
    comment() {
      this.state = 5;
      this.title="评论列表";
      this.commentda();
    },
    feedback() {
      this.state = 6;
      this.title="反馈列表";
      this.feedbackda();
    },
  }

}
</script>

<style lang="scss">
#Header, #Footer, #nprogress .bar {
  display: none ;
}

.asideleft{
  display: none;
}

.el-header {
  background-color: #B3C0D1;
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;

}

.el-input {
  margin: 1vw 0vw !important;
}

.el-radio {
  margin: 1vw 1vw !important;
}
</style>