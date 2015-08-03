<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
    	<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Agricola De La Selva</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" >
        <meta name="viewport" content="width=device-width">
        
        <link rel="shortcut icon" href="<?php echo BASE_URL?>lib/img/favicon.ico" type="image/x-icon" />
        
        <link href="<?php echo $_params['ruta_css']; ?>bootstrap.css" rel="stylesheet" />
        <link href="<?php echo $_params['ruta_css']; ?>bootstrap-responsive.css" rel="stylesheet" />
        <link href="<?php echo BASE_URL ?>lib/themes/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        
        <!--[if IE 7]>
            <link rel="stylesheet" href="<?php echo BASE_URL ?>lib/themes/font-awesome/css/font-awesome-ie7.min.css" />
          <![endif]-->

          <!--page specific plugin styles-->

          <link rel="stylesheet" href="<?php echo BASE_URL ?>lib/themes/css/prettify.css" />

          <!--fonts-->
          
        <!--fonts-->

          <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

          <!--ace styles-->

          <link rel="stylesheet" href="<?php echo BASE_URL ?>lib/themes/css/w8.css" />
          <link rel="stylesheet" href="<?php echo BASE_URL ?>lib/themes/css/w8-responsive.min.css" />
          <link rel="stylesheet" href="<?php echo BASE_URL ?>lib/themes/css/w8-skins.min.css" />

          <!--[if lte IE 8]>
            <link rel="stylesheet" href="<?php echo BASE_URL ?>lib/themes/css/ace-ie.min.css" />
          <![endif]-->

        
        <script src="<?php echo $_params['ruta_js']; ?>jquery.js"></script>
        <script src="<?php echo $_params['ruta_js']; ?>validaciones.js"></script>
        <script src="<?php echo $_params['ruta_js']; ?>jquery.min.js"></script>
        <script src="<?php echo $_params['ruta_js']; ?>modernizr-2.6.2.min.js"></script>
        <script type="text/javascript" src="<?php echo $_params['ruta_js']; ?>bootstrap.min.js"></script>
        <?php if(isset($_params['js']) && count($_params['js'])): ?>
        <?php for($i=0; $i < count($_params['js']); $i++): ?>
        
        <script src="<?php echo $_params['js'][$i] ?>" type="text/javascript"></script>
        
        <?php endfor; ?>
        <?php endif; ?>
        
        <?php if(isset($_params['css']) && count($_params['css'])): ?>
        <?php for($i=0; $i < count($_params['css']); $i++): ?>
        
        <link href="<?php echo $_params['css'][$i] ?>" type="text/css" rel="stylesheet" media="screen" />
        
        <?php endfor; ?>
        <?php endif; ?>
    </head>
    <body class="navbar-fixed">
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a href="<?php echo BASE_URL ?>index" class="brand">
                        <small>
                            <i class="icon-leaf"></i>
                                AGRICOLA DE LA SELVA
                        </small>
                    </a><!--/.brand-->
                    <ul class="nav ace-nav pull-right">
                        
