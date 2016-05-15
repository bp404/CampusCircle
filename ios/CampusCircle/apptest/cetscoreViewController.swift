//
//  cetscoreViewController.swift
//  apptest
//
//  Created by 乔蓝 on 16/5/13.
//  Copyright © 2016年 panTher. All rights reserved.
//

import UIKit

class cetscoreViewController: UIViewController {
    @IBOutlet weak var cet: UIWebView!
let url_cetscore = NSURL (string: "http://218.7.221.122/cet/index.html")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let request_cet = NSURLRequest(URL: url_cetscore!)
        cet.loadRequest(request_cet)
        self.view.addSubview(cet)
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
