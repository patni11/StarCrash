//
//  menuViewController.swift
//  Star Crash
//
//  Created by Shubh Patni on 18/07/17.
//  Copyright © 2017 Abhishek Patni. All rights reserved.
//

import UIKit
import Social
class menuViewController: UIViewController {
    

    @IBAction func faebook(_ sender: Any) {
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
            
            let twitter:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            twitter.setInitialText("Can You Beat Me? My HighScore")
            
            self.present(twitter, animated: true, completion: nil)
            
        }else{
            
            let alert = UIAlertController(title: "Accounts", message: "Please LogIn To Your Twitter Acount", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


    
}
