<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <link rel="stylesheet" href="/App.css">
    <title>Main CRUD</title>

</head>
<style>
 body {
   background: var(--clr-grey-10); /* Добавляем стиль var(--clr-grey-10) к фону body */
   /* Другие свойства body */
 }
 .section {
     padding: 2rem 0;
 }
 .btn {
   text-align: center; /* Выравниваем текст по центру */
   display: block; /* Делаем кнопку блочным элементом, чтобы она занимала всю доступную ширину */
   margin: 0 auto; /* Центрируем блочный элемент по горизонтали */
   /* Остальные стили кнопки */
   margin-bottom: 1.5rem;
   width:250px;
 }
.btn-end{
margin-top: 2.75rem;
}
</style>

<body>
     <section class="section services" id="services">
            <div class="section-title">
                <h2><span>Разделы</span></h2>
            </div>
            <div class="section-center services-center">
<a href="/viewClientList" class="btn" >Клиенты</a>
            </div>
<div class="section-center services-center">
<a href="/viewClientList" class="btn" >Факты обращения</a>
            </div>
<div class="section-center services-center">
<a href="/viewClientList" class="btn" >Оформленные вклады</a>
            </div>
<div class="section-center services-center">
<a href="/viewClientList" class="btn" >Вклады</a>
            </div>
<div class="section-center services-center">
<a href="/viewClientList" class="btn" >Сотрудник</a>
            </div>
<div class="section-center services-center">
<a href="/viewClientList" class="btn" >Должность</a>
            </div>
<div class="section-center services-center">
<a href="/viewClientList" class="btn" >Задействованные документы</a>
            </div>
<div class="section-center services-center">
<a href="/viewClientList" class="btn" >Регламентирующие документы</a>
            </div>
<div class="section-center services-center btn-end">
<a href="/main" class="btn" >На главную</a>
            </div>
        </section>
</body>
</html>
