//
//  GameScene.swift
//  Star Crash
//
//  Created by Shubh Patni on 06/07/17.
//  Copyright © 2017 Abhishek Patni. All rights reserved.
//


import SpriteKit
import GameplayKit


class GameScene: SKScene, SKPhysicsContactDelegate {
    
  //  var vc: UIViewController = UIViewController()

    var slowMoCounter = 0
    var slowMopowerup = false
    var slowMo = SKSpriteNode()
    var magnetCounter = 0
    var currentPowerUp = SKSpriteNode()
    var gameStarted = false
    var gameHasStarted = false
    var BlinkCounter = 0
    var speedUPCOUNTER = 0
    var speedUp = SKSpriteNode()
    var counterForSpeedUp = 0
   var viewController: UIViewController!
    var starfield:SKEmitterNode!
    var coins = SKSpriteNode()
    var speedpipes:TimeInterval = 0
    var movementAmountreduction = 0
    var coinsImage = SKSpriteNode()
    var spaceShip = SKSpriteNode()
    var labelCoins = SKLabelNode()
    var ground = SKSpriteNode()
    var pipe = SKSpriteNode()
 var pipe2 = SKSpriteNode()
    var gameState = false
    var timer = Timer()
 var gameIsOver = false
var scoreLabel = SKLabelNode()
    var score:Int = 0
    var antigravityEnabled = true
    var sky = SKNode()
  var antiGravity = SKSpriteNode()
    var gravityNode:SKSpriteNode!
    var highScore:Int = 0
    var saveScore = 0
    var recordData:String!
    var newCoins = Int()
    var firstBody:SKPhysicsBody!
    var secondBody:SKPhysicsBody!
    var firBody:SKPhysicsBody!
    var secBody:SKPhysicsBody!
 var math:String!
var numberOfCoins = Int()
    var recordedCoins:String!
    var SavedCoins = 0
    var timeInter = Int()
    var lowVal:TimeInterval = 0
    var ground2 = SKSpriteNode()
  var gravity = true
    var magnet = SKSpriteNode()
    var scoreIsenabled = false
                let spaceShipTexture2 = SKTexture(imageNamed: "Component (23).png")
    let groundtexture2 = SKTexture(imageNamed: "Component (24)ground.png")
   // var touched = false
    
    enum ColliderType: UInt32{
        
        case spaceShip = 1
        case object = 2
        case points = 4
        case speedUp = 8
        
    }
    
     var spaceShipTexture = SKTexture(imageNamed: "Component (2).png")
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = .black
      
        let userdefaults = Foundation.UserDefaults.standard
     let val =  userdefaults.string(forKey: "Record")
        recordData = val
        
                    let texture = SKTexture(imageNamed: "Component (26).png")
        
        antiGravity = SKSpriteNode(texture: texture)
        
        antiGravity.position = CGPoint(x: self.frame.midX, y: self.frame.midY)

        self.addChild(antiGravity)
        
        let gravityTexture = SKTexture(imageNamed: "Component-2.png")
        
        gravityNode = SKSpriteNode(texture: gravityTexture)
        
         gravityNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        self.addChild(gravityNode)
        
        gravityNode.isHidden = true
        
        antiGravity.isHidden = true
        
