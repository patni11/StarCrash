//
//  homeScene.swift
//  Star Crash
//
//  Created by Shubh Patni on 31/07/17.
//  Copyright © 2017 Abhishek Patni. All rights reserved.
//

import SpriteKit
import GameplayKit
import Social
var home = 1

class homeScene: SKScene{
                    var viewController = UIViewController()
    var starfield:SKEmitterNode!
    var play:SKSpriteNode!
    var shop:SKSpriteNode!
    var share:SKSpriteNode!
    var highScore:SKLabelNode!
    var Coins:SKLabelNode!
        var View:SKSpriteNode!
     var twitter:SKSpriteNode!
    var facebook:SKSpriteNode!
    var gmail:SKSpriteNode!
    var sharehigh:SKLabelNode!
    var CoinsNode:SKSpriteNode!
    override func didMove(to view: SKView) {
        
       CoinsNode = self.childNode(withName: "coinsnode") as! SKSpriteNode
        facebook = self.childNode(withName: "facebook") as! SKSpriteNode
               twitter = self.childNode(withName: "twitter") as! SKSpriteNode
              View = self.childNode(withName: "View") as! SKSpriteNode
       gmail = self.childNode(withName: "google") as! SKSpriteNode
        
        starfield = self.childNode(withName: "starfield") as! SKEmitterNode
        starfield.advanceSimulationTime(20)
        
        play = self.childNode(withName: "play") as! SKSpriteNode
        shop = self.childNode(withName: "shop") as! SKSpriteNode
        share = self.childNode(withName: "share") as! SKSpriteNode

               sharehigh = self.childNode(withName: "sharehigh") as! SKLabelNode
        highScore = self.childNode(withName: "highScore") as! SKLabelNode
        Coins = self.childNode(withName: "Coins")as! SKLabelNode
        let userDefaults = Foundation.UserDefaults.standard
       
        if let value = userDefaults.string(forKey: "Record"){
        
        highScore.text = "HighScore:- \(value)"
     
        
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
                
                if let view = self.view {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = GameScene(fileNamed: "GameScene") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFill
                        
                        // Present the scene

                        view.presentScene(scene, transition: SKTransition.crossFade(withDuration: 1))
                    }
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true
                }

                
                
            }else if nodeTouched.first?.name == "share"{
            
let animate = SKAction.fadeAlpha(to: 1, duration: 0.5)
                
              gmail.zPosition = 2
                facebook.zPosition = 2
                twitter.zPosition = 2
                sharehigh.zPosition = 2
                gmail.run(animate)
                facebook.run(animate)
                View.run(animate)
                twitter.run(animate)
                sharehigh.run(animate)
          starfield.zPosition = 1.5
                View.zPosition = 1
                
                if nodeTouched.first?.name == "facebook"{
                    
                    
                }
                
            } else if nodeTouched.first?.name == "shop" {

                let transittion = SKTransition.flipVertical(withDuration: 0.5)
                
               let gameScene = MyScene(size: self.size)
               
                self.view?.presentScene(gameScene, transition: transittion)
                
            } else if nodeTouched.first?.name != "facebook" && nodeTouched.first?.name != "gmail" && nodeTouched.first?.name != "twitter" {
                
                let animate = SKAction.fadeAlpha(to: 0, duration: 0.5)
                
                gmail.run(animate)
                facebook.run(animate)
                View.run(animate)
                twitter.run(animate)
                sharehigh.run(animate)
                
            }
          
        }
        
    }
 
    
}
