//
//  GameViewController.swift
//  Star Crash
//

import UIKit
import SpriteKit
import GameplayKit
import GoogleMobileAds
import Social
    var canAccess = false
var showadvertisement = false
var adisShoen = false
class GameViewController: UIViewController, GADInterstitialDelegate{

    var interstitial2:GADInterstitial!
    var interstitialAd:GADInterstitial!
    @IBOutlet var button: UIButton!
  var alert = Alert()
    func createInterstitialAd() -> GADInterstitial{
        let request = GADRequest()
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-2667082459624928/3097893797")
        
        interstitial.delegate = self
    interstitial.load(request)
        return interstitial
        
    }
    func createInterstitialAd2() -> GADInterstitial{
      
        let request2 = GADRequest()
        let interstitial2 = GADInterstitial(adUnitID: "ca-app-pub-2667082459624928/3644688702")
        interstitial2.delegate = self
        interstitial2.load(request2)
        return interstitial2
    }
    
    private func interstitialWillDismissScreen(ad: GADInterstitial) {
        interstitialAd = createInterstitialAd()
        interstitial2 = createInterstitialAd2()
    }

    func showAd2(){
        let save = UserDefaults.standard.value(forKey: "purchased RAD")
        if save == nil{
    let randomNumber2 = arc4random() % 4
        if randomNumber2 == 0 || randomNumber2 == 3{
            if interstitial2.isReady{
                interstitialAd.present(fromRootViewController: self)
            }
        }
    }
    }
    
    @objc func showAd() {
        let save = UserDefaults.standard.value(forKey: "purchased RAD")
        if save == nil{
            
        let randomNumber = arc4random() % 5
        if randomNumber == 1 || randomNumber == 2{
            if interstitialAd!.isReady{
                interstitialAd?.present(fromRootViewController: self)
            print("randomNumber\(randomNumber)")
            }
            else {
                
            }
        }else{
            print("randomNumber\(randomNumber)")
        }
          showadvertisement = false
        }else{
            //do nothing
        }
    }


    @IBOutlet var button2: UIButton!
    let image = UIImage(named: "StarCrashMarketing.png")
    @IBAction func Share(_ sender: Any) {
    
        if interstitial2 != nil{
            showAd2()
        }else{
            print("not ready")
        }
        
        if let ImageView = Bundle.main.loadNibNamed("Share", owner: self, options: nil)?.first as? ShareImageView{
    
            if let val = UserDefaults.standard.string(forKey: "Record"){
            ImageView.LabelLightYears.text = "I Travelled \(val) Light Years"
            
            UIGraphicsBeginImageContext(view.frame.size)
            (ImageView as AnyObject).layer.render(in: UIGraphicsGetCurrentContext()!)
                guard let imageofScreen = UIGraphicsGetImageFromCurrentImageContext() else {return}
            UIGraphicsEndImageContext()
            print("Image Taken")
            
                let activityViewControllet = UIActivityViewController(activityItems: [imageofScreen], applicationActivities: nil)
            activityViewControllet.popoverPresentationController?.sourceView = self.view
            self.present(activityViewControllet, animated: true, completion: nil)
                
            }else{
                
                self.present(alert.alertt(title: "No Value Found", message: "Please Travel some distance to share it"), animated: true, completion: nil)
            }
        }
        
     /*   if let value = UserDefaults.standard.value(forKey: "Record"){
            
            let shareActionSheet = UIAlertController(title: nil, message: "Share with", preferredStyle: .actionSheet)
            let twitterShareAction = UIAlertAction(title: "Twitter", style: .default, handler: { (action) in
                
                if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
                    let twitter = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                    twitter?.add(self.imageofScreen)
                    twitter?.setInitialText("My highest Distance Traveled was \(String(describing: value)) Light Years! Can You Beat Me???")
                    self.present(twitter!, animated: true, completion: nil)
                    
                }else{
                    
        self.alert(title: "Twitter Unavailable", message: "Please sign in to your Twitter account")
                }
                
            })
            
            let FaceBookShareAction = UIAlertAction(title: "FaceBook", style: .default, handler: { (action) in
                
                if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
                    let FaceBook = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                    FaceBook?.add(self.imageofScreen)
                    FaceBook?.setInitialText("My highest Distance Traveled was \(String(describing: value)) Light Years! Can You Beat Me???")
                    self.present(FaceBook!, animated: true, completion: nil)
                    print("FaceBook")
                }else{
                     self.alert(title: "Facebook Unavailable", message: "Please sign in to your Facebook account")
                }
                
            })
            
            let CancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            shareActionSheet.addAction(twitterShareAction)
            shareActionSheet.addAction(FaceBookShareAction)
            shareActionSheet.addAction(CancelAction)
            
            self.present(shareActionSheet, animated: true, completion: nil)
            
         
        }
 */
       
 }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        if currentReachabilityStatus == .connected{
            IAPService.shared.getProducts()
        }
           interstitial2 = createInterstitialAd2()
view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        
        if UserDefaults.standard.array(forKey: "SavedCollection")?.count == 0 || UserDefaults.standard.array(forKey: "SavedCollection") == nil {
            print("Trying")
            let coll = [1]
            _ = UserDefaults.standard.set(coll, forKey: "SavedCollection")
            
            let onlyBool = true
            _ = UserDefaults.standard.set(onlyBool, forKey: "CanBuy")
        }

        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            
            if let scene = GameScene(fileNamed: "homeScene") {
                // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit
                
                // Present the scene
        
            //    scene.viewController = self
                
                view.presentScene(scene)
            }
            
        }
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(check), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(createAd), userInfo: nil, repeats: true)
 }
    
    @IBOutlet var button3: UIButton!
    @objc func check(){
        
        if canAccess == true{
            
            button.isHidden = false
            button2.isHidden = false
            button3.isHidden = false
        }else{
            button3.isHidden = true
            button.isHidden = true
            button2.isHidden = true
        }
        
    }
    @objc func createAd(){
        if showadvertisement == true && adisShoen == true{
            showAd()
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
     
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let save = UserDefaults.standard.value(forKey: "purchased RAD")
        if save == nil{
            
            interstitialAd = createInterstitialAd()

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
 
}
