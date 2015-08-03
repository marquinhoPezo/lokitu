    </div>
    </div>
    </div>
    <div id="jsfoot">
        <?php if(isset($_params['js_foot']) && count($_params['js_foot'])): ?>
        <?php for($i=0; $i < count($_params['js_foot']); $i++): ?>
        
        <script src="<?php echo $_params['js_foot'][$i] ?>" type="text/javascript"></script>
        
        <?php endfor; ?>
        <?php endif; ?>
    </div>
    <a href="javascript:void(0)" id="btn-scroll-up" class="btn btn-small btn-inverse">
            <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
    <script src="<?php echo BASE_URL ?>lib/themes/js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="<?php echo BASE_URL ?>lib/themes/js/jquery.ui.touch-punch.min.js"></script>

    <script src="<?php echo BASE_URL ?>lib/themes/js/jquery.slimscroll.min.js"></script>
    <script src="<?php echo BASE_URL ?>lib/themes/js/jquery.easy-pie-chart.min.js"></script>
    <script src="<?php echo BASE_URL ?>lib/themes/js/jquery.sparkline.min.js"></script>

    <script src="<?php echo BASE_URL ?>lib/themes/js/jquery.flot.min.js"></script>
    <script src="<?php echo BASE_URL ?>lib/themes/js/jquery.flot.pie.min.js"></script>
    <script src="<?php echo BASE_URL ?>lib/themes/js/jquery.flot.resize.min.js"></script>

    <!--w8 scripts asdasdasdasdkaskadskdakdaskadsdkasdkasas-->

    <script src="<?php echo BASE_URL ?>lib/themes/js/w8-elements.min.js"></script>
    <script src="<?php echo BASE_URL ?>lib/themes/js/w8.min.js"></script>

    </body>
</html>
