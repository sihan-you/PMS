<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.system.vo.Protype" %>
<%@ include file="/view/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript">
        $(document).ready(function () {
            window.menu = function (id) {
                $.zgx_dialog({
                    width: 500,
                    height: 500,
                    title: '权限编辑',
                    url: '<%=path%>/role/toEditRoleMenu?roleId=' + id
                });
            }
        });
        function expByCheckBox() {
            $.ajax({
                type: "POST",
                url: "<%=path%>/role/exportRole",
                data: $('#form1').serialize(),
                success: function (data) {
                    console.log($('#form1').serialize());
                    if (data == "notOk") {
                        alert("系统错误，请联系管理员!");
                    }
                    location = location;
                }
            });
        }
        function expNoData() {
            $.ajax({
                type: "POST",
                url: "<%=path%>/role/exportRole",
                success: function (data) {
                    if (data == "notOk") {
                        alert("系统错误，请联系管理员!");
                    }
                    location = location;
                }
            });
        }
        function impByCheckBox() {
            $.ajax({
                type: "POST",
                url: "<%=path%>/role/importRole",
                success: function (data) {
                    if (data == "notOk") {
                        alert("系统错误，请联系管理员!");
                    }
                    location = location;
                }
            });
        }
        function delByCheckBox() {
            $.ajax({
                type: "POST",
                url: "<%=path%>/project/delProject",
                data: $('#form1').serialize(),
                success: function (data) {
                    if (data == "notOk") {
                        alert("系统错误，请联系管理员!");
                    }
                    location = location;
                }
            });
        }
    </script>
