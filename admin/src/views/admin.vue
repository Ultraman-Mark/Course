<template>
  <div>
    <div id="navbar" class="navbar navbar-default          ace-save-state">
      <div class="navbar-container ace-save-state" id="navbar-container">
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
          <span class="sr-only">Toggle sidebar</span>

          <span class="icon-bar"></span>

          <span class="icon-bar"></span>

          <span class="icon-bar"></span>
        </button>

        <div class="navbar-header pull-left">
          <a href="index.html" class="navbar-brand">
            <small>
              <i class="fa fa-leaf"></i>
              在线视频系统后台
            </small>
          </a>
        </div>

        <div class="navbar-buttons navbar-header pull-right" role="navigation">
          <ul class="nav ace-nav">
            <li class="grey dropdown-modal">
              <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <i class="ace-icon fa fa-tasks"></i>
                <span class="badge badge-grey">4</span>
              </a>

            </li>

            <li class="purple dropdown-modal">
              <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <i class="ace-icon fa fa-bell icon-animated-bell"></i>
                <span class="badge badge-important">8</span>
              </a>

            </li>

            <li class="green dropdown-modal">
              <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
                <span class="badge badge-success">5</span>
              </a>

            </li>

            <li class="light-blue dropdown-modal">
              <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                <img class="nav-user-photo" src="../../public/ace/assets/images/avatars/user.jpg" alt="Jason's Photo" />
                <span class="user-info">
									<small>欢迎:</small>
                  <span>{{loginUser.name}}</span>
								</span>

                <i class="ace-icon fa fa-caret-down"></i>
              </a>

              <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                <li>
                  <a href="#">
                    <i class="ace-icon fa fa-cog"></i>
                    系统设置
                  </a>
                </li>

                <li>
                  <a href="profile.html">
                    <i class="ace-icon fa fa-user"></i>
                    个人信息
                  </a>
                </li>

                <li class="divider"></li>

                <li>
                  <a v-on:click="logout()" href="#">
                    <i class="ace-icon fa fa-power-off"></i>
                    退出登录
                  </a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div><!-- /.navbar-container -->
    </div>

    <div class="main-container ace-save-state" id="main-container">

      <div id="sidebar" class="sidebar                  responsive                    ace-save-state">
        <div class="sidebar-shortcuts" id="sidebar-shortcuts">
          <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
            <button class="btn btn-success">
              <i class="ace-icon fa fa-signal"></i>
            </button>

            <button class="btn btn-info">
              <i class="ace-icon fa fa-pencil"></i>
            </button>

            <button class="btn btn-warning">
              <i class="ace-icon fa fa-users"></i>
            </button>

            <button class="btn btn-danger">
              <i class="ace-icon fa fa-cogs"></i>
            </button>
          </div>

          <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
          </div>
        </div><!-- /.sidebar-shortcuts -->

        <ul class="nav nav-list">
          <li class="active open" id="welcome-sidebar">
            <router-link to="/welcome">
              <i class="menu-icon fa fa-tachometer"></i>
              <span class="menu-text"> 欢迎 </span>
            </router-link>

            <b class="arrow"></b>
          </li>

          <li v-show="hasResource('01')" class="active open">
            <a href="#" class="dropdown-toggle">
              <i class="menu-icon fa fa-list"></i>
              <span class="menu-text"> 系统管理 </span>

              <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
              <li v-show="hasResource('0101')" class="" id="system-user-sidebar">
                <router-link to="/system/user">
                  <i class="menu-icon fa fa-caret-right"></i>
                  用户管理
                </router-link>

                <b class="arrow"></b>
              </li>

              <li v-show="hasResource('0102')" class="" id="system-resource-sidebar">
                <router-link to="/system/resource">
                  <i class="menu-icon fa fa-caret-right"></i>
                  资源管理
                </router-link>

                <b class="arrow"></b>
              </li>

              <li v-show="hasResource('0103')" class="" id="system-role-sidebar">
                <router-link to="/system/role">
                  <i class="menu-icon fa fa-caret-right"></i>
                  角色管理
                </router-link>

                <b class="arrow"></b>
              </li>
            </ul>
          </li>

          <li v-show="hasResource('02')" class="active open">
            <a href="#" class="dropdown-toggle">
              <i class="menu-icon fa fa-list"></i>
              <span class="menu-text"> 业务管理 </span>

              <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
              <li v-show="hasResource('0201')" class="" id="business-category-sidebar">
                <router-link to="/business/category">
                  <i class="menu-icon fa fa-caret-right"></i>
                  分类管理
                </router-link>

                <b class="arrow"></b>
              </li>
              <li v-show="hasResource('0202')" class="" id="business-course-sidebar">
                <router-link to="/business/course">
                  <i class="menu-icon fa fa-caret-right"></i>
                  课程管理
                </router-link>

                <b class="arrow"></b>
              </li>
              <li v-show="hasResource('0203')" class="" id="business-teacher-sidebar">
                <router-link to="/business/teacher">
                  <i class="menu-icon fa fa-caret-right"></i>
                  讲师管理
                </router-link>

                <b class="arrow"></b>
              </li>
              <li v-show="hasResource('0204')" class="" id="business-member-sidebar">
                <router-link to="/business/member">
                  <i class="menu-icon fa fa-caret-right"></i>
                  会员管理
                </router-link>

                <b class="arrow"></b>
              </li>
              <li v-show="hasResource('0205')" class="" id="business-sms-sidebar">
                <router-link to="/business/sms">
                  <i class="menu-icon fa fa-caret-right"></i>
                  短信管理
                </router-link>

                <b class="arrow"></b>
              </li>
            </ul>
          </li>

          <li v-show="hasResource('03')" class="active open">
            <a href="#" class="dropdown-toggle">
              <i class="menu-icon fa fa-list"></i>
              <span class="menu-text"> 文件管理 </span>

              <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">
              <li v-show="hasResource('0301')" class="" id="file-file-sidebar">
                <router-link to="/file/file">
                  <i class="menu-icon fa fa-caret-right"></i>
                  文件管理
                </router-link>

                <b class="arrow"></b>
              </li>
            </ul>
          </li>
        </ul><!-- /.nav-list -->

        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
          <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>
      </div>

      <div class="main-content">
        <div class="main-content-inner">
          <div class="page-content">
            <div class="row">
              <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <router-view></router-view>
                <!-- PAGE CONTENT ENDS -->
              </div><!-- /.col -->
            </div><!-- /.row -->
          </div><!-- /.page-content -->
        </div>
      </div><!-- /.main-content -->

      <div class="footer">
        <div class="footer-inner">
          <div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">彭云禄</span>
							Imooc &copy; 2021-2022
						</span>

            &nbsp; &nbsp;
            <span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>
          </div>
        </div>
      </div>

      <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
      </a>
    </div><!-- /.main-container -->
  </div>
