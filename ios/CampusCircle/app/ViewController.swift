//
//  ViewController.swift
//  app
//
//  Created by 朱嘉祥 on 16/4/9.
//  Copyright © 2016年 panther. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
//    约车
    @IBAction func yueche(sender: AnyObject) {
        let yueche = UIWebView(frame :self.view.bounds)
        let url = NSURL(string: "https://www.baidu.com")
        let request = NSURLRequest(URL: url!)
        yueche.loadRequest(request)
        self.view.addSubview(yueche)
        
        
        
    }


    

    

//    期末成绩调用函数
  
    @IBAction func qimochengji(sender: AnyObject) {
        self.performSegueWithIdentifier("score", sender: self)
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

    
    
    
    
//    四六级成绩调用函数
    @IBAction func siliuji(sender: AnyObject) {
        let siliuji = UIWebView(frame:self.view.bounds)
        let url = NSURL(string: "http://218.7.221.122/cet/index.html")
        let request = NSURLRequest(URL: url!)
        siliuji.loadRequest(request)
        self.view.addSubview(siliuji)
        
        
        
    }

    

    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


        
    
    
    
}

