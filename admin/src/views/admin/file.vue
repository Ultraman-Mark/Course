<template>
  <div>
    <p>
      <button v-on:click="list(1)" class="btn btn-white btn-default btn-round">
        <i class="ace-icon fa fa-refresh"></i>
        刷新
      </button>
    </p>

    <pagination ref="pagination" v-bind:list="list"></pagination>

    <table id="simple-table" class="table  table-bordered table-hover">
      <thead>
      <tr>
        <th>id</th>
        <th>相对路径</th>
        <th>文件名</th>
        <th>后缀</th>
        <th>大小</th>
        <th>用途</th>
      </tr>
      </thead>

      <tbody>
      <tr v-for="file in files">
        <td>{{file.id}}</td>
        <td>{{file.path}}</td>
        <td>{{file.name}}</td>
        <td>{{file.suffix}}</td>
        <td>{{file.size}}</td>
        <td>{{ $filters.filter(file.use) }}</td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
  import Pagination from "../../components/pagination"
  export default {
    components:{Pagination},
    name: "file-file",
    data: function (){
      return {
        file:{},
        files: [],
        FILE_USE: FILE_USE,
      }
    },
    mounted: function (){
      let _this = this;
      _this.$refs.pagination.size = 5;
      _this.list(1);
      //sidebar激活样式方法一
      // this.$parent.$parent.activeSidebar("file-file-sidebar");
    },
    methods:{

      /**
       * 列表查询
       */
      list(page){
        let _this = this;
        Loading.show();
        _this.$axios.post(process.env.VUE_APP_SERVER+'/file/admin/file/list',{
          page: page,
          size: _this.$refs.pagination.size,
        }).then((response)=>{
          Loading.hide();
          let respd = response.data;
          _this.files = respd.content.list;
          _this.$refs.pagination.render(page,respd.content.total);
        })
      },
    }
  }
</script>