</head>
<body>
<form action="<%=path%>/project/projectList" method="post" id="form1" name="form1">
    <input type="hidden" id="currentPage" name="currentPage" value="1"/>
    <!-- begin breadcrumb -->

    <!-- end breadcrumb -->
    <!-- begin page-header -->

    <!-- end page-header -->

    <!-- begin row -->
    <div class="row" style="height:800px;">
        <!-- begin col-12 -->
        <div class="col-md-12">
            <!-- begin panel -->
            <div class="panel panel-inverse">
                <div class="panel-heading">

                    <h4 class="panel-title">
                        角色管理
                    </h4>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">


                        <div class="form-group">
                            <label>
                                项目名称：<input name="proname" id="proname"
                                            value="${pageBean.paramMap.proname }" type="text" class=""
                                            placeholder="" aria-controls="data-table"/>
                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp开始时间：<input name="startTime" id="startTime"
                                                                                    value="${pageBean.paramMap.startTime }"
                                                                                    type="date" class=""
                                                                                    placeholder=""
                                                                                    aria-controls="data-table"/>


                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp结束时间：<input name="endTime" id="endTime"
                                                                                    value="${pageBean.paramMap.endTime }"
                                                                                    type="date" class=""
                                                                                    placeholder=""
                                                                                    aria-controls="data-table"/>
                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp预算范围：<input name="budget_min" id="budget_min"
                                                                                    value="${pageBean.paramMap.budget_min }"
                                                                                    type="text" class=""
                                                                                    placeholder=""
                                                                                    aria-controls="data-table"/>
                                -<input name="budget_max" id="budget_max"
                                        value="${pageBean.paramMap.budget_max }" type="text" class=""
                                        placeholder="" aria-controls="data-table"/>
                                <hr>
                                一级类型：<select style="" id="type1" name="type1">
                                <option value="0">请选择一级类型</option>
                                <c:forEach items="${protypes}" var="pp">
                                    <c:if test="${pp.isfather eq '1'}">
                                        <option value="${pp.id}"
                                                <c:if test="${pp.id eq map.type1}">selected</c:if>>${pp.typename}</option>
                                    </c:if>

                                </c:forEach>
                            </select>
                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp二级类型：<select class="" style="" id="type2"
                                                                                     name="type2">
                                <option value="0" id="default_type2">请选择二级类型</option>
                                <c:forEach items="${protypes}" var="pp">
                                    <c:if test="${pp.isfather eq '2'}">
                                        <option value="${pp.id}"
                                                <c:if test="${pp.id eq map.type2}">selected</c:if>
                                                class="${pp.pid} type2">${pp.typename}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                                <hr>
                                所属人名字：<input name="username" id="username"
                                             value="${pageBean.paramMap.username }"
                                             type="text" class=""
                                             placeholder=""
                                             aria-controls="data-table"/>
                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp联系人姓名：<input name="contactName" id="contactName"
                                                                                     value="${pageBean.paramMap.contactName }"
                                                                                     type="text" class=""
                                                                                     placeholder=""
                                                                                     aria-controls="data-table"/>
                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp地区：<select id="area" class="area"
                                                                                   name="area"></select>
                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp城市：<select id="city" class="city"
                                                                                   name="city"></select>
                                <hr>
                                省份：<select id="province" class="province" name="province"></select>

                                进程阶段:<select class="form-"
                                             style="width:auto;" id="processId"
                                             name="processId">
                                <option value="">请选择项目进展阶段</option>
                                <c:forEach items="${process}" var="pp">
                                    <option value="${pp.id}"
                                            <c:if test="${pp.pname eq map.pname}">selected</c:if>>
                                            ${pp.pname}
                                    </option>
                                </c:forEach>
                            </select>
                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp项目来源部门：<input name="sourceDepartment"
                                                                                      id="sourceDepartment"
                                                                                      value="${pageBean.paramMap.sourceDepartment }"
                                                                                      type="text" class=""
                                                                                      placeholder=""
                                                                                      aria-controls="data-table"/>
                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp审核状态：<input name="approvalState"
                                                                                    id="approvalState"
                                                                                    value="${pageBean.paramMap.approvalState }"
                                                                                    type="text" class=""
                                                                                    placeholder=""
                                                                                    aria-controls="data-table"/>
                                <a class="btn btn-success btn-sm" href="javascript:$('#form1').submit();"><i
                                        class="fa fa-search"></i> </a>
                            </label>
                        </div>
                        <hr>
                        <div class="form-group">
                            <p>
                                <c:set var="view" value="0"/>
                                <c:set var="update" value="0"/>
                                <c:forEach items="${menulist }" var="q">
                                    <c:if test="${fn:containsIgnoreCase(q.menuurl, '/project/projectList')}">
                                        <c:forEach items="${mymenulist }" var="e">

                                            <%--<c:out value="${q.id}"></c:out>--%>
                                            <c:if test="${fn:split(e.menu_id, '.')[0] == q.id}">
                                                <c:if test="${fn:containsIgnoreCase(e.menu_id, 'add')}"><a
                                                        class="btn btn-sm btn-success"
                                                        href="<%=path%>/view/system/role/editRole.jsp"><i
                                                        class="fa fa-plus"></i> 添加</a> </c:if>
                                                <c:if test="${fn:containsIgnoreCase(e.menu_id, 'delete')}"><a
                                                        data-toggle="modal" class="btn btn-sm btn-success"
                                                        href="javascript:delByCheckBox();"><i
                                                        class="fa fa-times"></i>删除</a></c:if>
                                                <c:if test="${fn:containsIgnoreCase(e.menu_id, 'import')}"><a
                                                        class="btn btn-sm btn-success"
                                                        href="javascript:impByCheckBox();">
                                                    <i class="fa fa-sign-out"></i>导入</a></c:if>
                                                <c:if test="${fn:containsIgnoreCase(e.menu_id, 'export')}"><a
                                                        class="btn btn-sm btn-success"
                                                        href="javascript:expByCheckBox();">
                                                    <i class="fa fa-sign-out"></i>导出</a></c:if>
                                                <c:if test="${fn:containsIgnoreCase(e.menu_id, 'import')}"><a
                                                        class="btn btn-sm btn-success" href="javascript:expNoData();">
                                                    <i
                                                            class="fa fa-sign-out"></i>导出模板</a></c:if>
                                                <c:if test="${fn:containsIgnoreCase(e.menu_id, 'view')}"><c:set
                                                        var="view"
                                                        value="1"/></c:if>
                                                <c:if test="${fn:containsIgnoreCase(e.menu_id, 'update')}"><c:set
                                                        var="update" value="1"/></c:if>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                            </p>
                        </div>


                        <!-- #modal-dialog-del -->


                        <c:if test="${view == '1' }">

                            <c:if test="${update == '1' }">
                                <table
                                        class="table table-striped table-bordered table-hover table-condensed">
                                    <thead>
                                    <tr>
                                        <th width="3">
                                            <input name="" type="checkbox" value="" id="controlAll"
                                                   onclick="javascript:selectAll();"/>
                                        </th>
                                        <th width="60">
                                            序号
                                        </th>
                                        <th width="">
                                            项目名字
                                        </th>
                                        <th width="100">
                                            开始时间
                                        </th>
                                        <th width="100">
                                            结束时间
                                        </th>
                                        <th width="">
                                            预算
                                        </th>
                                        <th width="">
                                            一级类型
                                        </th>
                                        <th width="">
                                            二级类型
                                        </th>
                                        <th width="">
                                            所属人
                                        </th>
                                        <th width="">
                                            联系人
                                        </th>
                                        <th width="">
                                            地址
                                        </th>
                                        <th width="">
                                            进展阶段
                                        </th>
                                        <th width="">
                                            来源部门
                                        </th>
                                        <th width="200">
                                            项目进展情况
                                        </th>
                                        <th width="">
                                            审批状态
                                        </th>
                                        <th width="">
                                            审批情况
                                        </th>
                                        <th width="">
                                            操作
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageBean.list }" var="v" varStatus="s">
                                        <tr>
                                            <td>
                                                <input name="delCheckBox" type="checkbox" value="${v.id }"/>
                                            </td>
                                            <td>
                                                    ${(pageBean.currentPage-1)*pageBean.pageSize+s.index+1 }
                                            </td>
                                            <td>
                                                    ${v.proname }
                                            </td>
                                            <td>
                                                    ${v.startTime }
                                            </td>
                                            <td>
                                                    ${v.endTime }
                                            </td>
                                            <td>
                                                    ${v.budget }
                                            </td>
                                            <td>
                                                    ${protypes[v.type1].typename}

                                            </td>
                                            <td>
                                                    ${protypes[v.type2].typename}
                                            </td>
                                            <td>
                                                    ${v.username }
                                            </td>
                                            <td>
                                                    ${v.contactName }${v.contactPhone }
                                            </td>
                                            <td>
                                                    ${v.province }${v.city }${v.area }${v.address }
                                            </td>
                                            <td>
                                                    ${v.processId }
                                            </td>
                                            <td>
                                                    ${v.sourceDepartment }
                                            </td>
                                            <td>
                                                    ${v.processDiscription }
                                            </td>
                                            <td>
                                                    ${v.approvalState }
                                            </td>
                                            <td>
                                                    ${v.approvalDiscription }
                                            </td>
                                            <td>
                                                <a href="<%=path %>/project/toUpdateProject?id=${v.id }"><i
                                                        class="fa fa-edit"></i></a>
                                                <!-- <a href="<%=path %>/role/toViewRole?ROLE_ID=${v.ROLE_ID }"><i class="fa fa-arrow-circle-o-right"></i></a>&nbsp;&nbsp;&nbsp;&nbsp; -->

                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>


                            <c:if test="${update == '0' }">
                                <table
                                        class="table table-striped table-bordered table-hover table-condensed">
                                    <thead>
                                    <tr>
                                        <th width="3">
                                            <input name="" type="checkbox" value="" id="controlAll"
                                                   onclick="javascript:selectAll();"/>
                                        </th>
                                        <th width="60">
                                            序号
                                        </th>
                                        <th width="">
                                            角色名称
                                        </th>
                                        <th width="">
                                            备注
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${pageBean.list }" var="v" varStatus="s">
                                        <tr>
                                            <td>
                                                <input name="delCheckBox" type="checkbox" value="${v.id }"/>
                                            </td>
                                            <td>
                                                    ${(pageBean.currentPage-1)*pageBean.pageSize+s.index+1 }
                                            </td>
                                            <td>
                                                    ${v.rolename }
                                            </td>
                                            <td>
                                                    ${v.remark }
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>

                        </c:if>


                        <jsp:include page="/view/common/page.jsp">
                            <jsp:param name="formId" value="form1"/>
                        </jsp:include>


                    </div>
                </div>
            </div>
            <!-- end panel -->
        </div>
        <!-- end col-12 -->
    </div>
    <!-- end row -->


</form>
</body>
<script type="text/javascript" src="<%=path%>/assets/js/area.js"></script>
<script type="text/javascript">

    $('#type1').change(function (index, value) {
//        alert($("#type1").select().val())
        var fatherId = "." + $("#type1").select().val();
        var options = $("option.type2");

        $("#type2").children().each(function () {
            $(this).hide();
        });
        $("#type2").children(fatherId).each(function () {
            $(this).show();
        });
        $("#default_type2").show();
        $("#type2").val("0")

    });

</script>
</html>
