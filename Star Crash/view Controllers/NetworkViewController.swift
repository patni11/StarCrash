//
//  NetworkViewController.swift
//  Star Crash
//
//  Created by Shubh Patni on 03/01/18.
//  Copyright © 2018 Abhishek Patni. All rights reserved.
//

import UIKit
import SystemConfiguration
class NetworkViewController: UIViewController {
    protocol Utilities {
        
    }
    
    extension NSObject:Utilities{
    enum reachabilityStatus{
        case reachable
        case nonReachable
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
