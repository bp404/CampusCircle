<?php
/* 此php文件用于个人信息修改
   stuInformation.php
   Created by 邹伊凡 on 16/4/10.
   Copyright © 2016年 panTher.All rights reserved.
*/
/*学号*/
$stuID = $_POST['stuID'];
/*姓名*/
$newName = $_POST['$newName'];
/*性别*/
$newSex = $_POST['newSex'];
/*学院*/
$newInstitute = $_POST['newInstitute'];
/*班级*/
$newClass = $_POST['newClass'];
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
	if ($stuID == $row['stuID']){
		$flag = 0
		if ($newName !== $row['name']) {
			mysql_query("UPDATE `$stuID1` SET name = '$newName'  /*将新名字替换到表中*/
				         WHERE stuID = '$stuID'");  
		}
		if ($newSex !== $row['sex']) {
			mysql_query("UPDATE `$stuID1` SET sex = '$newSex'  /*将新性别替换到表中*/
				         WHERE stuID = '$stuID'");
		}
		if ($newInstitute !== $row['institute']) {
			mysql_query("UPDATE `$stuID1` SET institute = '$newInstitute'  /*将新学院替换到表中*/
				         WHERE stuID = '$stuID'");  
		}
		if ($newClass !== $row['class']) {
			mysql_query("UPDATE `$stuID1` SET class = '$newClass'  /*将新班级替换到表中*/
				         WHERE stuID = '$stuID'");
		}
		$flag = '1';
	} 
}
mysql_close($con);
/*json传输*/
if ($flag != '1') {
	$json['a'] = '0';   /*未知错误*/
	echo json_encode($json);
}
if ($flag = '1') {
	$json['a'] = '1';   /*修改成功*/
	echo json_encode($json);
}

?>