////
////  ShareViewController.swift
////  Star Crash
////

//
//import UIKit
//import Social
//import GoogleMobileAds
//
//class ShareViewController: UIViewController, GADInterstitialDelegate {
//var alert = Alert()
//    var showADS = true
//    let randomNumber = arc4random() % 2
//    
//var interstitialAd :GADInterstitial!
//    
//        @IBAction func faceBook(_ sender: Any) {
//        
//        faceBookFunc()
//        
//    }
//   
//    func createInterstitialAd() -> GADInterstitial{
//        let request = GADRequest()
//        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/1033173712")
//       //request.testDevices = @[ kGADSimulatorID ]
//        
//        interstitial.delegate = self
//        interstitial.load(request)
//        
//        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(presentAd), userInfo: nil, repeats: false)
//        
//        return interstitial
//        
//    }
//    
//    func ShowAd(){
//        
//        if interstitialAd.isReady{
//            
//            interstitialAd.present(fromRootViewController: self)
//            showADS = false
//            
//        }else{
//            print("din't recieve any ads from share")
//        }
//        
//    }
//    
//    @objc func presentAd(){
//        
//        if randomNumber == 1 && showADS == true {
//            ShowAd()
//        }else{
//            // do nothing
//        }
//        
//    }
//    
//    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
//        
//        interstitialAd = createInterstitialAd()
//        
//    }
//    
//    @IBAction func shop(_ sender: Any) {
//        
//        self.dismiss(animated: true, completion: nil)
//        
//    }
//    @IBAction func twitter(_ sender: Any) {
//    
//        Twitter()
//        
//    }
//    
//    @IBAction func linkedin(_ sender: Any) {
//   
//        Linkedin()
//        
//    }
//    
//    @IBOutlet var highScore: UILabel!
//    @IBOutlet var xview: UIView!
//    @IBAction func button(_ sender: Any) {
//        
//        self.dismiss(animated: true, completion: nil)
//        
//    }
//    
//       override func viewDidLoad() {
//        super.viewDidLoad()
//
//        interstitialAd = createInterstitialAd()
//        
//        print(randomNumber)
//        
//        // Do any additional setup after loading the view.
//        
//      xview.layer.cornerRadius = 10
//        xview.layer.masksToBounds = true
//     
//        let userDefaults = Foundation.UserDefaults.standard
//        
//        if let value = userDefaults.string(forKey: "Record"){
//            
//            highScore.text = "HighScore:- \(value)"
//            
//        }
//
//        
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
//
