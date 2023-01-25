
//
//  SpaceShips.swift
//  Star Crash
//

import UIKit
var shipCollection = [Int]()
var Collected:UserDefaults = UserDefaults()
class SpaceShips: UIView {

    var SpaceShipOwned = 1
    
    @IBOutlet var label2: UILabel!
    
    
    let coins = UserDefaults.standard.integer(forKey: "total")
    var newCoins = 0
    var price = 0
    @IBOutlet var label: UILabel!
    var alerts = UIAlertController()
var vc = UIViewController()

    let Collection = UserDefaults.standard.array(forKey: "SavedCollection") as! [Int]
    @IBAction func OwnSpaceShip(_ sender: Any) {
 
  // ownSpaceShip.tag = tagg
      
        if ownSpaceShip.tag == 0{
            
            ownSpaceShip.backgroundColor = UIColor(red: 0, green: 255, blue: 0, alpha: 1)
            ownSpaceShip.titleLabel?.text = "Owned"
            setSpaceShipCounter = 1
            _ = UserDefaults.standard.set(setSpaceShipCounter, forKey: "CurrentSpaceShip")
            ownSpaceShip.isHidden = true
          
            
            
        }else if  ownSpaceShip.tag == 1{

            if Collection.count >= 2{
                setSpaceShipCounter = 2
                _ = UserDefaults.standard.set(setSpaceShipCounter, forKey: "CurrentSpaceShip")
                ownSpaceShip.isHidden = true
               
            }else if coins >= 0{//440
            
                price = 0//440
                let currentCoins = coins 
                newCoins = currentCoins - price
                _ = UserDefaults.standard.set(newCoins, forKey: "total")
                
                shipCollection = [1,2]
              
                alerts = UIAlertController(title: "Congratulations", message: "You got another Ship", preferredStyle: .alert)
                alerts.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alerts, animated: true, completion: nil)
                
                _ = UserDefaults.standard.set(shipCollection, forKey: "SavedCollection")
                setSpaceShipCounter = 2
                _ = UserDefaults.standard.set(setSpaceShipCounter, forKey: "CurrentSpaceShip")
                ownSpaceShip.isHidden = true
            }else{
                
                alerts = UIAlertController(title: "Don't have Enough Coins", message: "You do not have enough coins to get more coins please enter Coins Shop", preferredStyle: .alert)
                alerts.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alerts, animated: true, completion: nil)
            }
            
            
        }else if  ownSpaceShip.tag == 2{
            
            if Collection.count >= 3{
                setSpaceShipCounter = 3
                _ = UserDefaults.standard.set(setSpaceShipCounter, forKey: "CurrentSpaceShip")
                ownSpaceShip.isHidden = true
                
            }else if coins >= 0{//1000
                if  Collection.count == 2{
                price = 0//1000
                let currentCoins = coins 
                newCoins = currentCoins - price
                _ = UserDefaults.standard.set(newCoins, forKey: "total")
                
                shipCollection = [1,2,3]
                
                alerts = UIAlertController(title: "Congratulations", message: "You got another Ship", preferredStyle: .alert)
                alerts.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alerts, animated: true, completion: nil)
                
              _ = UserDefaults.standard.set(shipCollection, forKey: "SavedCollection")
                setSpaceShipCounter = 3
                _ = UserDefaults.standard.set(setSpaceShipCounter, forKey: "CurrentSpaceShip")
                ownSpaceShip.isHidden = true
                }else{
                alerts = UIAlertController(title: "Haven't bought previous ships", message: "You have to buy all the previous ship to get this", preferredStyle: .alert)
                alerts.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alerts, animated: true, completion: nil)
                }
            }else{
                
                alerts = UIAlertController(title: "Don't have Enough Coins", message: "You do not have enough coins to get more coins please enter Coins Shop", preferredStyle: .alert)
                alerts.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alerts, animated: true, completion: nil)
            }
            
        
        }else if  ownSpaceShip.tag == 3{
            
            if Collection.count >= 4{
                setSpaceShipCounter = 4
                _ = UserDefaults.standard.set(setSpaceShipCounter, forKey: "CurrentSpaceShip")
                ownSpaceShip.isHidden = true
                
            }else if coins >= 0{//1750
                if Collection.count == 3{
                price = 0//1750
                let currentCoins = coins 
                newCoins = currentCoins - price
                _ = UserDefaults.standard.set(newCoins, forKey: "total")
                
                shipCollection = [1,2,3,4]
                
                alerts = UIAlertController(title: "Congratulations", message: "You got another Ship", preferredStyle: .alert)
                alerts.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alerts, animated: true, completion: nil)
                
                _ = UserDefaults.standard.set(shipCollection, forKey: "SavedCollection")
                setSpaceShipCounter = 4
                _ = UserDefaults.standard.set(setSpaceShipCounter, forKey: "CurrentSpaceShip")
                ownSpaceShip.isHidden = true
                }else{
                alerts = UIAlertController(title: "Haven't bought previous ships", message: "You have to buy all the previous ship to get this", preferredStyle: .alert)
                alerts.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alerts, animated: true, completion: nil)
                }
            }else{
                
                alerts = UIAlertController(title: "Don't have Enough Coins", message: "You do not have enough coins to get more coins please enter Coins Shop", preferredStyle: .alert)
                alerts.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alerts, animated: true, completion: nil)
            }
       
        }else if  ownSpaceShip.tag == 4{
        
            if Collection.count >= 5{
                setSpaceShipCounter = 5
                _ = UserDefaults.standard.set(setSpaceShipCounter, forKey: "CurrentSpaceShip")
                ownSpaceShip.isHidden = true
                
            }else if coins >= 0 {//3000
                if Collection.count == 4 {
                price = 0//3000
                let currentCoins = coins 
                newCoins = currentCoins - price
                _ = UserDefaults.standard.set(newCoins, forKey: "total")
                
                shipCollection = [1,2,3,4,5]
                
                alerts = UIAlertController(title: "Congratulations", message: "You got another Ship", preferredStyle: .alert)
                alerts.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alerts, animated: true, completion: nil)
                
                _ = UserDefaults.standard.set(shipCollection, forKey: "SavedCollection")
                setSpaceShipCounter = 5
                _ = UserDefaults.standard.set(setSpaceShipCounter, forKey: "CurrentSpaceShip")
                ownSpaceShip.isHidden = true
                }else{
                    alerts = UIAlertController(title: "Haven't bought previous ships", message: "You have to buy all the previous ship to get this", preferredStyle: .alert)
                    alerts.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alerts, animated: true, completion: nil)
                    
                }
            }else{
                
                alerts = UIAlertController(title: "Don't have Enough Coins", message: "You do not have enough coins to get more coins please enter Coins Shop", preferredStyle: .alert)
                alerts.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alerts, animated: true, completion: nil)
            }
        }else if  ownSpaceShip.tag == 5{
            
            if Collection.count >= 5{
                setSpaceShipCounter = 6
                _ = UserDefaults.standard.set(setSpaceShipCounter, forKey: "CurrentSpaceShip")
                ownSpaceShip.isHidden = true
                
            }else if coins >= 0 {//5000
                if Collection.count == 5 {
                    price = 0//5000
                    let currentCoins = coins
                    newCoins = currentCoins - price
                    _ = UserDefaults.standard.set(newCoins, forKey: "total")
                    
                    shipCollection = [1,2,3,4,5,6]
                    
                    alerts = UIAlertController(title: "Congratulations", message: "You got another Ship", preferredStyle: .alert)
                    alerts.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alerts, animated: true, completion: nil)
                    
                    _ = UserDefaults.standard.set(shipCollection, forKey: "SavedCollection")
                    setSpaceShipCounter = 6
                    _ = UserDefaults.standard.set(setSpaceShipCounter, forKey: "CurrentSpaceShip")
                    ownSpaceShip.isHidden = true
                }else{
                    alerts = UIAlertController(title: "Haven't bought previous ships", message: "You have to buy all the previous ship to get this", preferredStyle: .alert)
                    alerts.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alerts, animated: true, completion: nil)
                    
                }
            }else{
                
                alerts = UIAlertController(title: "Don't have Enough Coins", message: "You do not have enough coins to get more coins please enter Coins Shop", preferredStyle: .alert)
                alerts.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                UIApplication.shared.keyWindow?.rootViewController?.presentedViewController?.present(alerts, animated: true, completion: nil)
            }
        }
        
    }
    
   
    
    @IBOutlet var Shipname: UILabel!
    @IBOutlet var bulletFeature: UILabel!
    
    @IBOutlet var spaceShip: UIImageView!
    @IBOutlet var faltuImage: UIImageView!
    @IBOutlet var ownSpaceShip: UIButton!
    @IBOutlet var spacePrice: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func viewDIdLoad(){
        
    }

}
