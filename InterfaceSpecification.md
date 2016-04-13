***
###<center>接口规范6.1 </center>###
***

~~~
编译者：董弘琛
联系方式：QQ：212066122
		 手机：18846165172
文本最近更改日期：2016.04.13　13:24：19

~~~

~~~
关于下面密码的一些问题：
	密码正常传入为 md5（md5（用户输入）.time（））
	当更改密码时，传入的密码为 md5（用户输入）
    切记切记！
~~~

* ##### 登录接口（学生）
###### 文件名：login.php
###### 数据库：Information
	* 传入：
		* ***stuID（bigint）***
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
    oldPassWordOne error	flag = 1				json传出为 1
    success				 flag = 2				json传出为 2
~~~

* ##### 重置密码接口（学生）
###### 文件名：resetPassWord.php
###### 数据库：Information
	* 传入
		* ***stuID（bigint）（这里的 stuID ，即登陆后的信息，应由前端储蓄并传输到 PHP ）***
		* ***newPassWord（text）***
	* 传出
		* ***result（int）***
~~~
result:
	unknow error			flag < 1 || flag > 2	json传出为 0
    hadChanged			  flag = 1				json传出为 1
    samePassWord 	 	  flag = 2				json传出为 2
    success				 flag = 3				json传出为 3
~~~

* ##### 个人信息查看接口（学生）
###### 文件名：stuInformation.php
###### 数据库：Information
	* 传入
		* ***stuID（bigint）（只要是登录后的需要调用学号或工号的操作，均同上）***
	* 传出
		* ***name（char）***
		* ***stuID（bigint）***
		* ***ID（bigint）***
		* ***sex（int）***
		* ***institute（char）***
		* ***class（char）***


* ##### 个人信息修改接口（学生）
###### 文件名：stuInformationChange.php
###### 数据库：Information
	* 传入
		* ***stuID（bigint）***
		* ***newName（char）***
		* ***newSex（int）***
		* ***newInstitute（char）***
		* ***newClass（char）***
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

* ##### 登录接口（教师）
###### 文件名：teacherLogin.php
###### 数据库：Information——（表）teacher
	* 传入：
		* ***jobID（bigint）***
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
	这里 PHP 通过 IF 输出的是flag，前端接收到可以直接进行处理
~~~

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
    oldPassWord error	flag = 1				json传出为 1
    samePassWord		 flag = 2				json传出为 2
    success	 	 	flag = 3				json传出为 3

~~~

* ##### 重置密码接口（教师）
###### 文件名：teacherResetPassWord.php
###### 数据库：Information——（表）teacher
	* 传入
		* ***jobID（bigint）（这里的 jobID ，即登陆后的信息，应由前端储蓄并传输到 PHP ）***
		* ***newPassWord（text）***
	* 传出
		* ***result（int）***

~~~
result:
	unknow error	 	flag < 1 || flag > 2	json传出为 0
    hadChanged			flag = 1				json传出为 1
    newPassWord error	flag = 2				json传出为 2
    success 			 flag = 3				json传出为 3
~~~

* ##### 个人信息查看接口（教师）
###### 文件名：teacherInformation.php
###### 数据库：Information——teacher
	* 传入
		* ***jobID（bigint）（只要是登录后的需要调用学号或工号的操作，均同上）***
	* 传出
		* ***name（char）***
		* ***jobID（bigint）***
		* ***ID（bigint）***
		* ***sex（int）***
		* ***institute（char）***


* ##### 个人信息修改接口（教师）
###### 文件名：teacherInformationChange.php
###### 数据库：Information——teacher
	* 传入
		* ***jobID（bigint）***
		* ***newName（char）***
		* ***newSex（int）***
		* ***newInstitute（char）***
	* 传出
		* ***result（int）***

~~~
	unknow error			flag < 1 || flag > 4	json传出为 0
    newName error	   	flag = 1				json传出为 1
    newSex error			flag = 2				json传出为 2
    newInstitute error  	flag = 3				json传出为 3
    success			 	flag = 4				json传出为 4
~~~

