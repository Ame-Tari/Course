<template>
  <div>
    <p>
      <button v-on:click="add()" class="btn btn-white btn-default btn-round">
        <i class="ace-icon fa fa-edit"></i>
        新增
      </button>
      &nbsp;
      <button v-on:click="list(1)" class="btn btn-white btn-default btn-round">
        <i class="ace-icon fa fa-refresh"></i>
        刷新
      </button>
    </p>

    <pagination ref="pagination" v-bind:list="list" v-bind:itemCount="8"></pagination>
    <div class="row">
      <div v-for="course in courses" class="col-md-4">
        <div class="thumbnail search-thumbnail">
          <img v-show="!course.image" class="media-object" src="/static/image/demo-course.jpg" />
          <img v-show="course.image" class="media-object" v-bind:src="course.image" />
          <div class="caption">
            <div class="clearfix">
              <span class="pull-right label label-primary info-label">
                <td>{{COURSE_LEVEL | optionKV(course.level)}}</td>
              </span>
              <span class="pull-right label label-primary info-label">
                <td>{{COURSE_CHARGE | optionKV(course.charge)}}</td>
              </span>
              <span class="pull-right label label-primary info-label">
               <td>{{COURSE_STATUS | optionKV(course.status)}}</td>
              </span>
            </div>
            <h3 class="search-title">
              <a href="#" class="blue">{{course.name}}</a>
            </h3>
            <p>
              <span class="blue bolder bigger-150">{{course.price}}&nbsp;<i class="fa fa-rmb"></i> </span>
            </p>
            <p>{{course.summary}}</p>
            <p>
              <button v-on:click="toChapter(course)" class="btn btn-xs btn-info">
                <i class="ace-icon fa fa-pencil bigger-120"></i>
                大章
              </button>
              <button v-on:click="edit(course)" class="btn btn-xs btn-info">
                <i class="ace-icon fa fa-pencil bigger-120"></i>
                编辑
              </button>
              <button v-on:click="del(course.id)" class="btn btn-xs btn-danger">
                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                删除
              </button>
            </p>
            <p>
              <span class="badge badge-info">{{course.id}}</span>
              <span class="badge badge-info">{{course.sort}}</span>
              <span class="badge badge-info">{{course.time | formatSecond}}</span>
            </p>
          </div>
        </div>
      </div>
    </div>

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
                <label class="col-sm-2 control-label">分类</label>
                <div class="col-sm-10">
                  <ul id="tree" class="ztree"></ul>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">名称</label>
                <div class="col-sm-10">
                  <input v-model="course.name" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">概述</label>
                <div class="col-sm-10">
                  <input v-model="course.summary" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">时长</label>
                <div class="col-sm-10">
                  <input v-model="course.time" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">价格（元）</label>
                <div class="col-sm-10">
                  <input v-model="course.price" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">封面</label>
                <div class="col-sm-10">
                  <input v-model="course.image" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">级别</label>
                <div class="col-sm-10">
                  <select v-model="course.level" class="form-control">
                    <option v-for="o in COURSE_LEVEL" v-bind:value="o.key">{{o.value}}</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">收费</label>
                <div class="col-sm-10">
                  <select v-model="course.charge" class="form-control">
                    <option v-for="o in COURSE_CHARGE" v-bind:value="o.key">{{o.value}}</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">状态</label>
                <div class="col-sm-10">
                  <select v-model="course.status" class="form-control">
                    <option v-for="o in COURSE_STATUS" v-bind:value="o.key">{{o.value}}</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">报名数</label>
                <div class="col-sm-10">
                  <input v-model="course.enroll" class="form-control">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">顺序</label>
                <div class="col-sm-10">
                  <input v-model="course.sort" class="form-control">
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
  import Pagination from "../../components/pagination";
  import category from "./category";
  export default {
    components: {Pagination},
    name: "business-course",
    data: function() {
      return {
        course: {},
        courses: [],
        COURSE_LEVEL: COURSE_LEVEL,
        COURSE_CHARGE: COURSE_CHARGE,
        COURSE_STATUS: COURSE_STATUS,
        categorys: [],
        tree: {},
      }
    },
    mounted: function() {
      let _this = this;
      _this.$refs.pagination.size = 5;
      _this.allCategory();
      _this.list(1);
      // sidebar激活样式方法一
      // this.$parent.activeSidebar("business-course-sidebar");

    },
    methods: {
      /**
       * 点击【新增】
       */
      add() {
        let _this = this;
        _this.course = {};
        _this.tree.checkAllNodes(false);
        $("#form-modal").modal("show");
      },

      /**
       * 点击【编辑】
       */
      edit(course) {
        let _this = this;
        _this.course = $.extend({}, course);
        _this.listCategory(course.id);
        $("#form-modal").modal("show");
      },

      /**
       * 点击【大章】
       */
      toChapter(course) {
        let _this = this;
        SessionStorage.set("course", course);
        _this.$router.push("/business/chapter")
      },

      /**
       * 列表查询
       */
      list(page) {
        let _this = this;
        Loading.show();
        _this.$ajax.post( 'http://127.0.0.1:9000/business/admin/course/list', {
          page: page,
          size: _this.$refs.pagination.size,
        }).then((response)=>{
          Loading.hide();
          let resp = response.data;
          _this.courses = resp.content.list;
          _this.$refs.pagination.render(page, resp.content.total);

        })
      },
      /**
       * 点击【保存】
       */
      save() {
        let _this = this;

        // 保存校验
        if (1 != 1
          || !Validator.require(_this.course.name, "名称")
          || !Validator.length(_this.course.name, "名称", 1, 50)
          || !Validator.require(_this.course.summary, "概述")
          || !Validator.length(_this.course.summary, "概述", 1, 50)
          || !Validator.require(_this.course.time, "时长")
          || !Validator.require(_this.course.price, "价格（元）")
          || !Validator.require(_this.course.level, "级别")
          || !Validator.length(_this.course.level, "级别", 1, 50)
          || !Validator.require(_this.course.charge, "收费")
          || !Validator.length(_this.course.charge, "收费", 1, 50)
          || !Validator.require(_this.course.status, "状态")
          || !Validator.length(_this.course.status, "状态", 1, 50)
          || !Validator.require(_this.course.enroll, "报名数")
        ) {
          return;
        }
        let categorys = _this.tree.getCheckedNodes();
        if (Tool.isEmpty(categorys)) {
          Toast.warning("请选择分类！");
          return;
        }
        Loading.show();
        console.log(categorys);
        _this.course.categorys = categorys;
        _this.$ajax.post( 'http://127.0.0.1:9000/business/admin/course/save', _this.course).then((response)=>{
          Loading.hide();
          let resp = response.data;
          if (resp.success) {
            $("#form-modal").modal("hide");
            _this.list(1);
            Toast.success("保存成功！");
          } else {
            Toast.warning(resp.message)
          }
        })
      },

      /**
       * 点击【删除】
       */
      del(id) {
        let _this = this;
        Confirm.show("删除课程后不可恢复，确认删除？", function () {
          Loading.show();
          _this.$ajax.delete( 'http://127.0.0.1:9000/business/admin/course/delete/' + id).then((response)=>{
            Loading.hide();
            let resp = response.data;
            if (resp.success) {
              _this.list(1);
              Toast.success("删除成功！");
            }
          })
        });
      },
      allCategory() {
        let _this = this;
        Loading.show();
        _this.$ajax.post('http://127.0.0.1:9000/business/admin/category/all').then((response)=>{
          Loading.hide();
          let resp = response.data;
          _this.categorys = resp.content;
          console.log(_this.categorys);
          _this.initTree();
        })
      },
      initTree() {
        let _this = this;
        let setting = {
          check: {
            enable: true
          },
          data: {
            simpleData: {
              idKey: "id",
              pIdKey: "parent",
              rootPId: "00000000",
              enable: true
            }
          }
        };

        let zNodes = _this.categorys;

        _this.tree = $.fn.zTree.init($("#tree"), setting, zNodes);

        // 展开所有的节点
        // _this.tree.expandAll(true);

      },
      /**
       * 查找课程下所有分类
       * @param courseId
       */
      listCategory(courseId) {
        let _this = this;
        Loading.show();
        _this.$ajax.post( 'http://127.0.0.1:9000/business/admin/course/list-category/' + courseId).then((res)=>{
          Loading.hide();
          console.log("查找课程下所有分类结果：", res);
          let response = res.data;
          let categorys = response.content;

          // 勾选查询到的分类
          _this.tree.checkAllNodes(false);
          for (let i = 0; i < categorys.length; i++) {
            let node = _this.tree.getNodeByParam("id", categorys[i].categoryId);
            _this.tree.checkNode(node, true);
          }
        })
      },

    }
  }
</script>

<style>
  .caption h3{
    font-size: 20px;
  }
</style>