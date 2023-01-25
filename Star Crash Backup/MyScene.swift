//
//  MyScene.swift
//  Star Crash
//
//  Created by Shubh Patni on 30/08/17.
//  Copyright © 2017 Abhishek Patni. All rights reserved.
//

import SpriteKit
import GameplayKit

class MyScene: SKScene {
    var Shop = SKLabelNode()
    var starFiled = SKEmitterNode()
    var cross = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        //view.backgroundColor =  UIColor(red: 26, green: 17, blue: 16, alpha: 1)
        
        starFiled = SKEmitterNode(fileNamed: "Starfield.sks")!
        
        starFiled.zRotation = 4.7
        
        starFiled.position = CGPoint(x: self.frame.midX + self.frame.width / 2 , y: self.frame.midY)
        
        starFiled.advanceSimulationTime(15)
        
        Shop.position = CGPoint(x: self.frame.midX , y: self.frame.midY + self.frame.height / 2 - 50)
        
        Shop.text = "Shop"
        
        Shop.fontSize = 50
        
        self.addChild(Shop)
        
       self.addChild(starFiled)
        
    
        
        cross = SKSpriteNode(texture: SKTexture(imageNamed: "Cross.png"))
        
        cross.position = CGPoint(x: self.frame.midX - self.frame.width / 2 + 25, y: self.frame.midY + self.frame.height / 2 - 25)
        
        cross.setScale(0.4)
        
        cross.alpha = 2
        
        self.addChild(cross)
        
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self){
            
           let nodeTouched = self.nodes(at: location)
         
            if nodeTouched.first == cross {
                
                let transittion = SKTransition.fade(withDuration: 0.5)
                
                let gameScene = homeScene(size: self.size)
                
                self.view?.presentScene(gameScene, transition: transittion)
                
            }
            
        }
        
    }
    
}

