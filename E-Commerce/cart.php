<?php
ob_start();
// include header.php file
include ('header.php');
?>

<?php

    /*  include cart items if it is not empty */
        count($product->getData('cart')) ? include ('Template/_cart-template.php') :  include ('Template/notFound/_cart_notFound.php');
    /*  include cart items if it is not empty */

    /*  include you might also like section */
        include ('Template/_new-phones.php');
    /*  include you might also like section */

?>

<?php
// include footer.php file
include ('footer.php');
?>


