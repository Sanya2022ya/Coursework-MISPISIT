<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/App.css">
    <title>View Deposit List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
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
            .btn-add {

                           width:1205px;
                         }
            .btn-success {
              border-color: var(--clr-primary-5); /* Change border color to your background color */
            }
            .btn-danger {
              border-color: var(--clr-primary-5); /* Change border color to your background color */
            }

    .btn-end{
    width:170px;
    }

    .form-inline .form-control {
        display: inline-block;
        width: 300px;
        vertical-align: middle;

    }
    @media (min-width: 576px) {
        .ml-sm-3, .mx-sm-3 {
            margin-left: 0 !important; /* Set margin to 0 */
        }
        /*.container {
                display: flex;
                flex-direction: column;
                align-items: center; /* Центрирование элементов по горизонтали */
            }*/
        </style>
</head>
<body>
<div class="container">
    <h1 class="p-3">Вклады</h1>
    <form action="/getDepositsByDepositName" method="GET" class="form-inline">
        <div class="form-group mx-sm-3 mb-2">
            <label for="depositName" class="sr-only">Имя вклада</label>
            <input type="text" class="form-control" id="depositName" name="depositName" placeholder="Введите название вклада">
        </div>
        <button type="submit" class="btn mb-2">Получить вклады</button>
    </form>

    <table class="table table-bordered">
        <tr>
            <th>Id</th>
            <th>Название вклада</th>
            <th>Продолжительность</th>
            <th>Сумма</th>
            <th>Тип расчета процентов</th>
            <th>Процентная ставка</th>
            <th>Валюта</th>
            <th>Редактировать</th>
            <th>Удалить</th>
        </tr>
        <c:forEach var="deposit" items="${deposits}">
            <tr>
                <td>${deposit.id}</td>
                <td>${deposit.depositName}</td>
                <td>${deposit.duration}</td>
                <td>${deposit.amount}</td>
                <td>${deposit.interestCalculationType}</td>
                <td>${deposit.interestRate}</td>
                <td>${deposit.currency}</td>
                <td>
                    <button type="button" class="btn btn-success">
                        <a href="/editDeposit/${deposit.id}">Редактировать</a>
                    </button>
                </td>
                <td>
                    <button type="button" class="btn btn-danger">
                        <a href="/deleteDeposit/${deposit.id}">Удалить</a>
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>

    <a href="/AddDeposit" class="btn btn-block btn-add">Добавить новый вклад</a>

    <div style="display: flex; justify-content: center;margin-top: 20px;">
        <ul style="list-style: none;">
            <li><a href="/layout" class="btn btn-end btn-block">Назад</a></li>
        </ul>
    </div>
    <div style="display: flex; justify-content: center;">
        <ul style="list-style: none;">
            <li><a href="/main" class="btn btn-end btn-block">На главную</a></li>
        </ul>
    </div>
</div>

<script th:inline="javascript">
    window.onload = function() {
        var msg = "${message}";
        console.log(msg);
        if (msg === "Get Success") {
            toastr["success"]("Данные успешно получены", "", { "progressBarColor": "#007bff" });
        } else if (msg === "Get Failure") {
            toastr["error"]("Ошибка при получении данных", "", { "progressBarColor": "#dc3545" });
        } else if (msg === "Save Success") {
            toastr["success"]("Депозит успешно добавлен", "", { "progressBarColor": "#007bff" });
        } else if (msg === "Delete Success") {
            toastr["success"]("Депозит успешно удален", "", { "progressBarColor": "#007bff" });
        } else if (msg === "Delete Failure") {
            toastr["error"]("Произошла ошибка, депозит не был удален", "", { "progressBarColor": "#dc3545" });
        } else if (msg === "Edit Success") {
            toastr["success"]("Данные депозита успешно изменены", "", { "progressBarColor": "#007bff" });
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
        };
    };
</script>
</body>
</html>