</template>

<script>
  export default {
    name: "admin",
    data: function() {
      return {
        loginUser: {},
      }
    },
    mounted: function (){
      let _this = this;
      $("body").removeClass("login-layout light-login");
      $("body").attr("class", "no-skin");

      //sidebar激活样式方法二
      _this.activeSidebar(_this.$route.name.replace("/", "-") + "-sidebar");

      $.getScript('/ace/assets/js/ace.min.js');

      _this.loginUser = Tool.getLoginUser();

      if (!_this.hasResourceRouter(_this.$route.name)) {
        _this.$router.push("/login");
      }
    },
    watch: {
      $route: {
        handler:function(val, oldVal){
          // sidebar激活样式方法二
          console.log("---->页面跳转:", val, oldVal);
          let _this = this;

          if (!_this.hasResourceRouter(val.name)) {
            _this.$router.push("/login");
            return;
          }

          _this.$nextTick(function(){  //页面加载完成后执行
            _this.activeSidebar(_this.$route.name.replace("/", "-") + "-sidebar");
          })
        }
      }
    },
    methods:{
      /**
       * 查找是否有权限
       * @param router
       */
      hasResourceRouter(router) {
        let _this = this;
        let resources = Tool.getLoginUser().resources;
        if (Tool.isEmpty(resources)) {
          return false;
        }
        for (let i = 0; i < resources.length; i++) {
          if (router === resources[i].page) {
            return true;
          }
        }
        return false;
      },

      /**
       * 查找是否有权限
       * @param id
       */
      hasResource(id) {
        return Tool.hasResource(id);
      },

      login(){
        this.$router.push("/admin")
      },

      /**
       * 菜单激活样式，id是当前点击的菜单的id
       * @param id
       */
      activeSidebar: function (id) {
        // 兄弟菜单去掉active样式，自身增加active样式
        $("#" + id).siblings().removeClass("active");
        $("#" + id).siblings().find("li").removeClass("active");
        $("#" + id).addClass("active");

        // 如果有父菜单，父菜单的兄弟菜单去掉open active，父菜单增加open active
        // let parentLi = $("#" + id).parents("li");
        // if (parentLi) {
        //   parentLi.siblings().removeClass("open active");
        //   parentLi.siblings().find("li").removeClass("active");
        //   parentLi.addClass("open active");
        //   console.log(parentLi);
        // }
      },

      logout(){
        let _this = this;

        Loading.show();
        _this.$axios.get(process.env.VUE_APP_SERVER + '/system/admin/user/logout/').then((response)=>{
          Loading.hide();
          let resp = response.data;
          if (resp.success) {
            Tool.setLoginUser(null);
            _this.$router.push("/login")
          } else {
            Toast.warning(resp.message)
          }
        });
      }
    }
  }
</script>