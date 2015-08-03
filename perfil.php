                        <li class="green user-profile">
                            <a data-toggle="dropdown" href="#" class="user-menu dropdown-toggle">
                                <img class="nav-user-photo" src="<?php echo BASE_URL ?>lib/themes/images/user.png" alt="Jason's Photo" />
                                <span id="user_info">
                                    <small>Bienvenido,</small>
                                    <?php echo session::get('perfil')?> <?php echo session::get('empleado')?>
                                    | <?php echo Main::get_servidor() ?>
                                </span>

                                <i class="icon-caret-down"></i>
                            </a>

                            <ul class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer" id="user_menu">
                                <li>
                                    <a href="<?php echo BASE_URL?>login/cerrar">
                                        <i class="icon-off"></i>
                                        Cerrar Sesión
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div><!--/.container-fluid-->
            </div><!--/.navbar-inner-->
        </div>
 
        <div class="container-fluid" id="main-container">
            <a id="menu-toggler" href="#">
                    <span></span>
            </a>
            <script>
                var url="<?php echo BASE_URL ?>";
            </script>