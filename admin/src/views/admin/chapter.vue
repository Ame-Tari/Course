<template>
  <div>
    <h4 class="lighter">
      <i class="ace-icon fa fa-hand-o-right icon-animated-hand-pointer blue"></i>
      <router-link to="/business/course" class="pink"> {{course.name}} </router-link>
    </h4>
    <hr>
    <p>
      <router-link to="/business/course" class="btn btn-white btn-default btn-round">
        <i class="ace-icon fa fa-arrow-left"></i>
        返回课程
      </router-link>
      &nbsp;
      <button v-on:click="add()" class="btn btn-white btn-default btn-round">
      <i class="ace-icon fa fa-edit"></i>
        新增
    </button>
      &nbsp;
      <button v-on:click="list()" class="btn btn-white btn-default btn-round">
        <i class="ace-icon fa fa-refresh"></i>
        刷新
      </button>

    </p>
    <pagination ref="pagination" v-bind:list="list"></pagination>
    <table id="simple-table" class="table  table-bordered table-hover">
      <thead>
      <tr>
        <th>ID</th>
        <th>名称</th>
        <th>操作</th>

      </tr>
      </thead>

      <tbody>
      <tr v-for="chapter in chapters">
        <td>{{chapter.id}}</td>
        <td>{{chapter.name}}</td>
        <td>
          <div class="hidden-sm hidden-xs btn-group">
            <button v-on:click="toSection(chapter)" class="btn btn-white btn-xs btn-info btn-round">
              小节
            </button>&nbsp;
            <button v-on:click="edit(chapter)" class="btn btn-white btn-xs btn-info btn-round">
              编辑
            </button>&nbsp;
            <button v-on:click="del(chapter.id)" class="btn btn-white btn-xs btn-warning btn-round">
              删除
            </button>
          </div>

        </td>
      </tr>
      </tbody>
    </table>
    <div id="form-modal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">表单</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal">
              <div class="form-group">
                <label  class="col-sm-2 control-label">名称</label>
                <div class="col-sm-10">
                  <input  v-model="chapter.name" class="form-control"  placeholder="名称">
                </div>
              </div><div class="form-group">
                <label  class="col-sm-2 control-label">课程</label>
                <div class="col-sm-10">
                    <p class="form-control-static">{{course.name}}</p>
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            <button v-on:click="save()" type="button" class="btn btn-primary">保存</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
  </div>
</template>

<script>
  import Pagination from "../../components/pagination"

  export default {
    components: {Pagination},
    name: "chapter",
    data: function () {
      return {
        chapter: {},
        chapters: [],
        course: {},
      }
    },
    mounted: function () {
      let _this = this;
      _this.$refs.pagination.size = 5;
      let course = SessionStorage.get("course") || {};
      if (Tool.isEmpty(course)) {
        _this.$router.push("/welcome");
      }
      _this.course = course;
      _this.list(1);
      //页面初始化时执行
    },
    methods: {
      add() {
        let _this = this;
        _this.$refs.pagination.size = 5;
        _this.list(1);
          //模态框展示
          $("#form-modal").modal("show");
      },
      edit(chapter){
        let _this = this;
        _this.chapter = $.extend({}, chapter);
        $("#form-modal").modal("show");
      },
      del(id) {
        let _this = this;
        Confirm.show("删除后不可恢复，确认删除？",function () {
          loading.show();
          _this.$ajax.delete('http://127.0.0.1:9000/business/admin/chapter/delete/' + id).then((Response => {
                loading.hide();
                let response = Response.data;
                if (response.success) {
                  _this.list(1);
                  toast.success("删除成功！");
                }
              }
            )
          );
        })
      },
      list(page) {
        let _this = this;
        Loading.show();
        _this.$ajax.post('http://127.0.0.1:9000/business/admin/chapter/list', {
          page: page,
          size: _this.$refs.pagination.size,
          courseId: _this.course.id
        }).then((Response => {
          //console.log("查询大章列表结果：", Response);
          Loading.hide();
          let response = Response.data;
          _this.chapters = response.content.list;
          _this.$refs.pagination.render(page, response.content.total);
        }))
      },
      save() {
        let _this = this;
        if (!Validator.require(_this.chapter.name, "名称")
          || !Validator.length(_this.chapter.courseId, "课程ID", 1, 8)
        ) {
          return;
        }
        //保存校验
        _this.chapter.courseId = _this.course.id;
        Loading.show();
        _this.$ajax.post('http://127.0.0.1:9000/business/admin/chapter/save', _this.chapter)
          .then((Response => {
          //console.log("保存大章列表结果：", Response);
            Loading.hide();
          let response = Response.data;
          if (response.success) {
            $("#form-modal").modal("show");
            _this.list(1);
            Toast.success("保存成功");
          }else
          {
            Toast.warning(response.message)
          }
        }))
      },
      toSection(chapter) {
        let _this = this;
        SessionStorage.set("chapter", chapter);
        _this.$router.push(
          {
            path: "/business/section"
          });
      },
    }
  };
</script>