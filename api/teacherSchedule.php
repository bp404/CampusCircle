<?php
/* 此php文件用于教师课程表
   changePassword.php
   Created by 邹伊凡 on 16/4/13.
   Copyright © 2016年 panTher.All rights reserved.
 */

/*教师工号*/
$jobID = $_POST['jobID'];

/*数据库连接*/
$con = mysql_connect("localhost","root","panther1233");
if (!$con) {
      echo "连接数据库失败";
  }

/*选择数据库及表*/
mysql_select_db("Curriculum",$con);
$result = mysql_query("SELECT * FROM `$institute`");
$flag = 0;
while ($row = mysql_fetch_array($result)) {
	if ($jobID == $row['jobID']) {
	    $courseID = $row['courseID'];
	    $week = $row['week'];
	    $time = $row['time'];
	    $classroom = $row['classroom'];
	    $gradeClass = $row['gradeClass'];
	    $flag = 1;		
	}
}
mysql_close($con);

/*json传输数组*/
if ($flag < 0 || $flag > 1) {
	$json['a'] = '-1';
	echo json_encode($json);      /*未知错误*/
}
if ($flag == 0) {
	$json['a'] = '0';             /*输入的教师工号不正确*/
    echo json_encode($json);
}
if ($flag == 1) {
	$array = array('courseID' => $courseID, 'week' => $week, 'time' => $time, 'classroom' => $classroom, 'gradeClass' => $gradeClass);
	echo json_encode($array);
}

?>
