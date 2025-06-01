<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerAPI" value="/api/customer"/>
<html>
<head>
    <title>Title</title>
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
                <c:if test="${empty customerEdit.id}">
                    <li class="active">Thêm khách hàng</li>
                </c:if>
                <c:if test="${not empty customerEdit.id}">
                    <li class="active">Cập nhật khách hàng</li>
                </c:if>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    Thông tin khách hàng
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12 ">

                </div>
            </div>

            <!-- bảng danh sách -->
            <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                <form:form modelAttribute="customerEdit" id="listForm" method="GET">
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form" id="form-edit">
                            <dl class="form-group">
                                <label class="col-xs-3">Tên khách hàng</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="fullName" id="fullName"/>
                                </div>
                            </dl>
                            <dl class="form-group">
                                <label class="col-xs-3">Số điện thoại</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="phone" id="phone"/>
                                </div>
                            </dl>
                            <dl class="form-group">
                                <label class="col-xs-3">Email</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="email" id="email"/>
                                </div>
                            </dl>
                            <dl class="form-group">
                                <label class="col-xs-3">Tên công ty</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="companyName" id="companyName"/>
                                </div>
                            </dl>
                            <dl class="form-group">
                                <label class="col-xs-3">Nhu cầu</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="demand" id="demand"/>
                                </div>
                            </dl>
                            <dl class="form-group">
                                <label class="col-xs-3">Tình trạng</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="status" id="status"/>
                                </div>
                            </dl>

                            <dl class="form-group">
                                <label class="col-xs-3"></label>
                                <c:if test="${empty customerEdit.id}">
                                    <div class="col-xs-9">
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Thêm khách hàng</button>
                                        <button type="button" class="btn btn-primary" data-toggle="button" id="btnCancel">Huỷ thao tác</button>
                                    </div>
                                </c:if>
                                <c:if test="${not empty customerEdit.id}">
                                    <div class="col-xs-9">
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Cập nhật khách hàng</button>
                                        <button type="button" class="btn btn-primary" data-toggle="button" id="btnCancel">Huỷ thao tác</button>
                                    </div>
                                </c:if>
                            </dl>
                            <form:hidden path="id" id="customerId"/>
                        </form>
                    </div>
                </form:form>
            </div>

            <!-- bảng phần giao dịch với khách hàng -->
            <c:forEach var="item" items="${transactionType}">
                    <div class="col-xs-12">
                        <div class="col-sm-12">
                            <h3 class="header smaller lighter blue">${item.value}</h3>
                            <button class="btn btn-lg btn-primary" onclick="transactionType('${item.key}', ${customerEdit.id})">
                                <i class="orange ace-icon fa fa-location-arrow"></i>Add
                            </button>
                        </div>
                        <c:if test="${item.key == 'CSKH'}">
                            <div class="col-xs-12">
                                <table id="simple-table" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>Ngày tạo</th>
                                        <th>Người tạo</th>
                                        <th>Ngày sửa</th>
                                        <th>Người sửa</th>
                                        <th>Chi tiết giao dịch</th>
                                        <th>Thao tác</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="type" items="${typeCSKH}">
                                        <tr>
                                            <td>${type.createdDate}</td>
                                            <td>${type.createdBy}</td>
                                            <td>${type.modifiedDate}</td>
                                            <td>${type.modifiedBy}</td>
                                            <td>${type.note}</td>

                                            <td>
                                                <div class="hidden-sm hidden-xs btn-group">
                                                    <a class="btn btn-xs btn-info" title="sửa thông tin giao dịch"
                                                       onclick="showFormTransaction(${type.id}, '${item.key}')">
                                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </c:if>

                        <c:if test="${item.key == 'DDX'}">
                            <div class="col-xs-12">
                                <table id="simple-table" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>Ngày tạo</th>
                                        <th>Người tạo</th>
                                        <th>Ngày sửa</th>
                                        <th>Người sửa</th>
                                        <th>Chi tiết giao dịch</th>
                                        <th>Thao tác</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="type" items="${typeDDX}">
                                        <tr>
                                            <td>${type.createdDate}</td>
                                            <td>${type.createdBy}</td>
                                            <td>${type.modifiedDate}</td>
                                            <td>${type.modifiedBy}</td>
                                            <td>${type.note}</td>

                                            <td>
                                                <div class="hidden-sm hidden-xs btn-group">
                                                    <a class="btn btn-xs btn-info" title="sửa thông tin giao dịch"
                                                       onclick="showFormTransaction(${type.id}, '${item.key}')">
                                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:if>
                    </div><!-- /.span -->
            </c:forEach>

        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<div class="modal fade" id="transactionTypeModal" role="dialog"
     style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Nhập giao dịch</h4>
            </div>
            <div class="modal-body">
                <div class="form-group has-success" id="trans">
                    <label for="" class="col-xs-12 col-sm-3 control-label no-padding-right">Chi
                        tiết giao dich</label>
                    <div class="col-xs-12 col-sm-9" >
                            <span class="block input-icon input-icon-right">
                                <input  type="text" id="transactionDetails" class="width-100"/>
                            </span>
                    </div>
                </div>
                <input type="hidden" name="customerId" id="customerId" value="">
                <input type="hidden" name="code" id="code" value="">
                <input type="hidden" name="id" id="id" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="btnAddOrUpdateTransaction">
                    Cập nhật giao dịch
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>