        if gameIsOver == false{
            
                  self.physicsWorld.contactDelegate = self
            
            starfield = SKEmitterNode(fileNamed: "Starfield.sks")
            
            starfield.position = CGPoint(x: self.frame.midX + self.frame.width / 2 , y: self.frame.midY)
            
            starfield.zPosition = -5
            
            starfield.zRotation = 4.7
            
            starfield.advanceSimulationTime(10)
            
            self.addChild(starfield)
            
            spaceShip = SKSpriteNode(texture: spaceShipTexture)
            
            spaceShip.position = CGPoint(x: self.frame.midX - self.frame.width / 2 + spaceShip.size.width / 6, y: self.frame.midY)
            
            spaceShip.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: spaceShipTexture.size().width , height: spaceShipTexture.size().height / 2))
            
            //  spaceShip.physicsBody = SKPhysicsBody(texture: spaceShipTexture, size: spaceShipTexture.size())
            
            spaceShip.physicsBody?.isDynamic = true
            
            spaceShip.setScale(0.3)
            
            spaceShip.physicsBody?.isDynamic = false
            
            spaceShip.physicsBody?.contactTestBitMask = ColliderType.object.rawValue
            spaceShip.physicsBody?.categoryBitMask = ColliderType.spaceShip.rawValue
            spaceShip.physicsBody?.collisionBitMask = ColliderType.spaceShip.rawValue
            spaceShip.physicsBody?.allowsRotation = false
            
            self.addChild(spaceShip)
            
        }else{
            
        
            
        }
                          }
    
    func setupgame(){
        
        if gameStarted == true{
        
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(addcoins), userInfo: nil, repeats: true)
            
            let randomForSpeedUp = GKRandomDistribution(lowestValue: 5, highestValue: 10)
            
            let randomForspeedup = TimeInterval(randomForSpeedUp.nextInt())
            
            Timer.scheduledTimer(timeInterval: randomForspeedup, target: self, selector: #selector(addPowerUps), userInfo: nil, repeats: true)
            
        Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(increaseScore), userInfo: nil, repeats: true)
        
        let timeIntervalToMakePipe = GKRandomDistribution(lowestValue: Int(3), highestValue: Int(4))
        
        let timeIntervToMakePipe = timeIntervalToMakePipe.nextInt()
        
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(timeIntervToMakePipe - Int(lowVal)), target: self, selector: #selector(self.makePipes), userInfo: nil, repeats: true)
        
              /////////SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE ///////////
   

        
        scoreLabel.text = "Score: 0"
        scoreLabel.position = CGPoint(x: self.frame.midX + self.frame.width / 2 - CGFloat(scoreLabel.frame.width
            ), y: self.frame.midY + self.frame.height / 2 - scoreLabel.frame.height)
        scoreLabel.fontColor = .yellow
        scoreLabel.fontName = "MarkerFelt-Thin"
        self.addChild(scoreLabel)
       
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
               // MOVING BACKGROUND MOVING BACKGROUND MOVING BACKGROUNDMOVING BACKGROUND MOVING BACKGROUND MOVING BACKGROUND
        
        let groundTexture = SKTexture(imageNamed: "Component (4).png")
        
        let moveGround = SKAction.move(by: CGVector(dx: -groundTexture.size().width, dy: 0), duration: 5)
        
        let shiftGround = SKAction.move(by: CGVector(dx: groundTexture.size().width, dy: 0), duration: 0)
        
        let moveBackgroundLatForveer = SKAction.repeatForever(SKAction.sequence([moveGround, shiftGround]))
        
        var i: CGFloat = 0
        
        while i < 3{
            
            ground = SKSpriteNode(texture: groundTexture)
            
            ground.position = CGPoint(x: groundTexture.size().width * i, y: self.frame.midY - 180)
            
            ground.run(moveBackgroundLatForveer)
            
            ground.zPosition = -1
            
          //  ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: groundTexture.size().height / 2))
            
            ground.physicsBody = SKPhysicsBody(texture: groundTexture, size: CGSize(width: groundTexture.size().width, height: groundTexture.size().height / 1.5))
            
            ground.physicsBody?.isDynamic = false
            
            
            
            ground.physicsBody?.contactTestBitMask = ColliderType.object.rawValue
            ground.physicsBody?.categoryBitMask = ColliderType.object.rawValue
           ground.physicsBody?.collisionBitMask = ColliderType.object.rawValue
            
            ground.physicsBody?.friction = 0
            
            self.addChild(ground)
            
            i += 1
        }
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////
        
        sky.position = CGPoint(x: self.frame.midX , y: self.frame.midY + 190)
        sky.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width * 10, height: 15))
        sky.physicsBody?.isDynamic = false
        sky.physicsBody?.categoryBitMask = ColliderType.spaceShip.rawValue
        
        sky.physicsBody?.friction = 0
        
        self.addChild(sky)
        
        labelCoins.fontSize = 40
        
        labelCoins.fontColor = .yellow
        
        labelCoins.text = "0"
        
        labelCoins.position = CGPoint(x: self.frame.midX, y: self.frame.midY + self.frame.height / 2 - labelCoins.frame.height)
        
        self.addChild(labelCoins)
        
        let coinsTexture = SKTexture(imageNamed: "Component (6).png")
        
        coinsImage = SKSpriteNode(texture: coinsTexture)
        
        coinsImage.setScale(0.1)
        
        coinsImage.position = CGPoint(x: self.frame.midX - labelCoins.frame.width * 2 , y: self.frame.midY + self.frame.height / 2 - labelCoins.frame.height / 2)
        
        self.addChild(coinsImage)
        
       let timeIntr = GKRandomDistribution(lowestValue: 5, highestValue: 15)
        
        let inter = TimeInterval(timeIntr.nextInt())
        
        _ = Timer.scheduledTimer(timeInterval: inter, target: self, selector: #selector(self.isItAnti), userInfo: nil, repeats: true)
     
    }
    }
    
    func makePipes(){
        
        if slowMopowerup == false{
        
        speedpipes += 0.02
        
        lowVal += 0.3
        
        ///////////PIPES PIPES PIPES PIPES PIPES PIPES PIPES PIPES PIPES PIPES PIPES ///////////////
        
        let randomheightOfpipe = GKRandomDistribution(lowestValue: 30, highestValue: 80)
        
        let randomYpositionOfPipe2 = CGFloat(randomheightOfpipe.nextInt())
        
        let gapBetween = GKRandomDistribution(lowestValue: Int(spaceShip.size.width * 2), highestValue: Int(spaceShip.size.width * 4))
        
        let changepositionOfPipe2 = CGFloat(gapBetween.nextInt())
        
                  let moveObstacles = SKAction.move(by: CGVector(dx: -2 * self.frame.width , dy: 0), duration: TimeInterval(self.frame.width / 150 - CGFloat(speedpipes)))
            
            let movementAmount = CGFloat(arc4random() % UInt32(self.frame.height / 8))
            
            // let pipeOffset = CGFloat(movementAmount) - self.frame.height / 4
            
            let gapHeight = spaceShip.size.height + 20
            
            let pipeTexture = SKTexture(imageNamed: "Component (14).png")
            
            let pipeTexture2 = SKTexture(imageNamed: "Component (13).png")
            
            pipe = SKSpriteNode(texture: pipeTexture)
            
            let amount =  self.frame.midY + pipeTexture.size().height / 2.5 - movementAmount / 2  + gapHeight / 2
            
            pipe.position = CGPoint(x: self.frame.midX + self.frame.width / 2 , y: amount + randomYpositionOfPipe2)

     //pipe.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: pipeTexture.size().width / 2 - 20 , height: pipeTexture.size().height))
       
        pipe.physicsBody = SKPhysicsBody(texture: pipeTexture, size: CGSize(width: pipeTexture.size().width / 2, height: pipeTexture.size().height))
        
        pipe.physicsBody?.isDynamic = false
            
            pipe.run(moveObstacles)
        
   pipe.physicsBody?.contactTestBitMask = ColliderType.object.rawValue
       pipe.physicsBody?.categoryBitMask = ColliderType.object.rawValue
        pipe.physicsBody?.collisionBitMask = ColliderType.object.rawValue
        
            self.addChild(pipe)
            
            pipe2 = SKSpriteNode(texture: pipeTexture2)
        
            let amount2 = self.frame.midY - pipeTexture2.size().height / 2 + movementAmount / 2 - gapHeight / 2 + randomYpositionOfPipe2
        
        let amt =  self.frame.midX + self.frame.width / 2 + changepositionOfPipe2
            
            pipe2.position = CGPoint(x: amt, y: amount2)
        
        pipe2.physicsBody = SKPhysicsBody(texture: pipeTexture2, size: CGSize(width: pipeTexture2.size().width / 2, height: pipeTexture2.size().height))
        
        pipe2.physicsBody?.isDynamic = false
        
        pipe2.physicsBody?.contactTestBitMask = ColliderType.object.rawValue
        pipe2.physicsBody?.categoryBitMask = ColliderType.object.rawValue
        pipe2.physicsBody?.collisionBitMask = ColliderType.object.rawValue
                pipe2.run(moveObstacles)
        
            self.addChild(pipe2)
        }
    }
    
    func addcoins(){
        
        ///////////COINS COINS COINS COINS COINS COINS COINS COINS COINS COINS COINS COINS /////////
        
        let moveCoins = SKAction.move(by: CGVector(dx: -2.5 * self.frame.width , dy: 0), duration: TimeInterval(self.frame.width / 150 - CGFloat(speedpipes)))
        
        let randomNumber = arc4random() % 2
        
        let movementAmount = CGFloat(arc4random() % UInt32(self.frame.height / 8))
        
        let coinsRandomPosition = GKRandomDistribution(lowestValue: 10, highestValue: 140)
        
        let coinsRandomXPosition = GKRandomDistribution(lowestValue: 30, highestValue: 200)
        
        let xpositionOfcoins = CGFloat(coinsRandomXPosition.nextInt())
        
        let position = CGFloat(coinsRandomPosition.nextInt())
        
               let coinsTexture = SKTexture(imageNamed: "Component (6).png")
        
        coins = SKSpriteNode(texture: coinsTexture)
        
       // coins.position = CGPoint(x: self.frame.midX + self.frame.width / 2 + xpositionOfcoins, y: self.frame.midY - movementAmount / 2 + position)
        
        if randomNumber == 1{
            
            coins.position = CGPoint(x: self.frame.midX + self.frame.width / 2 + xpositionOfcoins, y: self.frame.midY - movementAmount / 2 + position)
            
        }else{
            
            coins.position = CGPoint(x: self.frame.midX + self.frame.width / 2 + xpositionOfcoins, y: self.frame.midY - movementAmount / 2 - position)
            
        }
        
        coins.physicsBody = SKPhysicsBody(circleOfRadius: coins.size.width / 2)
        
        coins.physicsBody?.isDynamic = false
        
        coins.run(moveCoins)
        
        coins.setScale(0.1)
        
        coins.physicsBody?.contactTestBitMask = ColliderType.spaceShip.rawValue
        coins.physicsBody?.categoryBitMask = ColliderType.points.rawValue
        coins.physicsBody?.collisionBitMask = ColliderType.points.rawValue
        
        coins.physicsBody?.friction = 0
        
      self.addChild(coins)
        
        /////////////////////////////////////////////////////////////////////////////////////////////
        
    }
    
    func addPowerUps(){
        
        let moveCoins = SKAction.move(by: CGVector(dx: -2.2 * self.frame.width , dy: 0), duration: TimeInterval(self.frame.width / 150 - CGFloat(speedpipes)))
        
       // let randomNumber = arc4random() % 2
        
        let movementAmount = CGFloat(arc4random() % UInt32(self.frame.height / 8))
        
        let coinsRandomPosition = GKRandomDistribution(lowestValue: 10, highestValue: 140)
        
        let coinsRandomXPosition = GKRandomDistribution(lowestValue: 30, highestValue: 200)
        
        let xpositionOfcoins = CGFloat(coinsRandomXPosition.nextInt())
        
        let position = CGFloat(coinsRandomPosition.nextInt())
        
        let magnetTexture = SKTexture(imageNamed: "magnet.png")
        
        magnet = SKSpriteNode(texture: magnetTexture)
        
        let SpeedUpText = SKTexture(imageNamed: "SpeedUp.png")
        
        let slowMotext = SKTexture(imageNamed: "SlowMo.png")
        
        slowMo = SKSpriteNode(texture: slowMotext)
        
        speedUp = SKSpriteNode(texture: SpeedUpText)
        
        let powerUps = [speedUp,magnet,slowMo]
        
        let randomforPowerUp = arc4random() % 24
        
       // let anotherRandom = arc4random() % 10
        
        if randomforPowerUp % 3 == 0 {
            
            currentPowerUp = powerUps[0]
            
        }else if randomforPowerUp % 2 == 0{
            
            currentPowerUp = powerUps[2]
            
        }else{
            
            currentPowerUp = powerUps[1]
            
        }
        
            speedUp.position = CGPoint(x: self.frame.midX + self.frame.width / 2 + xpositionOfcoins, y: self.frame.midY - movementAmount / 2 + position)
        
        currentPowerUp.run(moveCoins)
        
        if currentPowerUp == speedUp{
        
currentPowerUp.setScale(0.2)
        
        }else{
            
            currentPowerUp.setScale(0.1)
            
        }
        currentPowerUp.physicsBody = SKPhysicsBody(circleOfRadius: currentPowerUp.size.width / 2)
        
        currentPowerUp.physicsBody?.isDynamic = false
        
        currentPowerUp.physicsBody?.contactTestBitMask = ColliderType.spaceShip.rawValue
        currentPowerUp.physicsBody?.categoryBitMask = ColliderType.speedUp.rawValue
        currentPowerUp.physicsBody?.collisionBitMask = ColliderType.speedUp.rawValue
        
        currentPowerUp.physicsBody?.friction = 0
        self.addChild(currentPowerUp)
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if gameIsOver == false{
        
        if contact.bodyA.categoryBitMask == ColliderType.points.rawValue || contact.bodyB.categoryBitMask == ColliderType.points.rawValue{
            
            if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask{
                
                firstBody = contact.bodyA
                secondBody = contact.bodyB
                
            }else{
                
                firstBody = contact.bodyB
                secondBody = contact.bodyA
                
            }
            
            coinsDidGet(coin: secondBody.node as! SKSpriteNode, spaceShi: firstBody.node as! SKSpriteNode)
            
                }else if contact.bodyA.categoryBitMask == ColliderType.speedUp.rawValue || contact.bodyB.categoryBitMask == ColliderType.speedUp.rawValue{
            
            if contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 8 || contact.bodyA.categoryBitMask == 8 && contact.bodyB.categoryBitMask == 1{
      
                
                if contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 8{
                    
                    firBody = contact.bodyA
                    secBody = contact.bodyB
                    
                }else{
                    
                    firBody = contact.bodyB
                    secBody = contact.bodyA
                    
                }
                
                speeduppower(speedup: secBody.node as! SKSpriteNode, spaceShi0: firBody.node as! SKSpriteNode)
                
            }
                
        }else if contact.bodyA.categoryBitMask == ColliderType.speedUp.rawValue || contact.bodyB.categoryBitMask == ColliderType.speedUp.rawValue{
            
            print("do nothing")
            
        }else{
            
            collideWIthObject()
            
            }
            
        
        
let c = labelCoins.text
            
          _ = UserDefaults.standard.set(c, forKey: "current")
            
        }
        
    }
    
