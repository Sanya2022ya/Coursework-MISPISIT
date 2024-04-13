<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/App.css">
    <meta charset="UTF-8">
    <title>Add Deposit Opened</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

</head>
<style>
    a{
        color: white;
    }
    a:hover {
        color: white;
        text-decoration: none;
    }
     .btn {
       background: var(--clr-primary-5);
       color: white;
     }
    .btn-success {
      border-color: var(--clr-primary-5);
      margin-left: 0.5rem;
    }
    .btn-danger {
      border-color: var(--clr-primary-5);
    }

.btn-end{
width:170px;
}

.form-inline .form-control {
    display: inline-block;
    width: 300px;
    vertical-align: middle;
}
    </style>
<body>
<div class="container">
    <h1 class="p-3"> Добавить вклад </h1>

    <form:form action="/saveDepositOpened" method="post" modelAttribute="depositOpened">
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="clientId">ФИО Клиента</label>
                <div class="col-md-6">
                    <form:input type="text" path="clientId" id="clientId" class="form-control input-sm" required="required"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="depositId">Название вклада</label>
                <div class="col-md-6">
                    <form:input type="text" path="depositId" id="depositId" class="form-control input-sm" required="required"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="openingDate">Дата открытия</label>
                <div class="col-md-6">
                    <form:input type="date" path="openingDateStr" id="openingDateStr" class="form-control input-sm" required="required"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="location">Местоположение</label>
                <div class="col-md-6">
                    <form:input type="text" path="location" id="location" class="form-control input-sm" required="required"/>
                </div>
            </div>
        </div>

        <div class="row p-2">
            <div class="col-md-2">
                <button type="submit" value="Register" class="btn btn-success">Сохранить</button>
            </div>
        </div>
    </form:form>

</div>

<script th:inline="javascript">
    window.onload = function() {
        var msg = "${message}";
        console.log(msg);
        if (msg == "Save Failure") {
            toastr["error"]("Что-то пошло не так при сохранении.");
        }

        toastr.options = {
            "closeButton": true,
            "debug": false,
            "newestOnTop": false,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
    }
</script>
</body>
</html>