<script>
    $('#btnAddOrUpdateCustomer').click(function (){
        var data = {};
        var formData = $('#listForm').serializeArray();
        $.each(formData, function (i, v){
            data["" + v.name + ""] = v.value;
        })
        if (data['name'] != '') {
            addOrUpdateCustomer(data);
            myConfirm();
        }
    });

    function addOrUpdateCustomer (data) {
        $.ajax({
            type: "POST",
            url: "${customerAPI}",
            data: JSON.stringify(data),
            contentType: "application/JSON",
            dataType: 'json',
            success: function (respond) {
                console.log("success");
            },
            error: function (respond) {
                console.log("failed");
                console.log(respond);
            }
        });
    }

    //nut huy thao tac
    $('#btnCancel').click(function (){
        window.location.href = "/admin/customer-list";
    })

    function transactionType (code, customerId) {
        $('#transactionTypeModal').modal();
        $('#customerId').val(customerId);
        $('#code').val(code);
    }

    function showFormTransaction(transactionId, code) {
        $('#transactionTypeModal').modal();
        $('#id').val(transactionId);
        $('#code').val(code);
        loadTransactionDetail(transactionId);
    }

    $('#btnAddOrUpdateTransaction').click(function (e){
        e.preventDefault();
        var data = {};
        data['id'] = $('#id').val();
        data['customerId'] = $('#customerId').val();
        data['code'] = $('#code').val();
        data['note'] = $('#transactionDetails').val();
        var id = $('#id').val();
        addTransaction(data);
    })

    function addTransaction(data) {
        $.ajax({
            type: "POST",
            url: "${customerAPI}" + "/transaction",
            data: JSON.stringify(data),
            contentType: "application/JSON",
            success: function (respond) {
                window.location.href = "<c:url value="/admin/customer-edit-${id}"/>";
            },
            error: function (respond) {
                console.log("failed");
                console.log(respond);
            }
        });
    }

    function loadTransactionDetail(transactionId) {
        $.ajax({
            url: "${customerAPI}/" + transactionId + "/transaction-detail",
            type: "GET",
            dataType: 'json',
            success: function (response) {
                var row = '';
                $.each(response.data, function (index, item) {
                    row += '<input type="text" id="transactionDetails" value="'+item+'" class="width-100"/>';
                });
                $('#trans .input-icon').html(row);
                console.info("success");
            },
            error: function (response) {
                console.log("failed");
                console.log(response);
            }
        });
    }

    function myConfirm() {
        confirm("success");
    }

</script>
</body>
</html>
