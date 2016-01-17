//
//  ViewController.swift
//  LifeAlert
//
//  Created by Anthony Lai on 1/16/16.
//  Copyright © 2016 Yu-Kuan (Anthony) Lai. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var left: UILabel!
    @IBOutlet weak var right: UILabel!
    var myPatient: PFObject?
    var first = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let testObject = PFObject(className: "TestObject")
//        testObject["foo"] = "bar"
//        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
//            print("Object has been saved.")
//        }
    }
    
    func myPerformeCode(timer : NSTimer) {
        print("hello")
        // here code to perform
    }
    
    func updateData(timer : NSTimer) {
        var query = PFQuery(className:"TestPatient")
        query.getObjectInBackgroundWithId("MHBL7V0tYU") {
            (myPatient: PFObject?, error: NSError?) -> Void in
            if error == nil && myPatient != nil {
                //print(myPatient)
                self.name.text = myPatient!["name"] as? String
                self.age.text = myPatient!["age"] as? String
                self.left.text = myPatient!["left"] as? String
                self.right.text = myPatient!["right"] as? String
            } else {
                print(error)
            }
        }
    }

    @IBAction func testButtonPushed(sender: UIButton) {
        let myTimer : NSTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateData:"), userInfo: nil, repeats: true)
    }
    
    @IBAction func performSegue(sender: UIButton) {
        self.performSegueWithIdentifier("showViewPatient", sender: self)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

