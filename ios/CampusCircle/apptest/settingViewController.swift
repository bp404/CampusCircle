//
//  settingViewController.swift
//  apptest
//
//  Created by 乔蓝 on 16/5/12.
//  Copyright © 2016年 panTher. All rights reserved.
//

import UIKit

class settingViewController: UIViewController {

    @IBAction func version(sender: AnyObject) {
        versionAlert()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func versionAlert(){
        let alert = UIAlertController(title: "版本号：1.0.0", message: "已是最新版本", preferredStyle: UIAlertControllerStyle.Alert)
        // add the buttons
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