* ##### 定点足迹创表接口（这个接口要运行两遍！两遍！！两遍！！！）
###### 文件名：positionTable.php
###### 数据库：Position
	* 传入
	* 传出
		* ***新建一个表 d$time ***
		* ***创建一个主键 ID***


* ##### 定点足迹接口（学生位置的接收）
###### 文件名：stuFootIn.php
###### 数据库：Position
	* 传入
		* ***ID（bigint）（这里使用 ID 而不是 stuID 是为了更好的统一学生端和教师端）***
		* ***longitude（double）***
		* ***latitude（double）***
		* ***time（char）（在外部进行循环增长或直接定义01~51）***
	* 传出

* ##### 定点足迹接口（教师位置的接收）
###### 文件名：teacherFootIn.php
###### 数据库：Position
	* 传入
		* ***ID（bigint）（这里使用 ID 而不是 stuID 是为了更好的统一学生端和教师端）***
		* ***longitude（double）***
		* ***latitude（double）***
		* ***time（char）（在外部进行循环增长或直接定义01~51）***
	* 传出

* ##### 定点足迹接口（位置的显示）
###### 文件名：footOut.php
###### 数据库：Position
	* 传入
		* ***ID（int）***
	* 传出
		* ***longitude（char）***
		* ***latitude（char）***
		* ***time（char）***

	**ps：longitude和latitude在数据库中用varcher保存，PHP传出后，需要被强制转换成浮点数**


* ##### 即时足迹接口（位置的接收）
###### 文件名：instantFootIn.php
###### 数据库：Position——instant
	* 传入
		* ***ID（int）***
		* ***instantLongitude（char）***
		* ***instantLatitude（char）***
	* 传出


* ##### 即时足迹接口（位置的显示）
###### 文件名：instantFootOut.php
###### 数据库：Position——instant
	* 传入
		* ***ID（int）***
	* 传出
		* ***instantLongitude（char）***
		* ***instantLatitude（char）***


* ##### 课程表接口
###### 文件名：schedule.php
###### 数据库：Curriculum
	* 传入
		* ***institute（char）***
		* ***gradeClass（char）（前两位表示年级，后两位表示班级）***
			* **例子：1502；15级2班**
	* 传出
		* ***courseID（bigint）***
		* ***week（char）***
		* ***time（char）（前两位表示星期，后两位表示节数）***
			* **例：0305；星期三第五节**
		* ***classroom（char）（前两位表示楼号，三四位表示楼区，后三位表示房号）***
			* **例：0101328；行知楼A区328室**
		* ***jobID（bigint）***


* ##### 课程表接口（教师）
###### 文件名：teacherSchedule.php
###### 数据库：Curriculum
	* 传入
		* ***jobID（bigint）***
	* 传出
		* ***courseID（bigint）***
		* ***week（char）***
		* ***classroom（char）***
		* ***time（char）***
		* ***gradeClass（char）***


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

* ##### 教室通接口
###### 文件名：classroom.php
###### 数据库：Curriculum
	* 传入
		* ***time(char)***
		* ***week(char)***
	* 传出
		* ***classroom(char)***


* ##### 签到接口（学生）
###### 文件名：signStudent.php
###### 数据库：Curriculum，Information，
	* 传入
		* ***courseID(bigint)***
		* ***time(char)***
		* ***week(char)***
	* 传出
		* ***gradeClass(char)（查找到的学生）***
			* ***再传出：	longitude（char）　　　latitude（char）　　（变量名字要改的）***
		* ***jobID(bigint)（传入下一个接口）***
			* ***再传出：	longitude（char）　　　latitude（char）　　（也是要改的）***
	* 再传入
		* ***sign（int）***

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
		* ***sign（int）（学生签到状态）***
		* ***sign（int）（教师手动签到）***
	* 传出
		* ***stuID（bigint）（没签到的学生）***
		* ***name（char）（没签到的学生）***
		* ***state（int）（没签到的学生状态）***

~~~
会给教师展现所有的没有签到的学生的姓名、学号和状态。教师可以手动签到。
~~~
