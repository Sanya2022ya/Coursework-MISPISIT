<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Волга банк</title>
    <link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="./css/styles.css" />
    <link rel="stylesheet" href="/App.css">
</head>
<body>
    <header id="home">
        <nav class="navbar">
            <div class="nav-center">
                <div class="nav-header">
                    <img src="<%= request.getContextPath() %>/images/волга 4.jpg" class="nav-logo"/>
                    <button type="button" class="nav-toggle" id="nav-toggle" onclick="menuClick()">

                    </button>
                </div>
                <ul class="nav-links" id="nav-links">
                    <li><a href="#home" class="nav-link scroll-link">Главная</a></li>
                    <li><a href="#about" class="nav-link scroll-link">О нас</a></li>
                    <li><a href="#services" class="nav-link scroll-link">Преимущества</a></li>
                    <li><a href="#featured" class="nav-link scroll-link">Услуги</a></li>
                </ul>
                <ul class="nav-icons">
                    <li><a href="https://www.twitter.com" target="_blank" class="nav-icon"><i class="fab fa-facebook"></i></a></li>
                    <li><a href="https://www.twitter.com" target="_blank" class="nav-icon"><i class="fab fa-twitter"></i></a></li>
                    <li><a href="https://www.twitter.com" target="_blank" class="nav-icon"><i class="fab fa-squarespace"></i></a></li>
                </ul>
            </div>
        </nav>

        <div class="hero">
            <div class="hero-banner">
                <h1>С возвращением</h1>
                <p>
                   Пока вы отсутствовали, появились новые запросы на обновление данных в системе.
                    Пожалуйста, обработайте их в соответствии с поступившими указаниями.
                </p>
             <a href="/layout" class="btn hero-btn scroll-link">Приступить к работе</a>
            </div>
        </div>
    </header>

    <section class="section" id="about">
        <div class="section-title">
            <h2>Наши <span>мероприятия</span></h2>
        </div>
        <div class="section-center about-center">
            <article class="about-video">
                <img src="<%= request.getContextPath() %>/images/756627408511592.jpg" />
            </article>
            <article class="about-info">
                <h3>Технологический Карнавал: "Вдохновение для Инноваций"</h3>
                <p>
                    Присоединяйтесь к нам на грандиозном технологическом карнавале, который будет проходить в течение всей следующей недели в нашей айти компании! Это событие представляет собой праздник для всех участников нашей команды, посвященный творчеству, инновациям и развитию.

                    На протяжении всего дня вы сможете насладиться интересными презентациями от наших ведущих разработчиков и исследователей, узнать о последних технологических трендах и решениях, а также принять участие в захватывающих мастер-классах и дискуссионных панелях.

                    Мы также предлагаем вам уникальную возможность продемонстрировать свои собственные проекты и идеи на нашей выставке инноваций. Это отличная возможность поделиться своим опытом, найти новых единомышленников и вдохновиться работой коллег.

                    Присоединяйтесь к нам на этом захватывающем мероприятии, которое обещает стать источником вдохновения и энергии для всех участников нашей айти компании!
                </p>
                <a href="#" class="btn"> Больше об этом</a>
            </article>
        </div>
    </section>

    <section class="section services" id="services">
        <div class="section-title">
            <h2>Программа <span>лояльности</span></h2>
        </div>
        <div class="section-center services-center">
            <article class="service">
                <span class="service-icon">
                    <i class="fas fa-chart-line"></i>

                </span>
                <div class="service-info">
                    <h4 class="service-title">Подъем инноваций</h4>
                    <p class="service-text">
                        Сотрудники, внесшие значительный вклад в инновационные идеи или развитие технологических решений компании, получают бонусные баллы, которые можно обменять на ценные призы или вознаграждения.
                    </p>
                </div>

            </article>
            <article class="service">
                            <span class="service-icon">
                       <i class="fas fa-arrow-up"></i>
                    </span>
                            <div class="service-info">
                                <h4 class="service-title">Профессиональный Рост</h4>
                                <p class="service-text">
                                   Программа поощрения за профессиональное обучение и развитие. Сотрудники, успешно завершившие обучающие курсы, программы сертификации или университетские курсы, получают бонусные баллы и дополнительные привилегии.
                                </p>
                            </div>

            </article>
            <article class="service">
                                        <span class="service-icon">
                                            <i class="fas fa-handshake"></i>

                                        </span>
                                        <div class="service-info">
                                            <h4 class="service-title">Коллективное Сотрудничество</h4>
                                            <p class="service-text">
                                             Программа поощрения за совместную работу и достижения в команде. Команды сотрудников, добившиеся выдающихся результатов в выполнении проектов или решении сложных задач, получают бонусные баллы и возможность выбрать награду для всей команды.
                                            </p>
                                        </div>

                        </article>
            <article class="service">
                                                    <span class="service-icon">
                                                        <i class="fas fa-smile"></i>

                                                    </span>
                                                    <div class="service-info">
                                                        <h4 class="service-title">Влияние на Клиента</h4>
                                                        <p class="service-text">
                                                        Программа поощрения за вклад в удовлетворение клиентов и достижение бизнес-целей. Сотрудники, получившие положительные отзывы от клиентов или сделавшие значительный вклад в развитие продуктов и услуг компании, получают привилегии и бонусные вознаграждения.
                                                        </p>
                                                    </div>

                                    </article>
        </div>

    </section>
