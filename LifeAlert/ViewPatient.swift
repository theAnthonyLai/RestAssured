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
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = UIColor(red: 0.169, green: 0.729, blue: 0.573, alpha: 1)
        //navigationController?.navigationBar.titleTextAttributes = [UItextAtt]
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        //2BBA92
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateData(timer : NSTimer) {
        var query = PFQuery(className:"TestPatient")
        query.getObjectInBackgroundWithId("MHBL7V0tYU") {
            (myPatient: PFObject?, error: NSError?) -> Void in
            if error == nil && myPatient != nil {
                if (myPatient!["left"] as? String == "Check-Pressure") {
                    self.leftShoulderAlert.hidden = false
                    self.leftShoulderSafe.hidden = true;
                } else {
                    self.leftShoulderAlert.hidden = true
                    self.leftShoulderSafe.hidden = false
                }
                
                if (myPatient!["right"] as? String == "Check-Pressure") {
                    self.rightShoulderAlert.hidden = false
                    self.rightShoulderSafe.hidden = true;
                } else {
                    self.rightShoulderAlert.hidden = true
                    self.rightShoulderSafe.hidden = false
                }
            } else {
                print(error)
            }
        }
    }

    
    @IBAction func leftShoulderPressed(sender: UIButton) {
        let myTimer : NSTimer = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: Selector("updateData:"), userInfo: nil, repeats: true)
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