/////SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP////////
    
    func speeduppower(speedup: SKSpriteNode, spaceShi0: SKSpriteNode){

        if currentPowerUp == speedUp{
            //SpeedUp SpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUp
            startTimer()
            
            speedup.removeFromParent()
            
            counterForSpeedUp = 1
            BlinkCounter = 1
            spaceShip.alpha = 0.5
            
            spaceShip.physicsBody?.contactTestBitMask = 0
            
            ground2.position = CGPoint(x: self.frame.midX, y: self.frame.midY - self.frame.midY - self.frame.height / 2)
            
            ground2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: ground.size.height / 1.5))
            
            ground2.physicsBody?.isDynamic = false
            
            self.addChild(ground2)
            
            removeObjs()
            
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(speedUPPipes), userInfo: nil, repeats: false)
            
        }else if currentPowerUp == magnet{
            //Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet
            magnetCounter = 0
            
            magnet.removeFromParent()
            
            Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(Blink), userInfo: nil, repeats: false)
      
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(magnetEffect), userInfo: nil, repeats: false)
            
        }else{
            
            //SlowMo SlowMo SlowMo SlowMo SlowMo SlowMoSlowMo SlowMo SlowMo SlowMo SlowMo SlowMo SlowMo SlowMo SlowMo SlowMo SlowMo SlowMo 
            
            slowMoCounter = 0
            
            slowMopowerup = true
            
            slowMo.removeFromParent()
            
            Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(Blink), userInfo: nil, repeats: false)

            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(slowMoEffect), userInfo: nil, repeats: false)
            
        }
   
    }
    
    func slowMoEffect(){
        
        if slowMoCounter < 12 {
        
        let pipeNewMovement = SKAction.move(by: CGVector(dx: -1.5 * self.frame.width , dy: 0), duration: TimeInterval(self.frame.width / 150 - CGFloat(speedpipes)))
        
        ///////////PIPES PIPES PIPES PIPES PIPES PIPES PIPES PIPES PIPES PIPES PIPES ///////////////
        
        let randomheightOfpipe = GKRandomDistribution(lowestValue: 30, highestValue: 80)
        
        let randomYpositionOfPipe2 = CGFloat(randomheightOfpipe.nextInt())
        
        let gapBetween = GKRandomDistribution(lowestValue: Int(spaceShip.size.width * 2), highestValue: Int(spaceShip.size.width * 4))
        
        let changepositionOfPipe2 = CGFloat(gapBetween.nextInt())
        
        let movementAmount = CGFloat(arc4random() % UInt32(self.frame.height / 8))
        
        // let pipeOffset = CGFloat(movementAmount) - self.frame.height / 4
        
        let gapHeight = spaceShip.size.height + 20
        
        let pipeTexture = SKTexture(imageNamed: "Component (14).png")
        
        let pipeTexture2 = SKTexture(imageNamed: "Component (13).png")
        
        pipe = SKSpriteNode(texture: pipeTexture)
        
        let amount =  self.frame.midY + pipeTexture.size().height / 2.5 - movementAmount / 2  + gapHeight / 2
        
        pipe.position = CGPoint(x: self.frame.midX + self.frame.width / 2 , y: amount + randomYpositionOfPipe2)
        
        //pipe.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: pipeTexture.size().width / 2 - 20 , height: pipeTexture.size().height))
        
        pipe.physicsBody = SKPhysicsBody(texture: pipeTexture, size: CGSize(width: pipeTexture.size().width / 2, height: pipeTexture.size().height))
        
        pipe.physicsBody?.isDynamic = false
        
        pipe.run(pipeNewMovement)
        
        pipe.physicsBody?.contactTestBitMask = ColliderType.object.rawValue
        pipe.physicsBody?.categoryBitMask = ColliderType.object.rawValue
        pipe.physicsBody?.collisionBitMask = ColliderType.object.rawValue
        
        self.addChild(pipe)
        
        pipe2 = SKSpriteNode(texture: pipeTexture2)
        
        let amount2 = self.frame.midY - pipeTexture2.size().height / 2 + movementAmount / 2 - gapHeight / 2 + randomYpositionOfPipe2
        
        let amt =  self.frame.midX + self.frame.width / 2 + changepositionOfPipe2
        
        pipe2.position = CGPoint(x: amt, y: amount2)
        
        pipe2.physicsBody = SKPhysicsBody(texture: pipeTexture2, size: CGSize(width: pipeTexture2.size().width / 2, height: pipeTexture2.size().height))
        
        pipe2.physicsBody?.isDynamic = false
        
        pipe2.physicsBody?.contactTestBitMask = ColliderType.object.rawValue
        pipe2.physicsBody?.categoryBitMask = ColliderType.object.rawValue
        pipe2.physicsBody?.collisionBitMask = ColliderType.object.rawValue
        pipe2.run(pipeNewMovement)
        
        self.addChild(pipe2)
        slowMoCounter += 1
       
        }
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(continueSlowMo), userInfo: nil, repeats: false)
    }
    
    func continueSlowMo(){
        
        slowMoEffect()
        
    }
    
    func magnetEffect(){
        
      if magnetCounter <  24{
    
            let coinMovement = SKAction.move(to: spaceShip.position, duration: 0.5)
        
            coins.run(coinMovement)
        
            magnetCounter += 1
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(continueMagneticEffect), userInfo: nil, repeats: false)
        
        }
        
           }
    
    func continueMagneticEffect(){
        
        magnetEffect()
        
    }
    
    func  startTimer() {
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(SpeedUpworking), userInfo: nil, repeats: false)
        
    }
    
    func removeObjs(){
        
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(Blink), userInfo: nil, repeats: false)
        
        Timer.scheduledTimer(timeInterval: 5.8, target: self, selector: #selector(RemoveObjectsOfSpeedUp), userInfo: nil, repeats: false)
        
    }
    
    func SpeedUpworking(){
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(increaseScore), userInfo: nil, repeats: false)
        
        counterForSpeedUp += 1
        
        if counterForSpeedUp < 20{
            
            startTimer()
            
        }
        
    }
    
    func RemoveObjectsOfSpeedUp(){
        
        spaceShip.alpha = 1
        
        spaceShip.physicsBody?.contactTestBitMask = ColliderType.object.rawValue
        
        ground2.removeFromParent()
        
    }
    
    func Blink(){
       
        if currentPowerUp == speedUp || currentPowerUp == slowMo{
        
        spaceShip.alpha = 1
    
        }else if currentPowerUp == magnet{
            
            spaceShip.alpha = 0.5
            
        }
        
        Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(BlinkAgain), userInfo: nil, repeats: false)
        
    }
    
    func BlinkAgain(){
        
         BlinkCounter += 1
        
        if BlinkCounter < 4{
          
            if currentPowerUp == speedUp || currentPowerUp == slowMo{
            
            spaceShip.alpha = 0.5
            
            }else{
                
                spaceShip.alpha = 1
                
            }
         
            Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(Blink), userInfo: nil, repeats: false)
            
        }
        
    }
    
    func speedUPPipes(){
        
         let moveObstacles = SKAction.move(by: CGVector(dx: -2 * self.frame.width , dy: 0), duration: TimeInterval(self.frame.width / 150 ))
        
        pipe.run(moveObstacles)
        
        pipe2.run(moveObstacles)
        
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(repeatSpeedUp), userInfo: nil, repeats: false)
        
       Timer.scheduledTimer(timeInterval: TimeInterval(0.5), target: self, selector: #selector(self.makePipes), userInfo: nil, repeats: false)
        
    }
    
    func repeatSpeedUp(){
        
        speedUPCOUNTER += 1
        
        if speedUPCOUNTER < 4{
            
            speedUPPipes()
            
        }
        
    }
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameHasStarted == false{
        
        gameStarted = true
        
            gameHasStarted = true
        }
        if gameStarted == true{
            
                setupgame()
            
            gameStarted = false
            
        }
        
