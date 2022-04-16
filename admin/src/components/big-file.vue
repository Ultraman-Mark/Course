<template>
  <div>
    <button type="button" v-on:click="selectFile()" class="btn btn-white btn-default btn-round">
      <i class="ace-icon fa fa-upload"></i>
      {{text}}
    </button>
    <input class="hidden" type="file" ref="file" v-on:change="uploadFile()" v-bind:id="inputId+'-input'">
  </div>
</template>

<script>
export default {
  name: 'big-file',
  props: {
    text: {
      default: "上传大文件"
    },
    inputId: {
      default: "file-upload"
    },
    suffixs: {
      default: []
    },
    use: {
      default: ""
    },
    afterUpload: {
      type: Function,
      default: null
    },
  },
  data: function () {
    return {
    }
  },
  methods: {
    uploadFile() {
      let _this = this;
      let formData = new window.FormData();
      let file = _this.$refs.file.files[0];

      console.log(file);
      /*
        name: "test.mp4"
        lastModified: 1901173357457
        lastModifiedDate: Tue May 27 2099 14:49:17 GMT+0800 (中国标准时间) {}
        webkitRelativePath: ""
        size: 37415970
        type: "video/mp4"
      */

      // 生成文件标识，标识多次上传的是不是同一个文件
      let key = hex_md5(file);
      let key10 = parseInt(key, 16);
      let key62 = Tool._10to62(key10);
      console.log(key, key10, key62);

      //判断文件格式
      let suffixs = _this.suffixs;
      let fileName = file.name;
      let suffix = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length).toLowerCase();
      let validateSuffix = false;
      for (let i = 0; i < suffixs.length; i++) {
        if (suffixs[i].toLowerCase() === suffix) {
          validateSuffix = true;
          break;
        }
      }
      if (!validateSuffix) {
        Toast.warning("文件格式不正确！只支持上传:" + suffixs.join(","));
        $("#" + _this.inputId + "-input").val("");
        return;
      }

      // 文件分片
      let shardSize = 3 * 1024 * 1024;    //以3MB为一个分片
      let shardIndex = 1;		//分片索引，1表示第1个分片

      let size = file.size;
      let shardTotal = Math.ceil(size / shardSize);

      let param = {
        'shardIndex': shardIndex,
        'shardSize': shardSize,
        'shardTotal': shardTotal,
        'use': _this.use,
        'name': file.name,
        'suffix': suffix,
        'size': file.size,
        'key': key62
      };

      _this.upload(param);
    },

    upload (param){
      let _this = this;
      let shardIndex = param.shardIndex;
      let shardTotal = param.shardTotal;
      let shardSize = param.shardSize;
      let fileShard = _this.getFileShard(shardIndex, shardSize);
      //将图片转为basr64进行传输
      let fileReader = new FileReader();

      fileReader.onload = function (e){
        let base64 = e.target.result;
        param.shard = base64;

        Loading.show();
        _this.$axios.post(process.env.VUE_APP_SERVER + '/file/admin/upload/' , param).then((response)=>{
          Loading.hide();
          let resp = response.data;
          console.log("上传文件成功:", resp);
          if(shardIndex<shardTotal){
            //上传下一个分片
            param.shardIndex = param.shardIndex + 1;
            _this.upload(param);
          }else {
            _this.afterUpload(resp);
          }
          $("#" + _this.inputId + "-input").val("");
        });
      };
      fileReader.readAsDataURL(fileShard);
    },

    getFileShard(shardIndex, shardSize) {
      let _this = this;
      let file = _this.$refs.file.files[0];
      let start = (shardIndex - 1) * shardSize;
      let end = Math.min(file.size, start + shardSize);
      console.log("start:"+start+" end:"+end);
      let fileShard = file.slice(start, end);
      return fileShard;
    },

    selectFile() {
      let _this = this;
      $("#" + _this.inputId + "-input").trigger("click");
    }
  }
}
</script>
