<#macro signUp>
    <div class="modal fade" id="signUpModal" tabindex="-1" aria-labelledby="signUpModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="signUpModalLabel">Реєстрація</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/signup" method="post">
                <div class="modal-body">
                    <div class="input-group mb-4 mt-2">
                        <span class="input-group-text">Повне ім'я</span>
                        <input type="text" name="firstName" placeholder="Ім'я" class="form-control">
                        <input type="text" name="lastName" placeholder="Прізвище" class="form-control">
                    </div>
                    <div class="input-group mb-4">
                        <span class="input-group-text" id="basic-addon3">Ваш E-Mail</span>
                        <input type="text" name="email" placeholder="E-Mail" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                    </div>
                    <div class="input-group mb-4">
                        <span class="input-group-text" id="basic-addon3">Дата народження</span>
                        <input type="date" name="dateOfBirth" placeholder="Дата народження" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                    </div>
                    <div class="input-group mb-4">
                        <span class="input-group-text" id="basic-addon3">Пароль</span>
                        <input type="password" name="password" placeholder="Пароль" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                    </div>
                    <p>Будь ласка, вводьте свої реальні дані, по можливості на англійській мові, щоб уникнути можливих проблем при посадці.</p>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Зареєструватись</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</#macro>

<#macro logIn>
    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLabel">Вхід в акаунт</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/login" method="post">
                    <div class="modal-body">
                        <div class="input-group mb-4">
                            <span class="input-group-text" id="basic-addon3">E-Mail</span>
                            <input type="text" name="email" placeholder="E-Mail" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                        </div>
                        <div class="input-group mb-4">
                            <span class="input-group-text" id="basic-addon3">Пароль</span>
                            <input type="password" name="password" placeholder="Пароль" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">Увійти</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</#macro>

<#macro logOut>
    <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="logoutModalLabel">Вихід з акаунту</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/logout" method="post">
                    <div class="modal-body">
                        <p>Ви дійсно хочете вийти з акаунти?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">Вийти</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</#macro>

<#macro error>
    <div class="modal fade" id="loginErrorModal" tabindex="-1" aria-labelledby="loginErrorModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginErrorModalLabel">Помилка входу в акаунт</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                    <div class="modal-body">
                        <p>Не вдалося зайти в акаунт.</p>
                        <p>Невірно введені дані.</p>
                    </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="signUpErrorModal" tabindex="-1" aria-labelledby="signUpErrorModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="signUpErrorModalLabel">Помилка реєстрації</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Не вдалося створити акаунт.</p>
                    <p>Такий користувач вже існує.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="signUpSuccessModal" tabindex="-1" aria-labelledby="signUpSuccessModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="signUpSuccessModalLabel">Реєстрація успішна!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Тепер ви можете зайти в свій акаунт натиснувши на кнопку "Увійти" на головній сторінці.</p>
                </div>
            </div>
        </div>
    </div>
</#macro>