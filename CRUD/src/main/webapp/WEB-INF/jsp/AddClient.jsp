<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/App.css">
    <meta charset="UTF-8">
    <title>Add Client</title>
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
          border-color: var(--clr-primary-5); /* Измените цвет рамки на цвет вашего фона */
          margin-left: 0.5rem;
        }
        .btn-danger {
          border-color: var(--clr-primary-5); /* Измените цвет рамки на цвет вашего фона */
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
    <h1 class="p-3"> Добавьте клиента </h1>

    <form:form action="/saveClient" method="post" modelAttribute="client">
        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="fio">ФИО</label>
                <div class="col-md-6">
                    <form:input type="text" path="fio" id="fio" class="form-control input-sm" required="required"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="address">Адрес</label>
                <div class="col-md-6">
                    <form:input type="text" path="address" id="address" class="form-control input-sm"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="phone_number">Номер телефона</label>
                <div class="col-md-6">
                    <form:input type="text" path="phone_number" id="phone_number" class="form-control input-sm"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="passport">Паспорт/ОГРН</label>
                <div class="col-md-6">
                    <form:input type="text" path="passport" id="passport" class="form-control input-sm" required="required"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-12">
                <label class="col-md-3" for="client_type">Тип клиента</label>
                <div class="col-md-6">
                    <form:select path="client_type" class="form-control input-sm">
                        <option value="Юр.лицо">Юр.лицо</option>
                        <option value="Физ.лицо">Физ.лицо</option>
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
        if (msg == "Save Failure") {
            toastr["error"]("Something went wrong with the save.");
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
