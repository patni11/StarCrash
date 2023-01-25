//
//  shareViewController.swift
//  Star Crash
//
//  Created by Shubh Patni on 01/08/17.
//  Copyright © 2017 Abhishek Patni. All rights reserved.
//

import UIKit
class shareViewController: UIViewController {

   // let value = UserDefaults.standard.object(forKey: "Record")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     /*   if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
            
            let twitter:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            twitter.setInitialText("Can You Beat Me? My HighScore is \(String(describing: value))")
            
            self.present(twitter, animated: true, completion: nil)
        
        }
*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
