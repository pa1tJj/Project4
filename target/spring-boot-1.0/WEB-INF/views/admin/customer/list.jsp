<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PHAN ANH TUAN
  Date: 5/23/2025
  Time: 8:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerURL" value="/admin/customer-list"/>
<c:url var="customerAPI" value="/api/customer"/>
<html>
<head>
    <title>Danh sách khách hàng</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">Quản lý khách hàng</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    Danh sách khách hàng
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12 ">
                    <div class="widget-box ui-sortable-handle">
                        <div class="widget-header">
                            <h5 class="widget-title">Tìm kiếm</h5>

                            <div class="widget-toolbar">
                                <a href="#" data-action="collapse">
                                    <i class="ace-icon fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>

                        <div class="widget-body" style="display: block; font-family: 'Times New Roman', Times, serif;">
                            <div class="widget-main">
                                <form:form action="${customerURL}" modelAttribute="modelSearch" id="listFormCustomer"
                                           method="GET">
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-xs-12 ">
                                                <div class="col-xs-4">
                                                    <label class="name">Tên khách hàng</label>
                                                    <form:input class="form-control" path="fullName"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="name">Di động</label>
                                                    <form:input class="form-control" path="phone"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="name">Email</label>
                                                    <form:input class="form-control" path="email"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 ">
                                                <div class="col-xs-2">
                                                    <security:authorize access="hasRole('MANAGER')">
                                                        <label class="name">Nhân viên</label>
                                                        <form:select class="form-control" path="staffId">
                                                            <form:option value="">---Chọn nhân viên---</form:option>
                                                            <form:options items="${listStaffs}"/>
                                                        </form:select>
                                                    </security:authorize>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 ">
                                                <div class="col-xs-6">
                                                    <button type="button" class="btn btn-danger" id="btnSearchCustomer">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                             fill="currentColor" class="bi bi-search"
                                                             viewBox="0 0 16 16">
                                                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
                                                        </svg>
                                                        Tìm kiếm
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>

                            </div>
                        </div>
                    </div>

                    <div class="pull-right">
                        <a href="/admin/customer-edit">
                            <button class="btn btn-info" title="thêm khách hàng">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-person-fill-add" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                    <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                </svg>
                            </button>
                        </a>

                        <security:authorize access="hasRole('MANAGER')">
                            <button class="btn btn-danger" title="xóa khách hàng" id="btnDeleteCustomer">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-person-fill-dash" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1m0-7a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                    <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                </svg>
                            </button>
                        </security:authorize>

                    </div>
                </div>
            </div>
        </div>

        <!-- bảng danh sách -->
        <div class="row">
            <div class="col-xs-12">
                <table id="tableList" style="margin: 3em 0 0;"
                       class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="center">
                            <label class="pos-rel">
                                <input type="checkbox" class="ace" value="" name="checkList">
                                <span class="lbl"></span>
                            </label>
                        </th>
                        <th>Tên khách hàng</th>
                        <th>Di động</th>
                        <th>Email</th>
                        <th>Nhu cầu</th>
                        <th>Người thêm</th>
                        <th>Ngày thêm</th>
                        <th>Tình trạng</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="item" items="${customerList}">
                        <tr>
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" name="checkList" value="${item.id}">
                                    <span class="lbl"></span>
                                </label>
                            </td>

                            <td>${item.fullName}</td>
                            <td>${item.phone}</td>
                            <td>${item.email}</td>
                            <td>${item.demand}</td>
                            <td>${item.createdBy}</td>
                            <td>${item.createdDate}</td>
                            <td>${item.status}</td>

                            <td>
                                <div class="hidden-sm hidden-xs btn-group">
                                    <security:authorize access="hasRole('MANAGER')">
                                        <button class="btn btn-xs btn-success" title="giao khách hàng"
                                                onclick="assignmentCustomer(${item.id})">
                                            <i class="ace-icon glyphicon glyphicon-list"></i>
                                        </button>
                                    </security:authorize>

                                    <a class="btn btn-xs btn-info" title="sửa khách hàng"
                                       href="/admin/customer-edit-${item.id}" onclick="">
                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                    </a>

                                    <security:authorize access="hasRole('MANAGER')">
                                        <button class="btn btn-xs btn-danger" title="xóa khách hàng"
                                                onclick="deleteCustomer(${item.id})">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </button>
                                    </security:authorize>
                                </div>

                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div><!-- /.span -->
        </div>
    </div><!-- /.page-content -->
