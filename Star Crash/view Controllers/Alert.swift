//
//  Alert.swift
//  Star Crash
//
//  Created by Shubh Patni on 16/04/18.
//  Copyright © 2018 Abhishek Patni. All rights reserved.
//

import Foundation
import UIKit

class Alert{

    func alertt(title: String,message: String) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        return alert
    
    }
    
}
