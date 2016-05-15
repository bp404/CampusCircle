//
//  changepassword.swift
//  apptest
//
//  Created by 乔蓝 on 16/4/23.
//  Copyright © 2016年 panTher. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class changepassword: UIViewController {


    
    

    
    @IBOutlet weak var stuID: UITextField!
    @IBOutlet weak var oldpassword: UITextField!
    @IBOutlet weak var newpassword_1: UITextField!
    @IBOutlet weak var newpassword_2: UITextField!

    
    @IBAction func changepassword(sender: AnyObject) {
    
        //检测密码是否为空
        if newpassword_1.text! == ""{
            blankAlert()
        }
        else{
            //检测两次密码是否相同
            if newpassword_1.text! == newpassword_2.text!{
                changepassword()
            }
            else{
                PasswordAlert()
            }
        }

        }
        

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //两次密码不同提示框
    func PasswordAlert(){
        let alert = UIAlertController(title: "两次填写的密码不一致", message: "请检查后重新输入", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    //旧密码错误提示框
    func oldpasswordAlert(){
        let alert = UIAlertController(title: "修改失败", message: "旧密码错误", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    //成功
    func successAlert(){
        let alert = UIAlertController(title: "修改密码成功", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    //用户名错误
    func stuAlert(){
        let alert = UIAlertController(title: "修改失败", message: "学号错误", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    //未知错误提示框
    func unknowAlert(){
        let alert = UIAlertController(title: "", message: "请检查后重新输入", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }


    //输入密码提示框
    func blankAlert(){
        let alert = UIAlertController(title: "密码不能为空", message: "请输入密码", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    
    func changepassword(){
        let username:String = stuID.text!
        let oldpw:String = oldpassword.text!
        print("\(oldpassword.text)")
        let message1:String = username
        let message2:String = oldpw
        let message3:String = newpassword_1.text!
        let parameters = ["message1":message1, "message2":message2, "message3":message3]
        print("\(parameters)")
        Alamofire.request(.POST, "http://10.10.10.73/api/change.php", parameters: parameters)
            .responseJSON { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        let name: String = json["a"].stringValue
                        print("\(name)")
                        if name == "1"
                        {
                           //学号错误
                            self.stuAlert()
                        }
                        if name == "2"
                        {
                            self.oldpasswordAlert()//旧密码错误
                        }
                        if name == "3"
                            {
                                //修改成功
                                self.successAlert()
                        }
                        if name == "0"
                        {
                            self.unknowAlert()//Unknow error
                        }
                    }
                case .Failure(let error):
                    print(error)
                    
                }
        }
    }
    }

