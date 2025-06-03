<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Thêm tòa nhà</title>
</head>
<body>
<div class="main-content" id="main-container">
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
                        <a href="#">Home</a>
                    </li>

                    <c:if test="${not empty buildingEdit.id}">
                        <li class="active">Sửa tòa nhà</li>
                    </c:if>
                    <c:if test="${empty buildingEdit.id}">
                        <li class="active">Thêm tòa nhà</li>
                    </c:if>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        Thông tin tòa nhà
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12 ">

                    </div>
                </div>

                <!--  -->
                <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                    <form:form modelAttribute="buildingEdit" id="listForm" method="GET">
                        <div class="col-xs-12">
                            <form class="form-horizontal" role="form" enctype="multipart/form-data">
                                <dl class="form-group">
                                    <label class="col-xs-3">Tên tòa nhà</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="name"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Quận</label>
                                    <div class="col-xs-3">
                                        <form:select class="form-control" path="district">
                                            <form:option value="">---Chọn quận---</form:option>
                                            <form:options items="${districts}"/>
                                        </form:select>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Phường</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="ward" id="ward"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Đường</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="street" id="street"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Kết cấu</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="structure" id="structure"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Số tầng hầm</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="numberOfBasement" id="numberofbasment"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Diện tích sàn</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="floorArea" id="floorarea"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Hướng</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="direction" id="direction"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Hạng</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="level" id="level"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Diện tích thuê</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="rentArea" id="rentarea"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Gía thuê</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="rentPrice" id="rentPrice"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Mô tả giá</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="rentPriceDescription"
                                                    id="rentpricedescription"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Phí dịch vụ</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="serviceFee" id="servicefee"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Phí ô tô</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="carFee" id="carfee"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Phí mô tô</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="motoFee" id="motofee"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Phí ngoài giờ</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="overtimeFee" id="overtimefee"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Tiền điện</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="electricityFee" id="electricityfee"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Đặt cọc</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="deposit" id="deposit"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Thanh toán</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="payment" id="payment"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Thời hạn thuê</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="rentTime" id="renttime"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Thời gian trang trí</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="decorationTime" id="decorationtime"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Tên quản lý</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="managerName" id="managername"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">SĐT quản lý</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="managerPhone" id="managerphone"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Phí môi giới</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="brokerageFee" id="brokeragefee"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Loại tòa nhà</label>
                                    <div class="col-xs-9">
                                        <form:checkboxes items="${buildingTypeCode}" path="typeCode"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3">Ghi chú</label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="note" id="note"/>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3 no-padding-right">Ảnh tòa nhà</label>
                                    <input class="col-xs-3 no-padding-right" id="uploadImage" type="file"/>
                                    <div class="col-xs-9">
                                        <c:if test="${not empty buildingEdit.image}">
                                            <c:set var="imagePath" value="/repositpry${buildingEdit.image}"/>
                                            <img src="${imagePath}" id="viewImage" width="300px" height="300px">
                                        </c:if>
                                        <c:if test="${empty buildingEdit.image}">
                                            <c:set var="imagePath" value="/repositpry${buildingEdit.image}"/>
                                            <img src="" id="viewImage" width="300px" height="300px">
                                        </c:if>
                                    </div>
                                </dl>
                                <dl class="form-group">
                                    <label class="col-xs-3"></label>
                                    <div class="col-xs-9">
                                        <c:if test="${not empty buildingEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">
                                                Cập nhật tòa nhà
                                            </button>
                                            <button type="button" class="btn btn-primary" data-toggle="button"
                                                    id="btnCancel">Huỷ thao tác
                                            </button>
                                        </c:if>
                                        <c:if test="${empty buildingEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">
                                                Thêm tòa nhà
                                            </button>
                                            <button type="button" class="btn btn-primary" data-toggle="button"
                                                    id="btnCancel">Huỷ thao tác
                                            </button>
                                        </c:if>
                                    </div>
                                </dl>
                                <form:hidden path="id" id="buildingId"/>
                            </form>
                        </div>
                    </form:form>

                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-container -->

<script>
    $('#btnAddOrUpdateBuilding').click(function () {
        var data = {};
        var typeCode = [];
        var formData = $('#listForm').serializeArray();
        $.each(formData, function (i, v) {
            if (v.name != 'typeCode') {
                data["" + v.name + ""] = v.value;
            } else {
                typeCode.push(v.value);
            }
            if (imageBase64 !== '') {
                data['imageBase64'] = imageBase64;
                data['imageName'] = imageName;
            }
        })
        data['typeCode'] = typeCode;
        $('#loading_image').show();
        if (data['name'] != '') {
            addOrUpdateBuilding(data);
        } else {
            window.location.href = "<c:url value="/admin/building-edit?typeCode=required"/>";
        }
    });

    function addOrUpdateBuilding(data) {
        //call API
        $.ajax({
            type: "POST",
            url: "${buildingAPI}",
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

    $('#btnCancel').click(function () {//khi bấm nút "Hủy thao tác" sẽ quay trở về trang có link :/admin/building-list
        window.location.href = "/admin/building-list";
    })

    var imageBase64 = '';
    var imageName = '';

    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' + imageView).attr('src' + reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $('#uploadImage').change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function (e) {
            imageBase64 = e.target.result;
            imageName = file.name;
        }
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });

    function myConfirm() {
        confirm("success");
    }
</script>
</body>
</html>
