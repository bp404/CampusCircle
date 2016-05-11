//
//  CetscoreViewController.swift
//  app
//
//  Created by 朱嘉祥 on 16/5/8.
//  Copyright © 2016年 panther. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class CetscoreViewController: UIViewController {
    let url_cet = NSURL (string: "http://218.7.221.122/cet/index.html")
    
    @IBOutlet weak var cet: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //Do any additional setup after loading the view, typically from a nib.
        let request_cet = NSURLRequest(URL: url_cet!)
        cet.loadRequest(request_cet)
        self.view.addSubview(cet)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

