***

##<center>接口规范4.0 </center>##

***

* ##### 登录接口（学生）
###### 文件名：login.php
###### 数据库：Information
	* 传入：
		* ***stuID（int）***
		* ***passWord（text）***
	* 传出：
		* ***result（int）***

~~~
result：
	unknow error	  	flag < 1 || flag > 3	json传出为 0
    username error		flag == 1			   json传出为 1
    password error		flag == 2			   json传出为 2
    success		   	flag == 3			   json传出为 3

ps:
	这里 PHP 通过 IF 判断，json传出的是数字，前端接收到数字需要进行处理。
~~~

<br>

* ##### 修改密码接口（学生）
###### 文件名：changePassword.php
###### 数据库：Information
	* 传入
		* ***oldPassWord（text）***
		* ***newPassWord（text）***
	* 传出
		* ***result（int）***

~~~
result:
	unknow error			flag < 1 || flag > 2	json传出为 0
    newPassWordOne error	flag = 1				json传出为 1
    success				 flag = 2				json传出为 2

~~~

<br>

* ##### 重置密码接口（学生）
###### 文件名：resetPassWord.php
###### 数据库：Information
	* 传入
		* ***stuID（int）（这里的 stuID ，即登陆后的信息，应由前端储蓄并传输到 PHP ）***
		* ***newPassWord（text）***
	* 传出
		* ***result（int）***

~~~
result:
	unknow error			flag < 1 || flag > 2	json传出为 0
    newPassWordOne error	flag = 1				json传出为 1
    success				 flag = 2				json传出为 2
~~~

<br>

* ##### 个人信息查看接口（学生）
###### 文件名：stuInformation.php
###### 数据库：Information
	* 传入
		* ***stuID（int）（只要是登录后的需要调用学号或工号的操作，均同上）***
	* 传出
		* ***name（varchar）（希望有一个昵称/真实姓名，可以在下一个接口修改并显示在最上面）***
		* ***stuID（int）***
		* ***ID（int）***
		* ***sex（int）***
		* ***institute（int）***
		* ***class（int）***
<br>

* ##### 个人信息修改接口（学生）
###### 文件名：stuInformationChange.php
###### 数据库：Information
	* 传入
		* ***stuID（int）***
		* ***newName（varchar）***
		* ***newSex（int）***
		* ***newInstitute（int）***
		* ***newClass（int）***
	* 传出
		* ***result（int）***

~~~
	unknow error			flag < 1 || flag > 5	json传出为 0
    newName error	   	flag = 1				json传出为 1
    newSex error			flag = 2				json传出为 2
    newInstitute error  	flag = 3				json传出为 3
    newClass error	  	flag = 4				json传出为 4
    success			 	flag = 5				json传出为 5
~~~

<br>

* ##### 登录接口（教师）
###### 文件名：teacherLogin.php
###### 数据库：Information——（表）teacher
	* 传入：
		* ***jobID（int）***
		* ***passWord（text）***
	* 传出：
		* ***result（int）***

~~~
result：
	unknow error	  	flag < 1 || flag > 3	json传出为 0
    username error		flag == 1			   json传出为 1
    password error		flag == 2			   json传出为 2
    success		   	flag == 3			   json传出为 3

ps:
	这里 PHP 通过 IF 输出的是字符串，前端接收到字符串可以直接进行处理,后续无特殊说明均由 PHP 完成。
~~~

<br>

* ##### 修改密码接口（教师）
###### 文件名：teacherChangePassword.php
###### 数据库：Information——（表）teacher
	* 传入
		* ***oldPassWord（text）***
		* ***newPassWordOne（text）***
	* 传出
		* ***result（int）***

~~~
result:
	unknow error		 flag < 1 || flag > 2	json传出为 0
    newPassWord error	flag = 1				json传出为 1
    success	 	 	flag = 2				json传出为 2

~~~

<br>

* ##### 重置密码接口（教师）
###### 文件名：teacherResetPassWord.php
###### 数据库：Information——（表）teacher
	* 传入
		* ***jobID（int）（这里的 jobID ，即登陆后的信息，应由前端储蓄并传输到 PHP ）***
		* ***newPassWord（text）***
	* 传出
		* ***result（int）***

~~~
result:
	unknow error	 	flag < 1 || flag > 2	json传出为 0
    newPassWord error	flag = 1				json传出为 1
    success 			 flag = 2				json传出为 2
~~~

<br>

* ##### 个人信息查看接口（教师）
###### 文件名：teacherInformation.php
###### 数据库：Information——teacher
	* 传入
		* ***jobID（int）（只要是登录后的需要调用学号或工号的操作，均同上）***
	* 传出
		* ***name（varchar）***
		* ***jobID（int）***
		* ***ID（int）***
		* ***sex（int）***
		* ***institute（int）***

<br>

