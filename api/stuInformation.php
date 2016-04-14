<?php
/* 此php文件用于个人信息查看
   stuInformation.php
   Created by 邹伊凡 on 16/4/10.
   Copyright © 2016年 panTher.All rights reserved.
*/
/*学号*/
$stuID = $_POST['stuID'];
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
/*将个人信息赋值给变量名*/
while ($row = mysql_fetch_array($result)) {
	if ($stuID == $row['stuID']) {
		$name = $row['name'];
		$stuID = $row['stuID'];
		$ID = $row['ID'];
		$sex = $row['sex'];
		$institute = $row['institute'];
		$class = $row['class']；
	}
}
mysql_close($con);
/*json传输数组*/
$array = array('stuID' => $stuID, 'name' => $name, 'ID' => $ID, 'sex' => $sex, 'institute' => $institute, 'class' = >$class);
echo json_encode($array);

?>
