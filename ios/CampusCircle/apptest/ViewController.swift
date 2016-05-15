//
//  ViewController.swift
//  apptest
//
//  Created by macbook on 16/4/7.
//  Copyright © 2016年 panTher. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



//md5加密
extension String  {
    var md5: String! {
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.dealloc(digestLen)
        return String(format: hash as String)
    }
}


class ViewController: UIViewController {

    //绑定登陆界面
  
    
    @IBOutlet weak var stuID: UITextField!

    
    @IBOutlet weak var passWord: UITextField!
    
    @IBAction func login(sender: AnyObject) {
        LoginDetect()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //用户名错误提示框
    func UsernameAlert(){
        let alert = UIAlertController(title: "用户名不正确", message: "请确认后重新输入", preferredStyle: UIAlertControllerStyle.Alert)
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    //密码错误提示框
    func PasswordAlert(){
        let alert = UIAlertController(title: "密码错误", message: "请确认后重新输入", preferredStyle: UIAlertControllerStyle.Alert)
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    //未知错误提示框
    func UnknowAlert(){
        let alert = UIAlertController(title: "请输入用户名或密码", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    //登陆检测
    func LoginDetect(){
        let passwordEncryption:String = passWord.text!
        //时间戳
        let timeInterval = Int(NSDate().timeIntervalSince1970 / 60)
        print("\(timeInterval)")
        //md5加时间戳
        let passwordEncryption_MD5_timeStamp:String = passwordEncryption.md5 + String(timeInterval)
        //最后的密码
        let password = passwordEncryption_MD5_timeStamp.md5
        //传入的message
        let message:String = stuID.text! + password
        let parameters = ["message":message]
        Alamofire.request(.POST, "http://10.10.10.73/api/app.php", parameters: parameters)
            .responseJSON { response in
                    switch response.result {
                    case .Success:
                        if let value = response.result.value {
                            let json = JSON(value)
                            let name: String = json["a"].stringValue
                            print("\(name)")
                            if name == "1"
                            {
                                self.UsernameAlert()//username alert
                            }
                            if name == "2"
                            {
                                self.PasswordAlert()//password error
                            }
                           if name == "3"
                            {
                                  //弹出重置密码窗口
                                self.performSegueWithIdentifier("resetPassword", sender: self)
                                print("Yes")
                            }
                            if name == "4"
                            {
                                //登陆成功。跳转到另一个ViewController,不用拖拽。
                                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("loginSuccess") as UIViewController
                                self.presentViewController(vc, animated: true, completion: nil)
                            }
                            if name == "0"
                            {
                               self.UnknowAlert()//Unknow error
                            }
                    }
                    case .Failure(let error):
                        print(error)

                }
        }
    }
}