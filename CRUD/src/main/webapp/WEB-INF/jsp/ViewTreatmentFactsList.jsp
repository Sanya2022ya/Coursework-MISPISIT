<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/App.css">
    <title>View Treatment Facts List</title>
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
        .btn-success {
            border-color: var(--clr-primary-5);
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
        @media (min-width: 576px) {
            .ml-sm-3, .mx-sm-3 {
                margin-left: 0 !important;
            }
    </style>
</head>
<body>
<div class="container">
    <h1 class="p-3">Факты обращения</h1>
<form action="/gettreatmentFactsByEmployeeId" method="GET" class="form-inline">
        <div class="form-group mx-sm-3 mb-2">
            <label for="passport" class="sr-only">Номер сотрудника</label>
            <input type="text" class="form-control" id="employeeId" name="employeeId" placeholder="Введите ФИО сотрудника">
        </div>
        <button type="submit" class="btn mb-2">Получить факты обращения</button>
    </form>
    <table class="table table-bordered">
        <tr>
            <th>Id</th>
            <th>ФИО клиента</th>
            <th>Наименование вклада</th>
            <th>ФИО сотрудника</th>
            <th>Редактировать</th>
            <th>Удалить</th>
        </tr>
        <c:forEach var="treatmentFact" items="${treatmentFacts}">
            <tr>
                <td>${treatmentFact.id}</td>
                <td>${treatmentFact.clientId}</td>
                <td>${treatmentFact.serviceName}</td>
                <td>${treatmentFact.employeeId}</td>
                <td>
                                    <button type="button" class="btn btn-success">
                                        <a href="/editTreatmentFact/${treatmentFact.id}">Редактировать</a>
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-danger">
                                        <a href="/deleteTreatmentFact/${treatmentFact.id}">Удалить</a>
                                    </button>
                                </td>
            </tr>
        </c:forEach>
    </table>
 <a href="/AddTreatmentFact" class="btn btn-block">Добавить новый факт обращения</a>
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
        }
    };
</script>
</body>
</html>