</div><!-- /.main-content -->

<div class="modal fade" id="assignmentCustomerModal" role="dialog"
     style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table id="staffList" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>Chọn</th>
                        <th>Tên nhân viên</th>
                    </tr>
                    </thead>

                    <tbody>
                    </tbody>
                </table>
                <input type="hidden" name="customerId" id="customerId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="btnassignmentCustomer">Giao khách hàng</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
<script src="assets/js/jquery.2.1.1.min.js"></script>


<script>
    function assignmentCustomer(customerId) {
        $('#assignmentCustomerModal').modal();
        loadStaff(customerId);
        $('#customerId').val(customerId);
    }

    $('#btnassignmentCustomer').click(function (e) {
        e.preventDefault();
        var data = {};
        data['customerId'] = $('#customerId').val();
        var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if (data['staffs'] != '') {
            assignment(data);
        }
    })

    //hiển thị khách hàng đã được giao cho nhân viên
    function loadStaff(customerId) {
        $.ajax({
            url: "${customerAPI}/" + customerId + '/staffs',
            type: "GET",
            // data: JSON.stringify(data),
            // contentType: "application/JSON",
            dataType: 'json',
            success: function (response) {
                var row = '';
                $.each(response.data, function (index, item) {
                    row += '<tr>';
                    row += '<td class="text-center"><input type="checkbox" value=' + item.staffId + ' id="checkbox_' + item.staffId + '" class = " checkbox-element "' + item.checked + '/></td>';
                    row += '<td class="text-center">' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
                console.info("success");
            },
            error: function (response) {
                console.log("failed");
                window.location.href = "<c:url value="/admin/customer-list?message=error"/>";
                console.log(response);
            }
        });
    }

    function assignment(data) {
        $.ajax({
            url: "${customerAPI}/" + 'assignment',
            type: "POST",
            data: JSON.stringify(data),
            contentType: "application/JSON",
            //dataType: 'json',
            success: function (response) {
                window.location.href = "<c:url value="/admin/customer-list?message=giao-thanh-cong"/>";
            },
            error: function (response) {
                console.info("giao khônng thành công");
                window.location.href = "<c:url value="/admin/customer-list?message=error"/>";
                console.log(response);
            }
        });
    }

    //thực hiện Tìm kiếm
    $('#btnSearchCustomer').click(function (e) {
        e.preventDefault();
        $('#listFormCustomer').submit();
    });

    //phần xoas khách hàng
    //xử lý xóa một lúc nhiều khách hàng
    $('#btnDeleteCustomer').click(function (e) {
        e.preventDefault();
        var data = {};
        data['customerId'] = $('#customerId').val();
        var customerIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        deleteCustomers(customerIds);
    })

    //xử lý xóa từng tòa nhà
    function deleteCustomer(customerId) {
        var customerId = [customerId];
        deleteCustomers(customerId);
    }

    function deleteCustomers(data) {
        $.ajax({
            type: "DELETE",
            url: "${customerAPI}/" + data,
            data: JSON.stringify(data),
            contentType: "application/JSON",
            //dataType: "JSON",
            success: function (respond) {
                window.location.href = "<c:url value="/admin/customer-list?message=xoa-thanh-cong"/>";
                console.log("success");
            },
            error: function (respond) {
                console.log("failed");
                console.log(respond);
            }
        });
    }
</script>
</body>
</html>
