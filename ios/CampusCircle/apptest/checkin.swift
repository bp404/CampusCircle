//
//  checkin.swift
//  apptest
//
//  Created by 乔蓝 on 16/5/4.
//  Copyright © 2016年 panTher. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON


class checkin: UIViewController,CLLocationManagerDelegate {
    

    
    @IBAction func check(sender: AnyObject) {
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
            Alamofire.request(.POST, "http://10.10.10.73/api/change.php", parameters: parameters).responseJSON { response in
                switch response.result   {
                    case .Success:
                        if let value = response.result.value {
                            let json = JSON(value)
                            let name: String = json["a"].stringValue
                            print("\(name)")
                        if name == "1" {
                            self.success.text = "签到成功"
                                           }
                            
                                                             }
                    case .Failure(let error):
                        print(error)
                                              }
                                           }
                      }
        

        
       locationManager.stopUpdatingLocation()
                                         }
   
    }

func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
    print(error)
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


