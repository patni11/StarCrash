//
//  ShopViewController.swift
//  Star Crash
//

import UIKit
import GoogleMobileAds
import StoreKit

    var setSpaceShipCounter = Int()
var tagg = 0
//var sharedSecret = "3711b29523fb4fadabb526cf5e16bef2"
  let newControlState = UIControlState()
class NetworkIndicatorManager : NSObject{
    
    private static var loadingCount = 0
    
    class func NetworkOperationStarted() {
        
        if loadingCount == 0{
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
        }
        
        loadingCount += 1
        
    }
    
    class func NetworkOperationFinished() {
   
        if loadingCount >= 0{
            
            loadingCount -= 1
            
        }
        
        if loadingCount == 0{
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
        }
        
    }
    
}

class ShopViewController: UIViewController, GADRewardBasedVideoAdDelegate, SKProductsRequestDelegate, UIAlertViewDelegate, UIScrollViewDelegate, SKPaymentTransactionObserver{
    
    var butTag = Int()
    @IBOutlet var timesLabel: UILabel!
    var alert = Alert()
    var backGroundTask: UIBackgroundTaskIdentifier = UIBackgroundTaskInvalid
    var adsState = UserDefaults.standard.set(true, forKey: "adsState")
    var timer = Timer()
    let coins = UserDefaults.standard.integer(forKey: "total")
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
      
        let new = 30
        let total = coins + new
        _ = UserDefaults.standard.set(total, forKey: "total")
        _ = UserDefaults.standard.set(false, forKey: "adsState")

