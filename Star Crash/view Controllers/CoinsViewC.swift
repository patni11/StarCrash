//
//  CoinsViewC.swift
//  Star Crash
//

import UIKit
import GoogleMobileAds
class CoinsViewC: UIView {

    var adsState = UserDefaults.standard.set(true, forKey: "adsState")
    var timer = Timer()
    var rewardBasedVideo: GADRewardBasedVideoAd?
    let coins = UserDefaults.standard.integer(forKey: "total")
   @objc func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
        
        let new = 30
        let total = coins + new
        _ = UserDefaults.standard.set(total, forKey: "total")
        _ = UserDefaults.standard.set(false, forKey: "adsState")
        
        
    }
    
    
   @objc func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad is closed.")
        
        
    }
    
    
    @IBOutlet var BuyBut: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var DescriptionLabel: UILabel!
    @IBOutlet var CoinImage: UIImageView!

    @IBAction func buyButton(_ sender: Any) {
        
        if BuyBut.tag == 0{
            
            print("Ad")
            if rewardBasedVideo?.isReady == true {
                rewardBasedVideo?.present(fromRootViewController: ShopViewController())
            } else {
                UIAlertView(title: "Reward based video not ready",
                            message: "The reward based video didn't finish loading or failed to load",
                            delegate: self,
                            cancelButtonTitle: "Done").show()
    
            }
            
        }else if  BuyBut.tag == 1{
            
            print("180")
            
        }else if  BuyBut.tag == 2{
            
            print("440")
            
        }else if  BuyBut.tag == 3{
            
            print("1200")
            
        }else if  BuyBut.tag == 4{
            
            print("3500")
            
        }
        
    }
    
   @objc func createAd(){
        
        if  rewardBasedVideo?.isReady == false {
            rewardBasedVideo?.load(GADRequest(),
                                   withAdUnitID: /*"ca-app-pub-2667082459624928/3644688702"*/"ca-app-pub-3940256099942544/1712485313")
            
        }
    }
    
    func viewDidLoad(){
        
        rewardBasedVideo = GADRewardBasedVideoAd.sharedInstance()
        rewardBasedVideo?.delegate = self as? GADRewardBasedVideoAdDelegate
        
    }
     func viewWillAppear() {
        let save = UserDefaults.standard.value(forKey: "purchased RAD")
        if save == nil{
            
            createAd()
        }else{
            print("Purchased RAD")
        }
        
    }
    
}
