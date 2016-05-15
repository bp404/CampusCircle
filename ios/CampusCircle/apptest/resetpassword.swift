//
//  resetpassword.swift
//  apptest
//
//  Created by 乔蓝 on 16/4/23.
//  Copyright © 2016年 panTher. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON





class resetpassword: UIViewController {

    
    
    
    @IBOutlet weak var stuID: UITextField!
    
    @IBOutlet weak var newpassword_1: UITextField!
    @IBOutlet weak var newpassword_2: UITextField!
  
    
    @IBAction func resetpassword(sender: AnyObject) {
    
    //检测两次密码是否相同
        if stuID.text! == ""{
            stuidAlert()
        }
        if newpassword_1.text! == "" || newpassword_2.text! == "" {
            newpasswordAlert()
        }
        else{
        if newpassword_1.text! == newpassword_2.text!{
            resetPassword()
            
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
    
    //请输入学号
    func stuidAlert(){
        let alert = UIAlertController(title: "请填写学号", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    //请输密码
    func newpasswordAlert(){
        let alert = UIAlertController(title: "请填写密码", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    //两次密码不同提示框
    func PasswordAlert(){
        let alert = UIAlertController(title: "两次填写的密码不一样", message: "请检查后重新输入", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    //已经修改过了提示框
    func hadchangeAlert(){
        let alert = UIAlertController(title: "密码已经重置", message: "请直接登录", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    //和初始密码相同提示框
    func samepasswordAlert(){
        let alert = UIAlertController(title: "密码不能与初始密码一致", message: "请检查后重新输入", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    //用户名错误提示框
    func siAlert(){
        let alert = UIAlertController(title: "学号错误", message: "请重新输入", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    //重置密码成功提示框
    func successAlert(){
        let alertController = UIAlertController(title: "重置密码成功",message: "请使用新密码登录", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "确定", style: .Default,
        handler: {
                 action in
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("loginSuccess") as UIViewController
            self.presentViewController(vc, animated: true, completion: nil)
        })

        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }

    //未知错误提示框
    func unknowAlert(){
        let alert = UIAlertController(title: "", message: "请检查后重新输入", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }



    
    // 重置密码函数
    func resetPassword(){
        let username:String = stuID.text!
        let password:String = newpassword_1.text!
        let message1 = username
        let message2 = password
        
        let parameters = ["message1": message1,"message2": message2]
        print("\(parameters)")
        Alamofire.request(.POST, "http://10.10.10.73/api/reset.php", parameters: parameters)
            .responseJSON { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        let name: String = json["a"].stringValue
                        print("\(name)")
                        if name == "1"
                        {
                            self.siAlert()//username alert
                        }
                        if name == "2"
                        {
                            self.successAlert() //登陆成功
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

