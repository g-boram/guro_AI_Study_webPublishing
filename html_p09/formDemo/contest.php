<?php
    if	($_POST)	{
        $firstname	=	$_POST["firstname"];
        $lastname	=	$_POST["lastname"];
?>

<body>
    <div id="wrap">
            <p><img	src="images/welcome.png"	alt="환영이미지"></p>
            <div>
                    Welcome!	
                    <span>
                    <?php	echo($firstname);	print("	");	print($lastname);	?>
                    </span>,	님,	반갑습니다!	어서오세요!
            </div>
    </div>	<!--	div#wrap	-->
</body>	
<?php		}	?>.