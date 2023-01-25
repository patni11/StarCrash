//
//  menuViewController.swift
//  Star Crash
//
//  Created by Shubh Patni on 18/07/17.
//  Copyright © 2017 Abhishek Patni. All rights reserved.
//

import UIKit

class menuViewController: UIViewController {

    @IBOutlet var gameOverlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeColor), userInfo: nil, repeats: true)
        
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

    func changeColor(){
        
        let red = drand48()
        let blue = drand48()
        let green = drand48()
        
        gameOverlabel.textColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
        
        
 
        
    }
    
}