<section class="section" id="featured">
    <div class="section-title">
        <h2>Наши <span>Партнеры</span></h2>
    </div>
    <div class="section-center featured-center">
        <article class="tour-card">
            <div class="tour-img-container">
                <img src="<%= request.getContextPath() %>/images/Без имени-5.png" />
                <p class="tour-date">Игровой центр</p>
            </div>
            <div class="tour-info">
                <div class="tour-title">
                    <h4>GameZone</h4>
                </div>
                <p>
                    Современный игровой центр с широким ассортиментом развлечений для всех возрастов. У нас вы найдете самые последние игры и аттракционы виртуальной реальности.
                </p>
                <div class="tour-footer">
                    <p>
                        <span>
                             <i class="fas fa-map-marker-alt"></i>
                            Санкт-Петербург
                        </span>
                    </p>
                    <p>
                        <i class="fas fa-coins"></i> 1000 рублей
                    </p>
                    <p>
                        <i class="far fa-clock"></i> 2 часа
                    </p>
                </div>
            </div>
        </article>
       <article class="tour-card">
                <div class="tour-img-container">
                <img src="<%= request.getContextPath() %>/images/Без имени-6.png" />
                  <p class="tour-date">Галерея</p>
                </div>

                <div class="tour-info">
                  <h4>ArtGallery</h4>
                  <p>
Галерея с уникальным объединением творчества местных и мировых художников. Насыщенное вдохновение и красота, оставляющие незабываемые и восхитительные впечатления.
                  </p>
                  <div class="tour-footer">
                                      <p>
                                          <span>
                                               <i class="fas fa-map-marker-alt"></i>
                                             Рязань
                                          </span>
                                      </p>
                                      <p>
                                          <i class="fas fa-coins"></i> 1500 рублей
                                      </p>
                                      <p>
                                          <i class="far fa-clock"></i> 3 часа
                                      </p>
                                  </div>
                              </div>
              </article>

    </div>
</section>
<section class="section contact" id="contact">
    <div class="section-center contact-center">
        <article class="contact-title">
            <h3 class="uno">Будьте в курсе всех событий компании, подпишитесь на рассылку новостей.</h3>
            <p class="uno">Подписавшись на рассылку, вы будете получать информацию о событиях компании первыми</p>
        </article>
        <form class="contact-form" >
            <input type="email" name="email" class="form-control" placeholder="Ваша почта" />
            <button type="submit" class="btn-submit">Подтвердить</button>
        </form>
    </div>
</section>

    <footer class="section footer">
        <ul class="footer-links">
            <li><a href="#home" class="footer-link scroll-link">Главная</a></li>
            <li><a href="#about" class="footer-link scroll-link">Наши мероприятия</a></li>
            <li><a href="#services" class="footer-link scroll-link">Программа лояльности</a></li>
            <li><a href="#featured" class="footer-link scroll-link">Наши партнеры</a></li>
        </ul>
        <ul class="footer-icons">
            <li><a href="https://www.youtube.com" target="_blank" class="footer-icon"><i class="fab fa-youtube"></i></a></li>
            <li><a href="https://www.vk.com" target="_blank" class="footer-icon"><i class="fab fa-vk"></i></a></li>
            <li><a href="https://web.telegram.org/k/" target="_blank" class="footer-icon"><i class="fab fa-telegram"></i></a></li>
        </ul>
        <p class="copyright">
            &copy; Волга банк<span id="date"></span>. Все права защищены
        </p>
    </footer>
</body>
</html>
