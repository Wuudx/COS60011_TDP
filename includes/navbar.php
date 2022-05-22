<?php $currentPage = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH); ?>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/">
    <img src="/assets/img/logo-icon.svg" width="30" height="30" class="d-inline-block align-top" alt="">
    Council Reporting
  </a>
  <div class="navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="<?php if ($currentPage === '/') {echo 'active';} ?> nav-link" href="/">Home</a>
      </li>
      <li class="nav-item">
        <a class="<?php if ($currentPage === '/issues') {echo 'active';} ?> nav-link" href="/issues">Issues</a>
      </li>
    </ul>
    <ul class="nav navbar-nav flex-row justify-content-md-center justify-content-start flex-nowrap">
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Profile
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/profile">My account</a>
          <a class="dropdown-item" href="/logout">Logout</a>
        </div>
      </li>
    </ul>
  </div>
</nav>