        self.present(alert.alertt(title: "Congratulation", message: "You got 30 Coins"), animated: true, completion: nil)
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad is closed.")
        
     
    }
    var canExit = true
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pagecontrol: UIPageControl!
var activeproduct = [SKProduct?]()
    @IBOutlet var PowerView: UIView!
    @IBOutlet var PowerScroll: UIScrollView!
    @IBOutlet var POwerOut: UIButton!
    
    @IBAction func PowerBut(_ sender: Any) {
   
        UIView.animate(withDuration: 1, animations: {
            self.PowerView.alpha = 1
            self.PowerView.center = CGPoint(x: self.PowerView.center.x, y: self.PowerView.center.y - 800)
            })
         endViewOutlet.isHidden = false
    SpaceShipBut.isEnabled = false
CoinBuyBut.isEnabled = false
        POwerOut.isEnabled = false
    }
    var setSpaceShip = UserDefaults.standard.object(forKey: "CurrentSpaceShip")
    var rewardBasedVideo: GADRewardBasedVideoAd?

    @IBOutlet var upperView: UIView!
  
   
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd:GADRewardBasedVideoAd) {
        print("Reward based video ad is received.")
        
        makebuttonvisible()
        
    }
    
    @IBAction func exitShop(_ sender: Any) {
       // if canExit{
         self.dismiss(animated: true, completion: nil)
       // }else{
         //   alert(title: "Purchasing", message: "Let the first purchase finish first")
        //}
        
    }
    @objc func makebuttonvisible(){
        
        adssssss.isEnabled = true
        
    }

    
    @IBOutlet var SpaceShipView: UIView!
    //SpaceSHips
    let spaceShip1 = ["title":"Predator", "feature":"1 bullet per shot", "price":"0", "image":"Component (2)", "tag":1, "get":"get"/*,"color":"Tangerine"*/] as [String : Any]//chandragupta
  
    let spaceShip2 = ["title":"Astrosat", "feature":"Reload time 0.5 sec", "price":"440", "image":"Ship2.png", "tag":2,"get":"get"/*,"color":"Teal"*/] as [String : Any]//Ashoka
    
    let spaceShip3 = ["title":"Ariane", "feature":"Cannon Ball", "price":"1000", "image":"alien.png", "tag":3/*,"color":"Salmon"*/] as [String : Any]//Chakravarti
    
    let spaceShip4 = ["title":"Peregrine", "feature":"3 Bullets", "price":"1750", "image":"alien2", "tag":5/*,"color":"Clover"*/] as [String : Any]//Jatayu
    
    let spaceShip5 = ["title":"Cassowary", "feature":"No Meteoroids", "price":"3000", "image":"alien3", "tag":5/*,"color":"Iron"*/] as [String : Any]//Arihant
    
    let spaceShip6 = ["title":"Goops", "feature":"Best Anti-G", "price":"5000", "image":"SpaceShip6.png", "tag":6/*,"color":"Licorice","label":"White"*/] as [String : Any]
    
    var spaceShips = [Dictionary<String,Any>]()
    
    let speedUp = ["title":"SpeedUp", "description":"Speeds up the game making you indestructible to any obstacles except meteoroids","price":"50","image":"SpeedUp.png"]
    let Magnet = ["title":"Magnet", "description":"Your SpaceShip's metal will be 'Magnitised' to attract Coins","price":"20","image":"magnet.png"]
    let PowerBullet = ["title":"No Meteor", "description":"No Meteoroid will come","price":"30","image":"POWER32.png"]
    
    var Powers = [Dictionary<String,String>]()
    
    @IBAction func spaceShipButton(_ sender: Any) {
        
        SpaceShipView.alpha = 1
        
        UIView.animate(withDuration: 1, animations: {
            
            self.SpaceShipView.center = CGPoint(x: self.SpaceShipView.center.x - 800, y: self.SpaceShipView.center.y)
            
         //   self.upperView.backgroundColor = UIColor(red: 253, green: 122, blue: 58, alpha: 1)
            
            })
        
        endViewOutlet.isHidden = false
        
        CoinBuyBut.isEnabled = false
        SpaceShipBut.isEnabled = false
        POwerOut.isEnabled = false
    }
    
    @IBOutlet var CoinBuyBut: UIButton!
    @IBOutlet var SpaceShipBut: UIButton!
    /* func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Opened reward based video ad.")
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad started playing.")
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad will leave application.")
    }
    
  
    
    let bundleID = "abhishekpatni.StarCrash"
    let Coins180 = RegisteredAppPurchase.Coins180
    let Coins440 = RegisteredAppPurchase.Coins440
    let Coins1200 = RegisteredAppPurchase.Coins1200
    */
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
        print("Reward based video ad failed to load.")
        print(error.localizedDescription)
    }
    
    @IBOutlet var adssssss: UIButton!
    @IBAction func addAds(_ sender: Any) {

        if rewardBasedVideo?.isReady == true {
            rewardBasedVideo?.present(fromRootViewController: self)
        } else {
//           UIAlertView(title: "Reward based video not ready",
//                        message: "The reward based video failed to load. Please try again later",
//                        delegate: self,
//                        cancelButtonTitle: "Done").show()
           
       self.present(alert.alertt(title: "Reward based video not ready", message: "The reward based video failed to load. Please try again later"), animated: true, completion: nil)
            
        }
        
    }
    
    @IBOutlet var Restore: UIButton!
    @IBAction func RestorePurchases(_ sender: Any) {
   
        SKPaymentQueue.default().restoreCompletedTransactions()
    
    }
  
    func createAd(){
     
        if  rewardBasedVideo?.isReady == false {
            rewardBasedVideo?.load(GADRequest(),
                                   withAdUnitID: "ca-app-pub-2667082459624928/7387666242")

        }
    }
    
    @IBOutlet var CoinsLabel: UILabel!
    @IBAction func coinbutton(_ sender: Any) {
        
        UIView.animate(withDuration: 1, animations: {
            
            self.CoinsView.center = CGPoint(x: self.CoinsView.center.x + 800, y: self.CoinsView.center.y)
            
            })
CoinsView.alpha = 1
    endViewOutlet.isHidden = false
      
      SpaceShipBut.isEnabled = false
        CoinBuyBut.isEnabled = false
    POwerOut.isEnabled = false
    }
 
    @IBOutlet var AnimationView1: UIView!
    @IBOutlet var endViewOutlet: UIButton!

    @IBAction func endView(_ sender: Any) {
 
        if CoinsView.alpha == 1{
            
        UIView.animate(withDuration: 1, animations: {
            
            self.CoinsView.alpha = 0
            
           self.CoinsView.center = CGPoint(x: self.CoinsView.center.x - 800, y: self.CoinsView.center.y)
            
            })
        
            endViewOutlet.isHidden = true
            
        }
     
        if SpaceShipView.alpha == 1{
            
            UIView.animate(withDuration: 1, animations: {
                
                self.SpaceShipView.alpha = 0
                
                self.SpaceShipView.center = CGPoint(x: self.SpaceShipView.center.x + 800, y: self.SpaceShipView.center.y)
                
                })
            
            endViewOutlet.isHidden = true
            
        }
        if PowerView.alpha == 1{
            
            UIView.animate(withDuration: 1, animations: {
                
                self.PowerView.alpha = 0
                
                self.PowerView.center = CGPoint(x: self.PowerView.center.x, y: self.PowerView.center.y + 800)
                
            })
            
            endViewOutlet.isHidden = true
            
        }
      SpaceShipBut.isEnabled = true
    CoinBuyBut.isEnabled = true
        POwerOut.isEnabled = true
    }
    @IBOutlet var normalView: UIView!

    @IBOutlet var removeAds: UIButton!
    @IBOutlet var CoinsView: UIView!

    @IBAction func button(_ sender: Any) {
        
         self.dismiss(animated: true, completion: nil)
        
    }

    
    @IBOutlet var label180: UILabel!
    
    @IBOutlet var but180: UIButton!
    @IBOutlet var but440: UIButton!
    @IBOutlet var but1200: UIButton!
    @IBOutlet var but3500: UIButton!
    
    @IBAction func RemoveAds(_ sender: Any) {
      
        if currentReachabilityStatus == .connected{
            if activeproduct.count > 0{
                
                let payment = SKPayment(product: activeproduct[1]!)//1
                SKPaymentQueue.default().add(payment)
                butTag = 5
            }else{
                
                self.present(alert.alertt(title: "No Products Found", message: "Please try again later"), animated: true, completion: nil)
            }
        }else{
           
            self.present( alert.alertt(title: "No Internet Connection", message: "Please connect to the internet"), animated: true, completion: nil)
        }
        }
    @IBAction func but180(_ sender: Any) {
    
        if currentReachabilityStatus == .connected{
        if activeproduct.count > 0{
            let payment = SKPayment(product: activeproduct[2]!)//2
           SKPaymentQueue.default().add(payment)
            butTag = 1
        }else{

            self.present(alert.alertt(title: "No Products Found", message: "Please try again later"), animated: true, completion: nil)
        }
        }else{
           
            self.present( alert.alertt(title: "No Internet Connection", message: "Please connect to the internet"), animated: true, completion: nil)
        }
       
    }
    
    @IBOutlet var label440: UILabel!
    @IBAction func but440(_ sender: Any) {

        if currentReachabilityStatus == .connected{
        if activeproduct.count > 0{
            
            let payment = SKPayment(product: activeproduct[3]!)
            SKPaymentQueue.default().add(payment)
                 butTag = 2
        }else{
            
            self.present(alert.alertt(title: "No Products Found", message: "Please try again later"), animated: true, completion: nil)
        }
        }else{
            
            self.present(alert.alertt(title: "No Internet Connection", message: "Please connect to the internet"), animated: true, completion: nil)
        }
        
    }

    @IBAction func but1200(_ sender: Any) {
        
  if currentReachabilityStatus == .connected{
         if activeproduct.count > 0{
         
         let payment = SKPayment(product: activeproduct[4]!)//4
         SKPaymentQueue.default().add(payment)
         butTag = 3
         }else{
            self.present(alert.alertt(title: "No Products Found", message: "Please try again later"), animated: true, completion: nil)
         }
         }else{
    
    self.present(alert.alertt(title: "No Internet Connection", message: "Please connect to the internet"), animated: true, completion: nil)
         }
        
    }

        
    @IBAction func but3500(_ sender: Any) {

        if currentReachabilityStatus == .connected{
            if activeproduct.count > 0{
                
                let payment = SKPayment(product: activeproduct[0]!)
                SKPaymentQueue.default().add(payment)
                butTag = 4
            }else{
                
                self.present(alert.alertt(title: "No Products Found", message: "Please try again later"), animated: true, completion: nil)
            }
        }else{
            
            self.present(alert.alertt(title: "No Internet Connection", message: "Please connect to the internet"), animated: true, completion: nil)
        }
       
        }

    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions{
            switch (transaction.transactionState){
            case.purchased:
             canExit = true
              self.dismiss(animated: true, completion: nil)
             
         self.present( alert.alertt(title: "Purchase Successful", message: "Thank you"), animated: true, completion: nil)
             SKPaymentQueue.default().finishTransaction(transaction)
            if butTag == 1{
                let new = 180
                let total = coins + new
                _ = UserDefaults.standard.set(total, forKey: "total")
                CoinsLabel.text = String(total)
                
                self.present(alert.alertt(title: "Congratulations", message: "You got 180 Coins"), animated: true, completion: nil)
            }else if butTag == 2{
                let new = 440
                let total = coins + new
                _ = UserDefaults.standard.set(total, forKey: "total")
                CoinsLabel.text = String(total)
            self.present(alert.alertt(title: "Congratulations", message: "You got 440 Coins"), animated: true, completion: nil)
            }else if butTag == 3{
                let new = 1200
                let total = coins + new
                _ = UserDefaults.standard.set(total, forKey: "total")
        CoinsLabel.text = String(total)
                self.present(alert.alertt(title: "Congratulations", message: "You got 1200 Coins"), animated: true, completion: nil)
            }else if butTag == 4{
                let new = 3500
                let total = coins + new
                _ = UserDefaults.standard.set(total, forKey: "total")
        CoinsLabel.text = String(total)
                self.present(alert.alertt(title: "Congratulations", message: "You got 3500 Coins"), animated: true, completion: nil)
            }else if butTag == 5{
                removeAds.isEnabled = false
                Restore.isEnabled = false
                UserDefaults.standard.set(true, forKey: "Hidden")
                _ = UserDefaults.standard.set(true, forKey: "purchased RAD")
                
                self.present(alert.alertt(title: "Congratulations", message: "Ads are now removed enjoy the ad free experience"), animated: true, completion: nil)
                }
              
            case .purchasing:
                canExit = false
                print("purchasing")
            case .failed:
                 canExit = true
   
                 SKPaymentQueue.default().finishTransaction(transaction)
                
self.present(alert.alertt(title:"Failed",message: "Payment failed because of an error please try again"), animated: true, completion: nil)
            case .restored:
               
                removeAds.isEnabled = false
                Restore.isEnabled = false
                UserDefaults.standard.set(true, forKey: "Hidden")
                _ = UserDefaults.standard.set(true, forKey: "purchased RAD")
                
                self.present(alert.alertt(title: "Good to see you again", message: "Your Purchases are restored"), animated: true, completion: nil)
                print("restored")
            case .deferred:
                //as
            print("defered")
            }
        }
        
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.activeproduct = response.products
        print("LOaded Products")
        for product in response.products{
            print(product.localizedTitle)
            label180.text = String(describing: response.products[2].price)
            label440.text =  String(describing: response.products[3].price)
            label1200.text =  String(describing: response.products[4].price)
            label3500.text =  String(describing: response.products[0].price)
    
            print("Activeproduct \(activeproduct)")
        }
        if activeproduct.count > 0{
        but180.isEnabled = true
        but440.isEnabled = true
        but1200.isEnabled = true
        but3500.isEnabled = true
        }
       
    }
    func getPurchaseInfo(){
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

 PlayingMusic = true
 //remove = false
        
        if let saved = UserDefaults.standard.object(forKey: "Hidden"){
            if saved as! Bool == true{
                removeAds.isEnabled = false
                Restore.isEnabled = false
            }
        }
        
        SKPaymentQueue.default().add(self)
        scrollView.delegate = self
        adssssss.isEnabled = false
      let productIDs: Set = ["abhishekpatni.StarCrash.Coins","abhishekpatni.StarCrash.Coins3","abhishekpatni.StarCrash.Coins4","abhishekpatni.Star.Crash.Coins5","abhishekpatni.Star.Crash.RemoveAds"]
        let productRequest = SKProductsRequest(productIdentifiers: productIDs)
 productRequest.delegate = self
        productRequest.start()
        
      rewardBasedVideo = GADRewardBasedVideoAd.sharedInstance()
        rewardBasedVideo?.delegate = self
       
        endViewOutlet.isHidden = true
  CoinsView.alpha = 0
        
        normalView.layer.cornerRadius = 20
        normalView.layer.masksToBounds = true
        

        
        // Do any additional setup after loading the view.
    
    // set up scroll
        
      spaceShips = [spaceShip1,spaceShip2,spaceShip3,spaceShip4,spaceShip5,spaceShip6]
        Powers = [speedUp,Magnet,PowerBullet]
        
        scrollView.isPagingEnabled = false
        scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * CGFloat(spaceShips.count), height: self.scrollView.bounds.size.height - 20)
        scrollView.showsHorizontalScrollIndicator = false
       
        PowerScroll.isPagingEnabled = false
        PowerScroll.contentSize = CGSize(width: self.PowerScroll.frame.size.width * CGFloat(Powers.count), height: self.PowerScroll.bounds.size.height - 20)
        PowerScroll.showsHorizontalScrollIndicator = false
        
        loadSpaceShips()
        loadPowerUps()
        
    }

  func loadSpaceShips(){
    
    for (index, spaceShip) in spaceShips.enumerated(){
        
        if let currentview = Bundle.main.loadNibNamed("SpaceShipViews", owner: self, options: nil)?.first as? SpaceShips{
            currentview.viewDIdLoad()
            currentview.spaceShip.image = UIImage(named: spaceShip["image"]! as! String)
            currentview.Shipname.text = spaceShip["title"] as? String
            currentview.bulletFeature.text = spaceShip["feature"] as? String
            
            let but = currentview.ownSpaceShip
            but?.setTitle("Get", for: UIControlState.normal)
            
            tagg = index
            currentview.ownSpaceShip.tag = index
           currentview.ownSpaceShip.addTarget(self, action: #selector(reload), for: .touchUpInside)
       
           currentview.frame.size.width = self.scrollView.bounds.size.width
     //   currentview.autoresizingMask = [.flexibleHeight,.flexibleWidth]
         //   currentview.frame.size.height = self.scrollView.bounds.size.height
            currentview.frame.origin.x = CGFloat(index) * self.scrollView.frame.size.width
            currentview.spacePrice.text = spaceShip["price"] as? String
                scrollView.addSubview(currentview)
      
        }
    }
    
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        SKPaymentQueue.default().remove(self)
    }
    
    func  loadPowerUps(){
        for(index, powers) in Powers.enumerated(){
            
            if let powerFile = Bundle.main.loadNibNamed("PowerUps", owner: self, options: nil)?.first as? PowersView{
                powerFile.PowerImage.image = UIImage(named: powers["image"]!)
                powerFile.Name.text = powers["title"]
                powerFile.Description.text = powers["description"]
    powerFile.BuyOutlet.setTitle(powers["price"], for: UIControlState.normal)
            powerFile.BuyOutlet.tag = index
                powerFile.frame.size.width = self.PowerScroll.bounds.size.width
                //   powerFile.autoresizingMask = [.flexibleHeight,.flexibleWidth]
                powerFile.frame.size.height = self.PowerScroll.bounds.size.height
                powerFile.frame.origin.x = CGFloat(index) * self.PowerScroll.frame.size.width
                powerFile.BuyOutlet.addTarget(self, action: #selector(reload), for: .touchUpInside)
                PowerScroll.addSubview(powerFile)
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet var label1200: UILabel!
    
    @IBOutlet var label3500: UILabel!
    @objc func reload(){
        
        let total = UserDefaults.standard.object(forKey: "total")
        
        if total == nil{
            
            let current = UserDefaults.standard.object(forKey: "coin")
            
            if current != nil{
                
                _ = UserDefaults.standard.set(current, forKey: "total")
                
                let val = current as! String
                
                CoinsLabel.text = val
                
            }else{
                
                CoinsLabel.text = String(0)
                
            }
            
        }else{
            
            let current = UserDefaults.standard.integer(forKey: "coin")
            
            let value = UserDefaults.standard.integer(forKey: "total")
            
            let cur = current
            
            let val = value
            
            let tot = Int(Int(val) + Int(cur))
            
            CoinsLabel.text = String(tot)
            
            _ = UserDefaults.standard.set(tot, forKey: "total")
            
            let makeCurrent0 = 0
            
            _ = UserDefaults.standard.set(makeCurrent0, forKey: "coin")
            
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewDidAppear(_ animated: Bool) {
        
        let total = UserDefaults.standard.object(forKey: "total")
        
        if total == nil{
            
            let current = UserDefaults.standard.object(forKey: "coin")
            
            if current != nil{
                
                _ = UserDefaults.standard.set(current, forKey: "total")
                
                let val = current as! String
                
                CoinsLabel.text = val
                
            }else{
                
                CoinsLabel.text = String(0)
                
            }
            
            
        }else{
            
            let current = UserDefaults.standard.integer(forKey: "coin")
            
            let value = UserDefaults.standard.integer(forKey: "total")
            
            let cur = current
            
            let val = value
            
            let tot = Int(Int(val) + Int(cur))
            
            CoinsLabel.text = String(tot)
            
            _ = UserDefaults.standard.set(tot, forKey: "total")
            
            let makeCurrent0 = 0
            
            _ = UserDefaults.standard.set(makeCurrent0, forKey: "coin")
            
        }
}
    
   /* func getInfo(purchase:RegisteredAppPurchase){
        
        NetworkIndicatorManager.NetworkOperationStarted()
        SwiftyStoreKit.retrieveProductsInfo([bundleID + "." + purchase.rawValue], completion: {
            
            result in
          NetworkIndicatorManager.NetworkOperationFinished()
            
            self.showAlert(alert: self.alertForProductRetrieveInfo(result: result))
            
        })
        
    }
    
    func purchase(purchase:RegisteredAppPurchase){
        
        NetworkIndicatorManager.NetworkOperationStarted()
        SwiftyStoreKit.purchaseProduct(bundleID + "." + purchase.rawValue, completion: {
            
            result in
            
            NetworkIndicatorManager.NetworkOperationFinished()
            
            if case .success(let product) = result {
                
                if product.needsFinishTransaction{
                    
                    SwiftyStoreKit.finishTransaction(product.transaction)
                    
                }
                
         
                
            }
            
        })
        
    }
    
    func restorePurchases(){
        
        NetworkIndicatorManager.NetworkOperationStarted()
        SwiftyStoreKit.restorePurchases(atomically: true, completion: {
            
            result in
            
            NetworkIndicatorManager.NetworkOperationFinished()
            
        })
        
    }

    func VerifyReciept(){
        
        NetworkIndicatorManager.NetworkOperationStarted()
        SwiftyStoreKit.verifyReceipt(using: ReceiptInfo() as! ReceiptValidator, password: sharedSecret, completion: {
            
            result in
            NetworkIndicatorManager.NetworkOperationFinished()
        })
        
    }
    
    func VerifyPurchase(){
        
        NetworkIndicatorManager.NetworkOperationStarted()
        SwiftyStoreKit.verifyReceipt(using: ReceiptInfo() as! ReceiptValidator, password: sharedSecret, completion: {
            
            result in
            
        })
        
    }
    
}

extension ShopViewController {
    
    func alertWithTitle(title:String, message:String) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))

        return alert
        
    }
    
    func showAlert(alert:UIAlertController){
        
        guard let _ = self.presentedViewController else {
            
            self.present(alert, animated: true, completion: nil)
         
            return 
            
        }
        
    }
    
    func alertForProductRetrieveInfo(result: RetrieveResults) -> UIAlertController{
        
        if let product = result.retrievedProducts.first {
            
         let price = product.localizedPrice!
            
            return alertWithTitle(title: product.localizedTitle, message: "\(product.localizedDescription) - \(price)")
            
        }else if let invalidProductID = result.invalidProductIDs.first{
            
            return alertWithTitle(title: "Could not retrieve Product info", message: "Invalid product Indetifier\(invalidProductID)")
            
        }else{
            
            let error = result.error?.localizedDƒescription ?? "Unknown Error Please contact support"
          return alertWithTitle(title: "Could not retrieve Product info", message: error)
     
        }
        
        func alertForPurchaseResult(result: PurchaseResult) -> UIAlertController{
            
            switch result {
            case .success(let product): print("purchase Success \(product.productId)")
             
                return alertWithTitle(title: "Thank You", message: "Purchase Successfull")
            case .error(let error ):
                print("Purchase Failed \(error)")
               
                switch error.code {
                    
                case .unknown: return alertWithTitle(title: "Purchase Error", message: "Unknown error. Please contact support")
                case .clientInvalid: return alertWithTitle(title: "Purchase Error", message: "Not allowed to make the payment")
                case .paymentCancelled: return alertWithTitle(title: "Payment Cancelled", message: "Payment Cancelled")
                case .paymentInvalid: return alertWithTitle(title: "Purchase Error", message: "The purchase identifier was invalid")
                case .paymentNotAllowed: return alertWithTitle(title: "Purchase Error", message: "The device is not allowed to make the payment")
                case .storeProductNotAvailable: return alertWithTitle(title: "Purchase Error", message: "The product is not available in the current storefront")
                case .cloudServicePermissionDenied: return alertWithTitle(title: "Purchase Error", message: "Access to cloud service information is not allowed")
                case .cloudServiceNetworkConnectionFailed: return alertWithTitle(title: "Purchase Error", message: "Could not connect to the network")
                default: return alertWithTitle(title: "Purchase Error", message: "Unknown error")
                    
                    
                }
                }
                
            }
        
        func alertForRestorePurchases(result: RestoreResults) -> UIAlertController{
            
            
            if result.restoredPurchases.count > 0{
                
                
                
            }
            
        }
        
        }*/
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        pagecontrol.currentPage = Int(page)
    }

    override func viewWillAppear(_ animated: Bool) {
        let save = UserDefaults.standard.value(forKey: "purchased RAD")
        if save == nil{
            
             createAd()
       }else{
 print("Purchased RAD")
        }
        
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if #available(iOS 11.0, *) {
            if let window = view.window {
                view.frame = window.safeAreaLayoutGuide.layoutFrame
                
            }
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        
        
        
    }
}

