<nav class="navbar navbar-expand-lg navbar-light my-bg fixed-top ms-auto">
    <div class="container-fluid">
        <a class="navbar-brand my-text-light" href="/">
            <img src="/resources/img/plane256x256.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
            Fraternal Air
        </a>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <#if !Session.auser??>
                    <li class="nav-item">
                        <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#signUpModal">Зареєструватись</button>
                    </li>
                    <li class="nav-item ms-2">
                        <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#loginModal">Увійти</button>
                    </li>
                <#else>
                    <li class="nav-item ms-2">
                        <a class="btn btn-primary btn-sm" href="/profile">Профіль</a>
                    </li>
                    <li class="nav-item ms-2">
                        <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#logoutModal">Вихід</button>
                    </li>
                </#if>
            </ul>
        </div>
    </div>
</nav>