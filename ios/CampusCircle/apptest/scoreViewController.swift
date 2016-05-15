//
//  scoreViewController.swift
//  apptest
//
//  Created by 乔蓝 on 16/5/13.
//  Copyright © 2016年 panTher. All rights reserved.
//

import UIKit

class scoreViewController: UIViewController {
 let url_score = NSURL (string: "http://218.7.221.122/score/index.html")

    @IBOutlet weak var score: UIWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let request = NSURLRequest(URL: url_score!)
        score.loadRequest(request)
        self.view.addSubview(score)
    
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

}
