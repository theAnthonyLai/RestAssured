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

    @IBOutlet weak var leftShoulder: UIButton!
    @IBOutlet weak var leftShoulderSafe: UIButton!
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
                //print(myPatient)
//                self.name.text = myPatient!["name"] as? String
//                self.age.text = myPatient!["age"] as? String
//                self.left.text = myPatient!["left"] as? String
//                self.right.text = myPatient!["right"] as? String
                if (myPatient!["left"] as? String == "Check-Pressure") {
                    print("Left shoulder pressured")
                    //self.leftShoulder.backgroundColor = UIColor(patternImage: UIImage(named: "alert_indicator")!)
                    self.leftShoulder.hidden = false
                    self.leftShoulderSafe.hidden = true;
                    
                } else {
                    print("Left shoulder not pressured")
                    //self.leftShoulder.backgroundColor = UIColor(patternImage: UIImage(named: "safe_indicator")!)
                    self.leftShoulder.hidden = true
                    self.leftShoulderSafe.hidden = false
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
