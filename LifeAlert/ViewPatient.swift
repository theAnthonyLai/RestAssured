//
//  ViewPatient.swift
//  LifeAlert
//
//  Created by Anthony Lai on 1/16/16.
//  Copyright © 2016 Yu-Kuan (Anthony) Lai. All rights reserved.
//

import UIKit
import Parse
import AudioToolbox

class ViewPatient: UIViewController {

    @IBOutlet weak var leftShoulderAlert: UIButton!
    @IBOutlet weak var leftShoulderSafe: UIButton!
    @IBOutlet weak var rightShoulderAlert: UIButton!
    @IBOutlet weak var rightShoulderSafe: UIButton!
    @IBOutlet weak var leftBackSafe: UIButton!
    @IBOutlet weak var leftBackAlert: UIButton!
    @IBOutlet weak var rightBackSafe: UIButton!
    @IBOutlet weak var rightBackAlert: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.169, green: 0.729, blue: 0.573, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        let myFirstTimer : NSTimer = NSTimer.scheduledTimerWithTimeInterval(0, target: self, selector: Selector("fetchAllObjects:"), userInfo: nil, repeats: false)
        
        let myTimer : NSTimer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("fetchAllObjects:"), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchAllObjects(timer: NSTimer) {
        var query = PFQuery(className: "PatientStatus")
        query.orderByDescending("createdAt")
        query.getFirstObjectInBackgroundWithBlock {
            (myPatient: PFObject?, error: NSError?) -> Void in
            if (myPatient!["leftShoulder"] as? String == "Check-Pressure") {
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
                self.leftShoulderAlert.hidden = false
                UIView.animateWithDuration(0.8, delay: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    self.leftShoulderAlert.alpha = 0.1
                    }, completion: {
                        (value: Bool) in
                        UIView.animateWithDuration(0.8, delay: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                            self.leftShoulderAlert.alpha = 1.0
                        }, completion: nil)
                })
                self.leftShoulderSafe.hidden = true
            } else {
                self.leftShoulderAlert.hidden = true
                self.leftShoulderSafe.hidden = false
            }
            
            if (myPatient!["rightShoulder"] as? String == "Check-Pressure") {
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
                self.rightShoulderAlert.hidden = false
                UIView.animateWithDuration(0.8, delay: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    self.rightShoulderAlert.alpha = 0.1
                    }, completion: {
                        (value: Bool) in
                        UIView.animateWithDuration(0.8, delay: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                            self.rightShoulderAlert.alpha = 1.0
                            }, completion: nil)
                })
                self.rightShoulderSafe.hidden = true
            } else {
                self.rightShoulderAlert.hidden = true
                self.rightShoulderSafe.hidden = false
            }
            
            if (myPatient!["leftBack"] as? String == "Check-Pressure") {
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
                self.leftBackAlert.hidden = false
                UIView.animateWithDuration(0.8, delay: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    self.leftBackAlert.alpha = 0.1
                    }, completion: {
                        (value: Bool) in
                        UIView.animateWithDuration(0.8, delay: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                            self.leftBackAlert.alpha = 1.0
                            }, completion: nil)
                })
                self.leftBackSafe.hidden = true
            } else {
                self.leftBackAlert.hidden = true
                self.leftBackSafe.hidden = false
            }
            
            if (myPatient!["rightBack"] as? String == "Check-Pressure") {
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
                self.rightBackAlert.hidden = false
                UIView.animateWithDuration(0.8, delay: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    self.rightBackAlert.alpha = 0.1
                    }, completion: {
                        (value: Bool) in
                        UIView.animateWithDuration(0.8, delay: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                            self.rightBackAlert.alpha = 1.0
                            }, completion: nil)
                })
                self.rightBackSafe.hidden = true
            } else {
                self.rightBackAlert.hidden = true
                self.rightBackSafe.hidden = false
            }

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

}
