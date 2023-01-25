//
//  PowersView.swift
//  Star Crash
//
//  Created by  on 25/11/17.
//  Copyright © 2017 Abhishek Patni. All rights reserved.
//

import UIKit

class PowersView: UIView {

    var i = Int()
     let Coins = UserDefaults.standard.integer(forKey: "total")
var CounterForCanBuy = UserDefaults.standard.object(forKey: "CanBuy") as! Bool
    @IBOutlet var PowerImage: UIImageView!
    @IBOutlet var Name: UILabel!
    @IBAction func buy(_ sender: Any) {
        
refresh()

        if BuyOutlet.tag == 0{

            if CounterForCanBuy == true{
     
                if Coins >= 50{
                    let price = 50
                    var new  = Int()
                    new = Coins - price
                    _ = UserDefaults.standard.set(new, forKey: "total")
                    let newBool = false
                   _ = UserDefaults.standard.set(newBool, forKey: "CanBuy")
                    i = 1
                 _ = UserDefaults.standard.set(1, forKey: "Powers")
                    
                    let alert = UIAlertController(title: "Congratulations", message: "You got 'Speed Up' power Up", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alert, animated: true, completion: nil)
                }else{
                    
                    let alert = UIAlertController(title: "Couldn't Buy", message: "Sorry! you do not have enough money to buy Speed up", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alert, animated: true, completion: nil)
                    
                }
                
            }else{
                print("step3")
                let alert = UIAlertController(title: "Couldn't Buy", message: "Sorry! you couldn't buy another power Up, You already got one", preferredStyle: .alert)
alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alert, animated: true, completion: nil)
                
            }
            
        }else if BuyOutlet.tag == 1{
        
            if CounterForCanBuy == true{

                if Coins >= 20{
                    let price = 20
                    var new  = Int()
                    new = Coins - price
                    _ = UserDefaults.standard.set(new, forKey: "total")
                    let newBool = false
                    _ = UserDefaults.standard.set(newBool, forKey: "CanBuy")
                    i = 2
                    _ = UserDefaults.standard.set(i, forKey: "Powers")
                    let alert = UIAlertController(title: "Congratulations", message: "You got 'Magnet' power Up", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alert, animated: true, completion: nil)
                }else{
                    
                    let alert = UIAlertController(title: "Couldn't Buy", message: "Sorry! you do not have enough money to buy Magnet", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alert, animated: true, completion: nil)
                    
                }
                
            }else{

                let alert = UIAlertController(title: "Couldn't Buy", message: "Sorry! you couldn't buy another power Up, You already got one", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alert, animated: true, completion: nil)
                
            }
            
        }else if BuyOutlet.tag == 2{
            
         
            if CounterForCanBuy == true{

                if Coins >= 30{
                    let price = 30
                    var new  = Int()
                    new = Coins - price
                    _ = UserDefaults.standard.set(new, forKey: "total")
                    let newBool = false
                    _ = UserDefaults.standard.set(newBool, forKey: "CanBuy")
                    i = 3
                    _ = UserDefaults.standard.set(i, forKey: "Powers")
                    let alert = UIAlertController(title: "Congratulations", message: "You got 'Power Bullet' power Up", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alert, animated: true, completion: nil)
                }else{
                    
                    let alert = UIAlertController(title: "Couldn't Buy", message: "Sorry! you do not have enough money to buy Power Bullet", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alert, animated: true, completion: nil)
                    
                }
                
            }else{
   
                let alert = UIAlertController(title: "Couldn't Buy", message: "Sorry! you couldn't buy another power Up, You already got one", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alert, animated: true, completion: nil)
                
            }
            
        }
        
    }
    @IBOutlet var BuyOutlet: UIButton!

    @IBOutlet var img: UIImageView!
    @IBOutlet var Description: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
   @objc func refresh(){
        CounterForCanBuy = UserDefaults.standard.object(forKey: "CanBuy") as! Bool
    }

}