* ##### 个人信息修改接口（教师）
###### 文件名：teacherInformationChange.php
###### 数据库：Information——teacher
	* 传入
		* ***jobID（int）***
		* ***newName（varchar）***
		* ***newSex（int）***
		* ***newInstitute（int）***
	* 传出
		* ***result（int）***

~~~
	unknow error			flag < 1 || flag > 4	json传出为 0
    newName error	   	flag = 1				json传出为 1
    newSex error			flag = 2				json传出为 2
    newInstitute error  	flag = 3				json传出为 3
    success			 	flag = 4				json传出为 4
~~~

<br>

* ##### 定点足迹接口（位置的接收）
###### 文件名：footIn.php
###### 数据库：Position
	* 传入
		* ***ID（int）（这里使用 ID 而不是 stuID 是为了更好的统一学生端和教师端）***
		* ***longitude（double）***
		* ***latitude（double）***
		* ***time（int）（在外部进行循环增长或直接定义01~51）***
	* 传出

<br>


* ##### 定点足迹接口（位置的显示）
###### 文件名：footOut.php
###### 数据库：Position
	* 传入
		* ***ID（int）***
	* 传出
		* ***longitude（double）***
		* ***latitude（double）***
		* ***time（int）***

	**ps：longitude和latitude在数据库中用varcher保存，PHP传出后，需要被强制转换成浮点数**
<br>

* ##### 即时足迹接口（位置的接收）
###### 文件名：instantFootIn.php
###### 数据库：Position——instant
	* 传入
		* ***ID（int）***
		* ***instantLongitude（double）***
		* ***instantLatitude（double）***
	* 传出

<br>

* ##### 即时足迹接口（位置的显示）
###### 文件名：instantFootOut.php
###### 数据库：Position——instant
	* 传入
		* ***ID（int）***
	* 传出
		* ***instantLongitude（double）***
		* ***instantLatitude（double）***

<br>

* ##### 课程表接口
###### 文件名：schedule.php
###### 数据库：Curriculum
	* 传入
		* ***gradeClass（int）（前两位表示年级，后两位表示班级）***
			* **例子：1502；15级2班**
	* 传出
		* ***courseID（int）***
		* ***week（int）***
		* ***time（int）（前两位表示星期，后两位表示节数）***
			* **例：0305；星期三第五节**
		* ***classroom（int）（前两位表示楼号，三四位表示楼区，后三位表示房号）***
			* **例：0101328；行知楼A区328室**
		* ***jobID（int）***

<br>

* ##### 课程表接口（教师）
###### 文件名：teacherSchedule.php
###### 数据库：Curriculum
	* 传入
		* ***jobID（int）***
	* 传出
		* ***courseID（int）***
		* ***week（int）***
		* ***classroom（int）***
		* ***time（int）***
		* ***gradeClass（int）***

<br>

* ##### 水资源接口&食堂接口
###### 文件名：water.php&canteen.php
###### 数据库：Position——instant
###### 数据库：
	* 传入
	* 传出
		* ***number（int）***

~~~
number:
    	if（ instantLongitude > ? && instantLongitude < ? && instantLatitude > ? && instantLatitude < ? ）
    		number + 1；
            
ps:
	划定所需要的范围，可以在即时位置信息传入时进行判定，得到浴池或食堂范围内存在人数。
~~~
<br>

* ##### 教室通接口
###### 文件名：classroom.php
###### 数据库：Curriculum
	* 传入
		* ***time(int)***
		* ***week(int)***
	* 传出
		* ***classroom(int)***
<br>
<br>

* ##### 签到接口（学生）
###### 文件名：signStudent.php
###### 数据库：Curriculum，Information，
	* 传入
		* ***courseID(int)***
		* ***time(int)***
		* ***week(int)***
	* 传出
		* ***gradeClass(int)（查找到的学生）***
			* ***再传出：	longitude（int）　　　latitude（int）　　（变量名字要改的）***
		* ***jobID(int)（传入下一个接口）***
			* ***再传出：	longitude（int）　　　latitude（int）　　（也是要改的）***
	* 再传入
		* ***sign（tinyint）***

~~~
sign条件：
	if（老师与学生距离 > 50 ）
    	sign不生效
    else
    	sign生效
sign还原：
	if（time、week、classroom有一个发生改变，sign = 0）
~~~
* ##### 签到接口（教师）
###### 文件名：signTeacher.php
###### 数据库：Curriculum，Information，State
	* 传入
		* ***jobID（从上面接口导入）***
		* ***sign（tinyint）（学生签到状态）***
		* ***sign（tinyint）（教师手动签到）***
	* 传出
		* ***stuID（int）（没签到的学生）***
		* ***name（varchar）（没签到的学生）***
		* ***state（int）（没签到的学生状态）***



~~~
会给教师展现所有的没有签到的学生的姓名、学号和状态。教师可以手动签到。
~~~

<br>