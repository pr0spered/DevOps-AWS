<?php
    ob_start();
    // include header.php file
    include ('header.php');
?>

<?php

    /*  include banner area  */
        include ('Template/_banner-area.php');
    /*  include banner area  */

    /*  include bestsellers section */
        include ('Template/_bestseller.php');
    /*  include bestsellers section */

    /*  include products section  */
         include ('Template/_phones.php');
    /*  include products section  */

    /*  include banner ads  */
        include ('Template/_banner-ads.php');
    /*  include banner ads  */


?>


<?php
// include footer.php file
include ('footer.php');
?>