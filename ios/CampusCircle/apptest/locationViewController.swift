//
//  locationViewController.swift
//  apptest
//
//  Created by 乔蓝 on 16/5/12.
//  Copyright © 2016年 panTher. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON


class locationViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBAction func check(sender: AnyObject) {
        //定时器
        var timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
    }
    
    func update(){
        locationManager.startUpdatingLocation()
        
    }
    
    @IBOutlet weak var success: UITextField!
    
    let locationManager:CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location:CLLocation = locations[locations.count - 1] as CLLocation
        if(location.horizontalAccuracy > 0){
            let message1 = String(location.coordinate.latitude)
            let message2 = String(location.coordinate.longitude)
            let parameters = [message1:"message1", message2:"message2"]
            print("\(parameters)")
            Alamofire.request(.POST, "http://10.10.10.73/api/change.php", parameters: parameters)
        
        
        }
        
        locationManager.stopUpdatingLocation()
        //            print(location.coordinate.latitude)
        //            print(location.coordinate.longitude)
        
        
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
        print(error)
    }
}




/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

