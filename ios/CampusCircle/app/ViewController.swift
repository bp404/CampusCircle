//
//  ViewController.swift
//  app
//
//  Created by 朱嘉祥 on 16/4/9.
//  Copyright © 2016年 panther. All rights reserved.
//  zjx

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
//    ～～～～～～登陆页～～～～～～
//    绑定首页背景图
    @IBOutlet weak var backgroundImage: UIImageView!
//    绑定applogo
    @IBOutlet weak var appLogo: UIImageView!
//    绑定首页lable
    @IBOutlet weak var trip: UILabel!
//    绑定学号text
    @IBOutlet weak var stdnum: UITextField!
//    绑定密码text
    @IBOutlet weak var password: UITextField!
//    绑定区分1
    @IBOutlet weak var difference1: UILabel!
//    登录button
    @IBAction func enter(sender: AnyObject) {
    }
//    注册button
    @IBAction func register(sender: AnyObject) {
    }
//    忘记密码button
    @IBAction func forget(sender: AnyObject) {
    }
    
    
    
    
//    ～～～～～～校园界面～～～～～～
//    绑定哈师大图片1
    @IBOutlet weak var hsdimage1: UIImageView!
//    绑定签到状态
    @IBOutlet weak var state: UILabel!
//    绑定所在位置
    @IBOutlet weak var location: UILabel!
//    绑定是否有课
    @IBOutlet weak var haveClass: UILabel!
//    绑定区分2
    @IBOutlet weak var differrence2: UILabel!
//    健康button
    @IBAction func health(sender: AnyObject) {
    }
//    课程表button
    @IBAction func timetable(sender: AnyObject) {
    }
//    签到button
    @IBAction func signIn(sender: AnyObject) {
    }
//    教室通button
    @IBAction func classroom(sender: AnyObject) {
    }
//    水资源button
    @IBAction func water(sender: AnyObject) {
    }
//    食堂button
    @IBAction func restaurant(sender: AnyObject) {
    }
    
    
    
    
//    ～～～～～～水资源～～～～～～
//    实时情况lable
    @IBOutlet weak var watertime: UIImageView!
//    浴池人数
    @IBOutlet weak var peopleNum: UILabel!
//    浴池用水状况
    @IBOutlet weak var waterstate: UILabel!
//    注意1
    @IBOutlet weak var attention1: UITextView!
//    绑定分区3
    @IBOutlet weak var differrence3: UILabel!
//    寝室用水
    @IBOutlet weak var usewater: UIImageView!
//    寝室用水状况
    @IBOutlet weak var usewaterstate: UILabel!
//    注意2
    @IBOutlet weak var attention2: UILabel!
//    浴池概况button
    @IBAction func waterstate(sender: AnyObject) {
    }

//    我的打水情况button
    @IBAction func usewaterforown(sender: AnyObject) {
    }
//    停水时间预测button
    @IBAction func stopForcast(sender: AnyObject) {
    }
    
    
    
//    ～～～～～签到～～～～～
//    今日课程
    @IBOutlet weak var todayClasses: UILabel!
//    实时课程
    @IBOutlet weak var timeClass: UILabel!
//    任课老师
    @IBOutlet weak var timeTeacher: UILabel!
//    所在教室
    @IBOutlet weak var timeClassroom: UILabel!
//    签到状态
    @IBOutlet weak var classState: UILabel!
//    注意3
    @IBOutlet weak var atterntion3: UILabel!
//    注意4
    @IBOutlet weak var atterntion4: UITextView!
//    查看课程表button
    @IBAction func schooltimetable(sender: AnyObject) {
    }
//    点击签到button
    @IBAction func clickto(sender: AnyObject) {
    }
//    手动签到button
    @IBAction func checkByhands(sender: AnyObject) {
    }
    
    
    
//    ～～～～～发现～～～～～
//    期末成绩调用函数
    @IBAction func score(sender: AnyObject) {
            self.performSegueWithIdentifier("score", sender: self)
    }
  
//    四六级成绩调用函数
    

    @IBAction func cetscore(sender: AnyObject) {
        self.performSegueWithIdentifier("cetscore", sender: self)
    }
    


//    二手校园调用函数
    @IBAction func ershouxiaoyuan(sender: AnyObject) {
        let ershouxiaoyuan = UIWebView(frame:self.view.bounds)
        let url = NSURL(string: "http://xiaoqu.qq.com/mobile/barindex.html?bid=74693&_wv=1027&from=wsqjump")
        let request = NSURLRequest(URL: url!)
        ershouxiaoyuan.loadRequest(request)
        self.view.addSubview(ershouxiaoyuan)
        
        
    }
    
    
//    图书馆藏调用函数
    @IBAction func tushuguancang(sender: AnyObject) {
        let tushuguancang = UIWebView(frame:self.view.bounds)
        let url = NSURL(string: "http://m.5read.com/941")
        let request = NSURLRequest(URL: url!)
        tushuguancang.loadRequest(request)
        self.view.addSubview(tushuguancang)
        
        
    }
    
    
//    普通话成绩调用函数
    @IBAction func putonghua(sender: AnyObject) {
        let putonghua = UIWebView(frame :self.view.bounds)
        let url = NSURL(string: "http://218.7.221.122/mandarin/index.html")
        let request = NSURLRequest(URL: url!)
        putonghua.loadRequest(request)
        self.view.addSubview(putonghua)
        
        
    }
    
    
//    校历调用函数
    @IBAction func xiaoli(sender: AnyObject) {
        let xiaoli = UIWebView(frame:self.view.bounds)
        let url = NSURL(string: "http://www.hrbnu.edu.cn/xnfw/xiaoli.html")
        let request = NSURLRequest(URL: url!)
        xiaoli.loadRequest(request)
        self.view.addSubview(xiaoli)
        
        

    }
    
    
//    ～～～～～设置～～～～～
//    修改密码button
    @IBAction func changePassword(sender: AnyObject) {
    }
//    版本更新button
    @IBAction func upYourSoftware(sender: AnyObject) {
    }
//    关于我们button
    @IBAction func aboutUs(sender: AnyObject) {
    }
//    问题反馈button
    @IBAction func opinions(sender: AnyObject) {
    }
    

    
//    ～～～～～修改密码～～～～～
    @IBOutlet weak var primaryPassword: UILabel!
    
    @IBOutlet weak var newPassword: UILabel!
    
    @IBOutlet weak var makesurePassword: UILabel!
    
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


        
    
    
    
}

