//
//  homeScene.swift
//  Star Crash
//

import SpriteKit
import GameplayKit
var home = 1
var music = true
var PlayingMusic = false
    var canPurchase = true
import AVFoundation
import StoreKit
class homeScene: SKScene{
    
    var product:SKProduct?
  //  var productID:String = "abhishekpatni.Star.Crash.RemoveAds"
    var audio = AVAudioPlayer()
    var viewController:UIViewController! = ShopViewController()
                     var starfield:SKEmitterNode!
    var backGround = SKSpriteNode()
    var play:SKSpriteNode!
    var shop:SKSpriteNode!
    var share:SKSpriteNode!
    //var removeAds:SKSpriteNode!
    var highScore:SKLabelNode!
    var Coins:SKLabelNode!
        var View:SKSpriteNode!
     var twitter:SKSpriteNode!
    var facebook:SKSpriteNode!
    var gmail:SKSpriteNode!
    var sharehigh:SKLabelNode!
    var CoinsNode:SKSpriteNode!
    var Music:SKSpriteNode!
    let OnMusicTexture = SKTexture(imageNamed: "MusicOn.png")
    let OffMusicTexture = SKTexture(imageNamed: "MusicOff.png")
    var musicState:Bool = UserDefaults.standard.bool(forKey: "musicState")
    var Collection = true
    var Coll = UserDefaults.standard.object(forKey: "Once") as? Bool
    var sceneIsHome = true
  //  let musicState:Bool = (UserDefaults.standard.object(forKey: "musicState") != nil)
    
