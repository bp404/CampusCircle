<?php
/* 此php文件用于与客户端登录交互
   Login.php
   Created by 邹伊凡 on 16/4/13.
   Copyright © 2016年 panTher.All rights reserved.
   */
  
 /*将字符串进行截取*/
$String = $_POST['String'];
/*学号*/
$stuID = substr($String,0,10);
/*密码 md5(md5(passWord)+timestamp)*/
$passWord = substr($String,10);
/*数据库连接*/
$con = mysql_connect("localhost","root","panther1233");
if (!$con) {
      echo "连接数据库失败";
  }
/*截取学号前四位*/
$stuID1 = substr($stuID,0,4);
/*选择数据库*/
mysql_select_db("Information",$con);
/*以学号前四位判断表项*/
$result = mysql_query("SELECT * FROM `$stuID1`");
	    $flag = 1;
/*验证学号与密码*/
while ($row = mysql_fetch_array($result)) {
	if ($stuID == $row['stuID']) {		
		$initiaPassWord = substr($row['ID'], -6);    
		$initiaPassWord = md5($initiaPassWord);       /*进行MD5加密*/
		$initiaPassWord = $initiaPassWord.time();     /*数据库中的身份证后6位加上时间戳*/
		$initiaPassWord = md5($initiaPassWord);       /*进行MD5加密*/
		$flag = 2;
		if ($passWord !== $initiaPassWord) {
			$row['passWord'] = $row['passWord'].time();  /*数据库中的password加上时间戳*/
			$row['passWord'] = md5($row['passWord']);    /*进行MD5加密*/
			$flag = 3;
			if ($passWord == $row['passWord']) {
				$flag = 4;
				break;
			}
		}
	}
}
mysql_close($con);
/*json传输*/
if ($flag < 1 || $flag > 4) {
	$json['a'] = '0';       //未知错误
	echo json_encode($json);
}
if ($flag == 1) {
	$json['a'] = '1';       //用户名错误
    echo json_encode($json);
}
if ($flag == 2) {
	$json['a'] = '2';       //密码错误(初始密码错误)
    echo json_encode($json);
}
if ($flag == 3) {
	$json['a'] = '3';       //密码错误()
	echo json_encode($json);
}
if ($flag == 4) {
	$json['a'] = '4';       //密码正确
	echo json_encode($json);
}
?>

