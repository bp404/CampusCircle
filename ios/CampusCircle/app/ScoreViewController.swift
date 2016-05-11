//
//  ScoreViewController.swift
//  app
//
//  Created by 朱嘉祥 on 16/5/4.
//  Copyright © 2016年 panther. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ScoreViewController: UIViewController {
    let url = NSURL(string: "http://218.7.221.122/score/index.html")

 
    @IBOutlet weak var score: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    let request = NSURLRequest(URL: url!)
    score.loadRequest(request)
    self.view.addSubview(score)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