    override func didMove(to view: SKView) {
        
      //  SKPaymentQueue.default().add(self)
      //  getPurchaseInfo()
            
    adisShoen = true

        if UserDefaults.standard.object(forKey: "musicState") == nil{
              _ = UserDefaults.standard.set(music, forKey: "musicState")
        }
    
        canAccess = true
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try   AVAudioSession.sharedInstance().setActive(true)
            
        }catch{
            
            
        }
        do {
            
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "1Os6oVXO1FCP.128", ofType: "mp3")!))
           audio.prepareToPlay()
          
        } catch {
            
            print("error")
            
        }
        
        if musicState == true{
        audio.play()
      
        }
        
        Timer.scheduledTimer(timeInterval: 45, target: self, selector: #selector(repeatAudio) ,  userInfo: nil, repeats: true)
        Music = self.childNode(withName: "Music") as! SKSpriteNode
       CoinsNode = self.childNode(withName: "coinsnode") as! SKSpriteNode
        facebook = self.childNode(withName: "facebook") as! SKSpriteNode
               twitter = self.childNode(withName: "twitter") as! SKSpriteNode
              View = self.childNode(withName: "View") as! SKSpriteNode
       gmail = self.childNode(withName: "google") as! SKSpriteNode
        
        starfield = self.childNode(withName: "starfield") as! SKEmitterNode
        starfield.advanceSimulationTime(20)
       // removeAds = self.childNode(withName: "removeAds") as! SKSpriteNode
        //removeAds.isHidden = true
        play = self.childNode(withName: "play") as! SKSpriteNode
        shop = self.childNode(withName: "shop") as! SKSpriteNode
        share = self.childNode(withName: "share") as! SKSpriteNode

               sharehigh = self.childNode(withName: "sharehigh") as! SKLabelNode
        highScore = self.childNode(withName: "highScore") as! SKLabelNode
        Coins = self.childNode(withName: "Coins")as! SKLabelNode
        let userDefaults = Foundation.UserDefaults.standard
       
        if let value = userDefaults.string(forKey: "Record"){
           let value2 = 10 * Double(value)! / 10
        highScore.text = "Light Years:- \(value2)"
     
        }
    
       let total = UserDefaults.standard.object(forKey: "total")
        
        if total == nil{
            
            let current = UserDefaults.standard.object(forKey: "coin")
            
            if current != nil{
            
            _ = UserDefaults.standard.set(current, forKey: "total")
            
           let val = current as! String
            
            Coins.text = val
                
            }else{
                
                Coins.text = String(0)
                
            }
            
            
        }else{
            
           let current = UserDefaults.standard.integer(forKey: "coin")
            
            let value = UserDefaults.standard.integer(forKey: "total")
        
            let cur = current
            
            let val = value
            
            let tot = Int(Int(val) + Int(cur))
            
            Coins.text = String(tot)
            
            _ = UserDefaults.standard.set(tot, forKey: "total")
            
        let makeCurrent0 = 0
            
            _ = UserDefaults.standard.set(makeCurrent0, forKey: "coin")
            
        }
        
                                       }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
              starfield.zPosition = 0
        
        let touch = touches.first
        
        if let location = touch?.location(in: self){
            
            let nodeTouched = self.nodes(at: location)
            
            if nodeTouched.first?.name == "play"{
         
                audio.currentTime = 0
                audio.pause()
              sceneIsHome = false
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = GameScene(fileNamed: "GameScene") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .fill//resizefill
                        
                        // Present the scene

                        view.presentScene(scene, transition: SKTransition.crossFade(withDuration: 1))
                    }
                    
                    view.ignoresSiblingOrder = true
                
                }

            }
            
            if nodeTouched.first?.name == "Music"{
                
                if music == true{

                    music = false
                    _ = UserDefaults.standard.set(music, forKey: "musicState")
                    
                }else{
                    
                    music = true
                     _ = UserDefaults.standard.set(music, forKey: "musicState")

                }
                
            }
            if nodeTouched.first?.name == "sound"{
                
            }
           /* if nodeTouched.first?.name == "removeAds"{
                if remove == true{
                if currentReachabilityStatus == .connected{
                     let payment = SKPayment(product: product!)
                        SKPaymentQueue.default().add(payment)
                }else{
                    let alert2 = UIAlertController(title: "No Internet Connection", message: "Please connect to the internet", preferredStyle: .alert)
                    alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
view?.window?.rootViewController?.present(alert2, animated: true, completion: nil)
                }
                }else{
                    let alert2 = UIAlertController(title: "Sorry for the inconvinience", message: "Please Restart the game to purchase the product", preferredStyle: .alert)
                    alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    view?.window?.rootViewController?.present(alert2, animated: true, completion: nil)
                }
                
            }*/
          
        }
        
    }
 
    @objc func repeatAudio(){
        
     /*   do {
            
            audio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "1Os6oVXO1FCP.128", ofType: "mp3")!))
            audio.prepareToPlay()
            
        } catch {
            
            print("error")
            
        }
        
        if music == false{
            
            audio.pause()
            audio.currentTime = 0
            
        }else{
            
            audio.play()
            
        }*/
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        let total = UserDefaults.standard.object(forKey: "total")
        
        if total == nil{
            
            let current = UserDefaults.standard.object(forKey: "coin")
            
                  if current != nil{
                
                _ = UserDefaults.standard.set(current, forKey: "total")
                let val = current as! String
                Coins.text = val
                
                  }else{
        
                   Coins.text = String(0)
       
                  }
            
        }else{
            
            let current = UserDefaults.standard.integer(forKey: "coin")
            let value = UserDefaults.standard.integer(forKey: "total")
            let cur = current
            let val = value
            let tot = Int(Int(val) + Int(cur))
            Coins.text = String(tot)
            _ = UserDefaults.standard.set(tot, forKey: "total")
            let makeCurrent0 = 0
            _ = UserDefaults.standard.set(makeCurrent0, forKey: "coin")
       
        }
        

        if UserDefaults.standard.object(forKey: "musicState") as! Bool == false{
        
            audio.pause()
            audio.currentTime = 0
            Music.texture = OffMusicTexture
        }
       else if UserDefaults.standard.object(forKey: "musicState") as! Bool == true{
         Music.texture = OnMusicTexture
            if sceneIsHome{
            audio.play()
            }
           // audio.currentTime = 1
        }
        
    }
   /* func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions{
            
            switch transaction.transactionState{
            case SKPaymentTransactionState.purchased:
            SKPaymentQueue.default().finishTransaction(transaction)
            alert = UIAlertController(title: "Thank You", message: "Your purchase was successfull. You will now recieve no ads", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            view?.window?.rootViewController?.present(alert, animated: true)
                removeAds.isHidden = true
            UserDefaults.standard.set(true, forKey: "Hidden")
            
            _ = UserDefaults.standard.set(true, forKey: "purchased RAD")
                
            case SKPaymentTransactionState.failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                alert = UIAlertController(title: "FAILED", message: "Yor purchase was unsuccessfull try again later", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                view?.window?.rootViewController?.present(alert, animated: true)

            default:
            break
            }
        }
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        print(response.products)
        var products = response.products
        if products.count == 0{
            
            
        }else{
            
            product = products[0]
            let state = UserDefaults.standard.bool(forKey: "Hidden")
            if state != nil && state == true{
                removeAds.isHidden = true
            }else{
            removeAds.isHidden = false
            }
            
        }
        let invalids = response.invalidProductIdentifiers
        for product in invalids{
            print("productNotFound")
        }
    }
    
    func getPurchaseInfo(){
        
        if SKPaymentQueue.canMakePayments(){
            
            let request = SKProductsRequest(productIdentifiers: NSSet(object: self.productID) as! Set<String>)
            request.delegate = self
            request.start()
            
        } else{
            var alert = UIAlertController()
            alert = UIAlertController(title: "Warning", message: "May be your in app purchases is turned off", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            view?.window?.rootViewController?.present(alert, animated: true)
        }
        
    }
*/
}

