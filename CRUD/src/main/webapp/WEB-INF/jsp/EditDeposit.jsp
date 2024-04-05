<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Deposit</title>
    <link rel="stylesheet" href="/App.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <style>
        a {
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

        .btn-end {
            width: 170px;
        }

        .form-inline .form-control {
            display: inline-block;
            width: 300px;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="p-3"> Редактировать депозит </h1>

    <form:form action="/editSaveDeposit" method="post" modelAttribute="deposit">
        <div class="row">
            <div class="form-group col-md-12">
                <div class="col-md-6">
                    <form:hidden path="id" class="form-control input-sm"/>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="depositName">Название депозита</label>
                <div class="col-md-6">
                    <form:input type="text" path="depositName" id="depositName" class="form-control input-sm" required="required"/>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="duration">Срок депозита (в месяцах)</label>
                <div class="col-md-6">
                    <form:input type="number" path="duration" id="duration" class="form-control input-sm" required="required"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="amount">Сумма депозита</label>
                <div class="col-md-6">
                    <form:input type="number" path="amount" id="amount" class="form-control input-sm" required="required"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="interestCalculationType">Тип расчета процентов</label>
                <div class="col-md-6">
                  <form:select path="interestCalculationType" class="form-control input-sm">
                                         <option value="Аннуитетный" <c:if test="${deposit.interestCalculationType == 'Аннуитетный'}">selected</c:if>>Аннуитетный</option>
                                         <option value="Дифференцированный" <c:if test="${deposit.interestCalculationType == 'Дифференцированный'}">selected</c:if>>Дифференцированный</option>
                                     </form:select>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="interestRate">Процентная ставка</label>
                <div class="col-md-6">
                    <form:input type="number" path="interestRate" id="interestRate" class="form-control input-sm" required="required"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="currency">Валюта</label>
                <div class="col-md-6">
                    <form:select path="currency" class="form-control input-sm">
                    <option value="Рубль" <c:if test="${deposit.currency == 'Рубль'}">selected</c:if>>Рубль</option>
                    <option value="Доллар" <c:if test="${deposit.currency == 'Доллар'}">selected</c:if>>Доллар</option>
                    <option value="Юань" <c:if test="${deposit.currency == 'Юань'}">selected</c:if>>Юань</option>
                    </form:select>
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
        if (msg == "Edit Failure") {
            Command: toastr["error"]("Something went wrong with the edit.")
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
