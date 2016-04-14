<?php
/* 此php文件用于密码修改
   changePassword.php
   Created by 邹伊凡 on 16/4/09.
   Copyright © 2016年 panTher.All rights reserved.
 */
/*学号*/
$stuID = $_POST['stuID'];
/*旧密码*/
$oldPassWord = $_POST['oldPassWord'];
/*新密码*/
$newPassWord = $_POST['newPassWord'];

/*数据库连接*/
$con = mysql_connect("localhost","root","panther1233");
if (!$con) {
      echo "连接数据库失败";
  }
/*截取学号前四位*/
$stuID1 = substr($stuID,0,4);
/*选择数据库及表*/
mysql_select_db("Information",$con);
$result = mysql_query("SELECT * FROM `$stuID1`");

while ($row = mysql_fetch_array($result)) {
	if ($stuID == $row['stuID']) {
		$row['passWord'] = $row['passWord'].time();   /*数据库中的password加上时间戳*/
		$row['passWord'] = md5($row['passWord']);      /*进行MD5加密*/
		$flag = 1;
		if ($oldPassWord == $row['passWord']) {
			mysql_query("UPDATE `$stuID1` SET passWord = '$newPassWord'  /*将新密码替换到表中*/
				         WHERE stuID = '$stuID'");     
		    $flag = 2;
		}
	}
}
mysql_close($con);

/*json传输*/
if ($flag < 1 || $flag > 2) {
	$json['a'] = '0';             //未知错误
	echo json_encode($json);
}
if ($flag == 1) {
	$json['a'] = '1';             //新密码与旧密码相同
    echo json_encode($json);
}
if ($flag == 2) {
	$json['a'] = '2';             //修改成功
    echo json_encode($json);
}

?>