//animate()
        
        scoreIsenabled = true
        
        if gameIsOver == false{
            
    // touched = true
            
            if gravity == true{
            
            spaceShip.physicsBody?.isDynamic = true
            
            spaceShip.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            
           spaceShip.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 110))
            
            spaceShip.zRotation = 0
            
            gameState = true
            
            }else{
                
              //  spaceShip = SKSpriteNode(texture: spaceShipTexture2)
                
                spaceShip.physicsBody?.isDynamic = true
                
                spaceShip.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                
                spaceShip.physicsBody?.applyImpulse(CGVector(dx: 0, dy: -110))
                
                spaceShip.zRotation = 0
                
            }
        }
        
    }
    
    
  
    
   /* override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touched = false
    }*/
   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func collideWIthObject(){
       
          //  spaceShip.physicsBody?.contactTestBitMask = ColliderType.object.rawValue
            //spaceShip.physicsBody?.categoryBitMask = ColliderType.spaceShip.rawValue
            //spaceShip.physicsBody?.collisionBitMask = ColliderType.spaceShip.rawValue
            
           // if contact.bodyA.categoryBitMask == ColliderType.object.rawValue || contact.bodyB.categoryBitMask == ColliderType.object.rawValue {
 
                gameIsOver = true
                
                self.speed = 0
                
                if gameIsOver == true{
                   
                if let explossion = SKEmitterNode(fileNamed: "Explosion.sks"){
                    
                    explossion.position = spaceShip.position
                    
                    self.addChild(explossion)
                    
                    }
                    spaceShip.removeFromParent()
                    
                    if recordData == nil {
                        
                        saveScore = score
                        
                        let userDefaults = Foundation.UserDefaults.standard
                        
                        userDefaults.set(saveScore, forKey: "Record")
                        
                    } else {
                        
                        let newScore = score
                        let record:Int = Int(recordData)!
                        
                        if newScore > record{
                            
                            let userDefaults = Foundation.UserDefaults.standard
                            
                            userDefaults.set(newScore, forKey: "Record")
                        }
                    }
                    
                    returnBack()
                    
                    let CoinsuserDefaults = Foundation.UserDefaults.standard
                    
                    CoinsuserDefaults.set(labelCoins.text, forKey: "coin")
        
        }
            //}
        
        
    }
    
    func returnBack(){
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(loadView), userInfo: nil, repeats: false)
    }
    ///////SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE /////////
    func increaseScore(){
               if scoreIsenabled == true{
        if gameIsOver == false{
                
                score += 1
            
            scoreLabel.text = "Score: \(score)"
            
        }
        }
        
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    func loadView(){
     
     if let view = self.view {
            // Load the SKScene from 'GameScene.sks'
            if let scene = GameScene(fileNamed: "homeScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
              }
    
    func coinsDidGet(coin: SKSpriteNode, spaceShi: SKSpriteNode){
        
        newCoins += 1
        
        labelCoins.text = String(newCoins)
        
        coin.removeFromParent()
        
    }
    
    
func isItAnti(){
        // make Gravity= false
        
        if gravity == true{
            
            gravity = false
            
            antigravityEnabled = true
            
        } else {
            
            gravity = true
         
            antigravityEnabled = false
            
        }
     
        if gravity == false {
     
            if antigravityEnabled == true{
                
                antiGravity.isHidden = false
                
                antiGravity.alpha = 1
                
                _ = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.removeantigravitynodeandenablegravity), userInfo: nil, repeats: false)
                
                antiGravity.setScale(0.6)
            
            }
            
        }else if gravity == true {
            
            gravityNode.isHidden = false
            
            _ = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.enableGravity), userInfo: nil, repeats: false)
            
            gravityNode.setScale(0.6)
            
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        //ANTI GRAVITY ANTI GRAVITY ANTI GRAVITY ANTI GRAVITY ANTI GRAVITY ANTI GRAVITY ANTI GRAVITY ANTI ANTI GRAVITYANTI GRAVITYANTI GRAVITYANTI GRAVITY
        
         }
    
    func removeantigravitynodeandenablegravity(){

        if gravity == false{
        
            if antigravityEnabled == true{
            
           self.physicsWorld.gravity = CGVector(dx: 0, dy: 9.8)
        
let antimte = SKAction.fadeOut(withDuration: 2)
        
antiGravity.run(antimte)
  
        antigravityEnabled = false
        
        _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.makeitInvisible), userInfo: nil, repeats: false)
                
            }
        }
        
    }
    
    func enableGravity(){
        
            self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
         _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.makeitInvisible), userInfo: nil, repeats: false)
    }
    
    func makeitInvisible(){
    
    antiGravity.isHidden = true
        
        gravityNode.isHidden = true
        
    }
   
}
