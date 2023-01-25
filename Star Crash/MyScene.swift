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
   
    var background = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
      let image = SKTexture(imageNamed: "SUPERNOVA4.jpg")
        
        background = SKSpriteNode(texture: image)
        
        background.zPosition = -1
        
        background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        self.addChild(background)
        
    }
}
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
       
        
        }
    
}

