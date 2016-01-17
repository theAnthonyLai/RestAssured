//
//  ViewPatient.swift
//  LifeAlert
//
//  Created by Anthony Lai on 1/16/16.
//  Copyright © 2016 Yu-Kuan (Anthony) Lai. All rights reserved.
//

import UIKit
import Parse

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
        //navigationController?.navigationBar.titleTextAttributes = [UItextAtt]
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        let myTimer : NSTimer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("fetchAllObjects:"), userInfo: nil, repeats: true)
        
        //2BBA92
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateData(timer : NSTimer) {
        var query = PFQuery(className:"TestPatient1")
        query.getObjectInBackgroundWithId("1U0A71XRvn") {
            (myPatient: PFObject?, error: NSError?) -> Void in
            if error == nil && myPatient != nil {
                if (myPatient!["leftShoulder"] as? String == "Check-Pressure") {
                    self.leftShoulderAlert.hidden = false
                    self.leftShoulderSafe.hidden = true;
                } else {
                    self.leftShoulderAlert.hidden = true
                    self.leftShoulderSafe.hidden = false
                }
                
                if (myPatient!["rightShoulder"] as? String == "Check-Pressure") {
                    self.rightShoulderAlert.hidden = false
                    self.rightShoulderSafe.hidden = true;
                } else {
                    self.rightShoulderAlert.hidden = true
                    self.rightShoulderSafe.hidden = false
                }
                
                if (myPatient!["leftBack"] as? String == "Check-Pressure") {
                    self.leftBackAlert.hidden = false
                    self.leftBackSafe.hidden = true;
                } else {
                    self.leftBackAlert.hidden = true
                    self.leftBackSafe.hidden = false
                }
                
                if (myPatient!["rightBack"] as? String == "Check-Pressure") {
                    self.rightBackAlert.hidden = false
                    self.rightBackSafe.hidden = true;
                } else {
                    self.rightBackAlert.hidden = true
                    self.rightBackSafe.hidden = false
                }

                
            } else {
                print(error)
            }
        }
    }

    func fetchAllObjects(timer: NSTimer) {
        var query = PFQuery(className: "PatientStatus")
        query.orderByDescending("createdAt")
        query.getFirstObjectInBackgroundWithBlock {
            (myPatient: PFObject?, error: NSError?) -> Void in
            if (myPatient!["leftShoulder"] as? String == "Check-Pressure") {
                self.leftShoulderAlert.hidden = false
                self.leftShoulderSafe.hidden = true;
            } else {
                self.leftShoulderAlert.hidden = true
                self.leftShoulderSafe.hidden = false
            }
            
            if (myPatient!["rightShoulder"] as? String == "Check-Pressure") {
                self.rightShoulderAlert.hidden = false
                self.rightShoulderSafe.hidden = true;
            } else {
                self.rightShoulderAlert.hidden = true
                self.rightShoulderSafe.hidden = false
            }
            
            if (myPatient!["leftBack"] as? String == "Check-Pressure") {
                self.leftBackAlert.hidden = false
                self.leftBackSafe.hidden = true;
            } else {
                self.leftBackAlert.hidden = true
                self.leftBackSafe.hidden = false
            }
            
            if (myPatient!["rightBack"] as? String == "Check-Pressure") {
                self.rightBackAlert.hidden = false
                self.rightBackSafe.hidden = true;
            } else {
                self.rightBackAlert.hidden = true
                self.rightBackSafe.hidden = false
            }

        }
    }
    
    @IBAction func leftShoulderPressed(sender: UIButton) {
//        let myTimer : NSTimer = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: Selector("updateData:"), userInfo: nil, repeats: true)
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
