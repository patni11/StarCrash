//
//  GameScene.swift
//  Star Crash
//

import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

class GameScene: SKScene, SKPhysicsContactDelegate{
    
    var vc:GameViewController!
    var repeatTime = 1
    var spaceShipDy = CGFloat()
    var PlayAudio = AVAudioPlayer()
    var BulletAudio = AVAudioPlayer()
    var explosionAudio = AVAudioPlayer()
    var MeteorBlast = AVAudioPlayer()
    var speedUpEnabled = false
    var magnetCounter = Int()
    var moveCoins = SKAction()
    var currentPowerUp = SKSpriteNode()
    var gameStarted = false
    let alert = Alert()
   // var LevelLabel:SKLabelNode!
    var giveMeCoin = true
   // var GalaxyLabel:SKLabelNode!
   // var Level = 0
    var runPipes = true
    var gameHasStarted = false
    var BlinkCounter = 0
    var speedUPCOUNTER = 0
    var meteorTimer = Timer()
    var speedUp = SKSpriteNode()
    var counterForSpeedUp = 0
    var viewController: UIViewController!
    var starfield:SKEmitterNode!
    
    var speedpipes = TimeInterval()
    var movementAmountreduction = 0
    var coinsImage = SKSpriteNode()
    var spaceShip = SKSpriteNode()
    var labelCoins = SKLabelNode()
    var ground = SKSpriteNode()
    var pipe = SKSpriteNode()
    var pipe2 = SKSpriteNode()
    var metavai = true
    var gameState = false
    var timer = Timer()
    var bag = SKSpriteNode()
    var gameIsOver = false
    var scoreLabel = SKLabelNode()
    var score = Double(0.0).rounded()
    var antigravityEnabled = true
    var sky = SKNode()
    var antiGravity = SKSpriteNode()
    var gravityNode:SKSpriteNode!
    var highScore:Int = 0
    var saveScore = Double(0.0).rounded()
    var recordData:String!
    var newCoins = Int()
    var firstBody:SKPhysicsBody!
    var secondBody:SKPhysicsBody!
    var firBody:SKPhysicsBody!
    var secBody:SKPhysicsBody!
    var f:SKPhysicsBody!
    var s:SKPhysicsBody!
    var math:String!
    var numberOfCoins = Int()
    var recordedCoins:String!
    var SavedCoins = 0
    var timeInter = Int()
    var ground2 = SKSpriteNode()
    var gravity = true
    var magnet = SKSpriteNode()
    var scoreIsenabled = false
    let musicState:Bool = (UserDefaults.standard.object(forKey: "musicState") != nil)
    let spaceShipTexture2 = SKTexture(imageNamed: "Component (46).png")
    let groundtexture2 = SKTexture(imageNamed: "Component Ground.png")
    var shoot: SKSpriteNode!
    var bullet = SKSpriteNode()
    var PowerBullet = SKSpriteNode()
    var shootIsActive = true
 //   var giveMeCoin = true
    var UsePower = SKSpriteNode()
    var PurchasedPowers = UserDefaults.standard.integer(forKey: "Powers")
    var bulletPowerCounter = 0
    var currentPosition = CGPoint()
    var lastView:SKSpriteNode!
    var lastLabel:SKLabelNode!
    var gameover:SKLabelNode!
    var bulletText:SKTexture!
    var i = 1
    var moveBullet = SKAction()
    var PowerUsed = false
    var UsePurchasePowerUp = String()
    var errorLabel:SKLabelNode!
   // var touched = false
    
    enum ColliderType: UInt32{
        
        case none = 0
        case spaceShip = 1
        case object = 2
        case points = 4
        case speedUp = 5
        case bullet = 3
        case meteor = 6
    }
    
    var spaceShipTexture = SKTexture()
    var spaceShipCurrentTexture = Int()
    
    override func didMove(to view: SKView) {

       
        
//        GalaxyLabel = self.childNode(withName: "Galaxy")as! SKLabelNode
//        GalaxyLabel.alpha = 0
//        
//        LevelLabel = self.childNode(withName: "Level")as! SKLabelNode
//        LevelLabel.alpha = 0
        
        errorLabel = self.childNode(withName: "ErrorLabel")as! SKLabelNode
        errorLabel.alpha = 0
        
        lastView = self.childNode(withName: "LastView") as! SKSpriteNode
        lastView.isHidden = true
        
        lastLabel = self.childNode(withName: "LastLabel") as! SKLabelNode
        lastLabel.isHidden = true
        
        gameover = self.childNode(withName: "gameover") as! SKLabelNode
        gameover.isHidden = true
        
        let valSpaceShip = UserDefaults.standard.integer(forKey: "CurrentSpaceShip")
        
        if valSpaceShip == 0 || valSpaceShip == nil{
            
              spaceShipCurrentTexture = 1
            
        }else{
        
         spaceShipCurrentTexture = valSpaceShip
        
        }
        
        if spaceShipCurrentTexture == 1{
            
            spaceShipTexture = SKTexture(imageNamed: "Component (2).png")
            
        }else if spaceShipCurrentTexture == 2{
            
            spaceShipTexture = SKTexture(imageNamed: "Ship2.png")
            
        }else if spaceShipCurrentTexture == 3{
            
            spaceShipTexture = SKTexture(imageNamed: "alien.png")//alien
            
        }else if spaceShipCurrentTexture == 4{
            
            spaceShipTexture = SKTexture(imageNamed: "alien2.png")
            
        }else if spaceShipCurrentTexture == 5{
            
            spaceShipTexture = SKTexture(imageNamed:"alien3.png")
            
        }else if spaceShipCurrentTexture == 6{
        
        spaceShipTexture = SKTexture(imageNamed:"SpaceShip6.png")
        
    }else{
            
            var alert = UIAlertController()
            alert = UIAlertController(title: "SpaceShip Error", message: "Please select a spaceHip from shop", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            
        }
        if spaceShipCurrentTexture != 5{
       meteorTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(MoveMeteors), userInfo: nil, repeats: true)
        }
       
        adisShoen = false
   showadvertisement = true
       
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
         try   AVAudioSession.sharedInstance().setActive(true)
       
        }catch{
            
            
        }
        
        do {
            
            explosionAudio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Explosion+3", ofType: "mp3")!))
            explosionAudio.prepareToPlay()
       
        } catch {
            
            print("error")
            
        }
        do {
            
            BulletAudio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "BulletMusic", ofType: "mp3")!))
            BulletAudio.prepareToPlay()
            
        } catch {
            
            print("error")
            
        }
        do {
            
           MeteorBlast = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "MeteorBlast", ofType: "mp3")!))
            MeteorBlast.prepareToPlay()
            
        } catch {
            
            print("error")
            
        }
        do {
            
            PlayAudio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Jamie Nord - Sigma Draconis MP3 320", ofType: "mp3")!))
        PlayAudio.prepareToPlay()
            
        } catch {
            
            print("error")
            
        }
      
    if UserDefaults.standard.bool(forKey: "musicState") == true{
        PlayAudio.play()
        }
    canAccess = false
        
            self.backgroundColor = .black
      
        let userdefaults = Foundation.UserDefaults.standard
     let val =  userdefaults.string(forKey: "Record")
        recordData = val
        
                    let texture = SKTexture(imageNamed: "Component (26).png")
        
        antiGravity = SKSpriteNode(texture: texture)
        
        antiGravity.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        if spaceShipCurrentTexture != 6{
        self.addChild(antiGravity)
        }
        let gravityTexture = SKTexture(imageNamed: "Gravity.png")
        
        gravityNode = SKSpriteNode(texture: gravityTexture)
        
         gravityNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
          if spaceShipCurrentTexture != 6{
        self.addChild(gravityNode)
        }
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
            
            if valSpaceShip == nil{
            
            spaceShip = SKSpriteNode(texture: spaceShipTexture)
            
            }else{
                
                spaceShip = SKSpriteNode(texture: spaceShipTexture)
                
            }
            
            if spaceShipCurrentTexture == 4 || spaceShipCurrentTexture == 5{
                
                spaceShip.setScale(0.2)
                
            }else if spaceShipCurrentTexture == 6{
             
                spaceShip.setScale(0.15)
                
            }else{
                 spaceShip.setScale(0.26)
            }
          //  spaceShip.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: spaceShipTexture.size().width , height: spaceShipTexture.size().height / 2))
            
            spaceShip.physicsBody = SKPhysicsBody(texture: spaceShipTexture, size: CGSize(width: spaceShip.size.width, height: spaceShip.size.height / 1.2))
            
            spaceShip.position = CGPoint(x: self.frame.midX - self.frame.width / 2 + spaceShip.size.width / 2, y: self.frame.midY)
            
            currentPosition = spaceShip.position
            //  spaceShip.physicsBody = SKPhysicsBody(texture: spaceShipTexture, size: spaceShipTexture.size())
            
           
            
            spaceShip.physicsBody?.isDynamic = true
            
            spaceShip.physicsBody?.restitution = 0
            spaceShip.physicsBody?.linearDamping = 0
            spaceShip.physicsBody?.isDynamic = false
            
            spaceShip.physicsBody?.contactTestBitMask = ColliderType.object.rawValue
            spaceShip.physicsBody?.categoryBitMask = ColliderType.spaceShip.rawValue
            spaceShip.physicsBody?.collisionBitMask = ColliderType.spaceShip.rawValue
            spaceShip.physicsBody?.allowsRotation = false
        
            self.addChild(spaceShip)
            print(spaceShipCurrentTexture)
            print(spaceShipTexture)
        }else{
            
        
            
        }
                          }
    
   @objc func setupgame(){
        
        if gameStarted == true{
        
           // Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(changeLevel), userInfo: nil, repeats: true)
            
            Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(addcoins), userInfo: nil, repeats: false)// timeInterval : 2
            
            let randomForSpeedUp = GKRandomDistribution(lowestValue: 25, highestValue: 35)
            
            let randomForspeedup = TimeInterval(randomForSpeedUp.nextInt())
            
            Timer.scheduledTimer(timeInterval: randomForspeedup, target: self, selector: #selector(addPowerUps), userInfo: nil, repeats: true)
            
        Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(increaseScore), userInfo: nil, repeats: true)
        
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(3), target: self, selector: #selector(self.makePipes), userInfo: nil, repeats: false)
        
              /////////SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE ///////////
   
            
            shoot = self.childNode(withName: "shoot") as! SKSpriteNode?
            UsePower = self.childNode(withName: "UsePower") as! SKSpriteNode
        scoreLabel.text = "Light Years: 0"
        scoreLabel.position = CGPoint(x: self.frame.midX + self.frame.width / 2 - CGFloat(scoreLabel.frame.width
            ), y: self.frame.midY + self.frame.height / 2 - scoreLabel.frame.height)
        scoreLabel.fontColor = .yellow
        scoreLabel.fontName = "MarkerFelt-Thin"
        self.addChild(scoreLabel)
            if spaceShipCurrentTexture == 5{
                shoot.isHidden = true
                
            }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
               // MOVING BACKGROUND MOVING BACKGROUND MOVING BACKGROUNDMOVING BACKGROUND MOVING BACKGROUND MOVING BACKGROUND
        
        let groundTexture = SKTexture(imageNamed: "Ground.png")
        
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
            
          //  ground.physicsBody = SKPhysicsBody(texture: groundTexture, size: CGSize(width: groundTexture.size().width, height: groundTexture.size().height / 1.5))
            
            ground.physicsBody = SKPhysicsBody(texture: groundTexture, size: groundTexture.size())
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
          if spaceShipCurrentTexture != 6{
       let timeIntr = GKRandomDistribution(lowestValue: 5, highestValue: 15)
        
        let inter = TimeInterval(timeIntr.nextInt())
        
        _ = Timer.scheduledTimer(timeInterval: inter, target: self, selector: #selector(self.isItAnti), userInfo: nil, repeats: true)
            }
    }
    }
    
    @objc func makePipes(){
        if runPipes{
        if speedpipes >= TimeInterval(1.5){
            speedpipes = TimeInterval(1.5)
        }else{
            speedpipes += 0.1
        }
        }
        
        ///////////PIPES PIPES PIPES PIPES PIPES PIPES PIPES PIPES PIPES PIPES PIPES ///////////////
        
        let randomheightOfpipe = GKRandomDistribution(lowestValue: 50, highestValue: 80)
        
        let randomYpositionOfPipe2 = CGFloat(randomheightOfpipe.nextInt())
        
        let gapBetween = GKRandomDistribution(lowestValue: Int(spaceShip.size.width * 4), highestValue: Int(spaceShip.size.width * 5 - CGFloat(speedpipes)))
        
        let changepositionOfPipe2 = CGFloat(gapBetween.nextInt())
        
        let moveObstacles = SKAction.move(by: CGVector(dx: -2 * self.frame.width, dy: 0), duration: TimeInterval(4 - CGFloat(speedpipes)))
        
        let movementAmount = CGFloat(arc4random() % UInt32(self.frame.height / 8))
        
        // let pipeOffset = CGFloat(movementAmount) - self.frame.height / 4
        
        let gapHeight = spaceShip.size.height + 10
        
        let pipeTexture = SKTexture(imageNamed: "Component (14).png")
        
        let pipeTexture2 = SKTexture(imageNamed: "Component (13).png")
        
        pipe = SKSpriteNode(texture: pipeTexture)
        
        let amount =  self.frame.midY + pipeTexture.size().height / 2.5 - movementAmount / 2  + gapHeight / 4
        
        pipe.position = CGPoint(x: self.frame.midX + self.frame.width / 2 , y: amount + randomYpositionOfPipe2)
        
        pipe.physicsBody = SKPhysicsBody(texture: pipeTexture, size: pipe.frame.size)
        
        //pipe.physicsBody = SKPhysicsBody(texture: pipeTexture, size: CGSize(width: pipeTexture.size().width / 2, height: pipeTexture.size().height))
        
        pipe.physicsBody?.isDynamic = false
        
        pipe.run(moveObstacles)
        
        pipe.physicsBody?.contactTestBitMask = ColliderType.object.rawValue
        pipe.physicsBody?.categoryBitMask = ColliderType.object.rawValue
        pipe.physicsBody?.collisionBitMask = ColliderType.object.rawValue
        //let val = CGFloat(lowVal)
       // pipe.physicsBody!.velocity.dx = -val * 4
        self.addChild(pipe)
        
        pipe2 = SKSpriteNode(texture: pipeTexture2)
        
        let amount2 = self.frame.midY - pipeTexture2.size().height / 2 + movementAmount / 2 - gapHeight / 2 + randomYpositionOfPipe2
        
        let amt =  self.frame.midX + self.frame.width / 2 + changepositionOfPipe2
        
        pipe2.position = CGPoint(x: amt, y: amount2)
        
        pipe2.physicsBody = SKPhysicsBody(texture: pipeTexture2, size: pipe2.frame.size)
        
        //   pipe2.physicsBody = SKPhysicsBody(texture: pipeTexture2, size: CGSize(width: pipeTexture2.size().width / 2, height: pipeTexture2.size().height))
        
        pipe2.physicsBody?.isDynamic = false
        
        pipe2.physicsBody?.contactTestBitMask = ColliderType.object.rawValue
        pipe2.physicsBody?.categoryBitMask = ColliderType.object.rawValue
        pipe2.physicsBody?.collisionBitMask = ColliderType.object.rawValue
        pipe2.run(moveObstacles)
      //  pipe2.physicsBody!.velocity.dx = -val * 4
        self.addChild(pipe2)
     
        if runPipes{
Timer.scheduledTimer(timeInterval: TimeInterval(3.5 - Double(speedpipes)), target: self, selector: #selector(makePipes), userInfo: nil, repeats: false)
        }else{
            
        }
    }
    
   
   
    @objc func addcoins(){
        var coins = SKSpriteNode()
        
        let moveCoins = SKAction.move(by: CGVector(dx: -2.5 * self.frame.width, dy: 0), duration: 3)
        
        let coinsRandomPosition = GKRandomDistribution(lowestValue: Int(self.frame.minY + 60), highestValue: Int(self.frame.maxY - 60))
        
        let position = CGFloat(coinsRandomPosition.nextInt())
        
        let coinsTexture = SKTexture(imageNamed: "Component (6).png")
        
        coins = SKSpriteNode(texture: coinsTexture)
        
        // coins.position = CGPoint(x: self.frame.midX + self.frame.width / 2 + xpositionOfcoins, y: self.frame.midY - movementAmount / 2 + position)
        
        coins.position = CGPoint(x: self.frame.midX + self.frame.width / 2 , y: position)
        
        
        coins.physicsBody = SKPhysicsBody(circleOfRadius: coins.size.width / 2)
        
        coins.physicsBody?.isDynamic = false
        
        if magnetCounter <= 30 && magnetCounter >= 1{

            let coinMovement = SKAction.move(to: spaceShip.position, duration: 0.2)
            coins.removeAction(forKey: "MoveCoins")
            let moveact = SKAction.sequence([coinMovement, coinMovement, coinMovement])
            coins.run(moveact)

            magnetCounter += 1

        }else{
            coins.run(moveCoins)
        }

        coins.setScale(0.1)
        
        coins.physicsBody?.contactTestBitMask = ColliderType.spaceShip.rawValue
        coins.physicsBody?.categoryBitMask = ColliderType.points.rawValue
        coins.physicsBody?.collisionBitMask = ColliderType.points.rawValue
        coins.physicsBody!.fieldBitMask = ColliderType.points.rawValue
        self.addChild(coins)
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(addcoins), userInfo: nil, repeats: false)// timeInterval : 2

        /////////////////////////////////////////////////////////////////////////////////////////////
         giveMeCoin = true
    }
    
    @objc func MoveMeteors(){
        if metavai{
        var metemitter = SKEmitterNode(fileNamed: "met.sks")!
        var meteor = SKSpriteNode()
        let antrand = GKRandomDistribution(lowestValue: 0, highestValue: 2)
        let rand = antrand.nextInt()
        
        let meteorText = SKTexture(imageNamed: "met3.png")
        meteor = SKSpriteNode(texture: meteorText)
        
        let moveMeteor = SKAction.move(by: CGVector(dx: -2 * self.frame.width , dy: 0), duration: TimeInterval(self.frame.width / 200 ))
        
        let coinsRandomPosition = GKRandomDistribution(lowestValue: Int(self.frame.minY + 60), highestValue: Int(self.frame.maxY - 50))
        
        let position = CGFloat(coinsRandomPosition.nextInt())
        
        meteor.position =  CGPoint(x: self.frame.midX + self.frame.width / 2, y: position)
        
        if rand == 0{
            
            meteor.setScale(0.1)
            metemitter.setScale(0.25)
            
        }else if rand == 1{
            meteor.setScale(0.2)
            metemitter.setScale(0.5)
            
            
        }else if rand == 2{
            
            meteor.setScale(0.3)
            metemitter.setScale(0.7)
            
        }
        meteor.physicsBody = SKPhysicsBody(circleOfRadius: meteor.frame.width / 2)
        
        meteor.physicsBody?.categoryBitMask = ColliderType.meteor.rawValue
        meteor.physicsBody?.contactTestBitMask = ColliderType.bullet.rawValue
        meteor.physicsBody?.collisionBitMask = ColliderType.none.rawValue
        
        // meteor.physicsBody?.usesPreciseCollisionDetection = true
        meteor.physicsBody?.affectedByGravity = false
        
        meteor.physicsBody?.friction = 0
        
        meteor.run(moveMeteor)
        //metemitter.advanceSimulationTime(0)
        metemitter.position = CGPoint(x: meteor.position.x , y: meteor.position.y)
        metemitter.run(moveMeteor)
 
        self.addChild(meteor)
        self.addChild(metemitter)
        }
        }
    
   
    
    @objc func addPowerUps(){
        moveCoins = SKAction.move(by: CGVector(dx: -2.2 * self.frame.width, dy: 0), duration: 3)
        
        // let randomNumber = arc4random() % 2
        
        let coinsRandomPosition = GKRandomDistribution(lowestValue: Int(self.frame.minY + 40), highestValue: Int(self.frame.maxY - 40))
        
        //   let coinsRandomXPosition = GKRandomDistribution(lowestValue: 30, highestValue: 200)
        
        // let xpositionOfcoins = CGFloat(coinsRandomXPosition.nextInt())
        
        let position = CGFloat(coinsRandomPosition.nextInt())
        
        magnet = SKSpriteNode(texture: SKTexture(imageNamed: "magnet.png"))
        
        PowerBullet = SKSpriteNode(texture: SKTexture(imageNamed: "POWER32.png"))
        
        speedUp = SKSpriteNode(texture: SKTexture(imageNamed: "SpeedUp.png"))
        
        let powerUps = [speedUp,magnet,PowerBullet]
        
        let randomForPowerUpSave = GKRandomDistribution(lowestValue: 0, highestValue: 24)
        let randomforPowerUp = randomForPowerUpSave.nextInt()
        
        if randomforPowerUp % 3 == 0 {
            currentPowerUp = powerUps[1]//1
        }else if randomforPowerUp % 4 == 0{
            currentPowerUp = powerUps[0]//0
        }else{
            if spaceShipCurrentTexture == 5{
                currentPowerUp = powerUps[0]
            }else{
                currentPowerUp = powerUps[2]//2
            }
        }
        print("CurrentPowerUp: \(currentPowerUp)")
        speedUp.position = CGPoint(x: self.frame.maxX, y: position)
        
        currentPowerUp.run(moveCoins)
        
        if currentPowerUp == speedUp{
            
            currentPowerUp.setScale(0.2)
            
        }else if currentPowerUp == PowerBullet{
            
            currentPowerUp.setScale(0.2)
            
        }else{
            currentPowerUp.setScale(0.1)
            
        }
        currentPowerUp.physicsBody = SKPhysicsBody(circleOfRadius: currentPowerUp.size.width / 2)
        
        currentPowerUp.physicsBody?.isDynamic = false
        
        currentPowerUp.physicsBody?.contactTestBitMask = ColliderType.spaceShip.rawValue
        currentPowerUp.physicsBody?.categoryBitMask = ColliderType.speedUp.rawValue
        //   currentPowerUp.physicsBody?.collisionBitMask = ColliderType.speedUp.rawValue
        
        currentPowerUp.physicsBody?.friction = 0
        self.addChild(currentPowerUp)
        
    }
   @objc func didBegin(_ contact: SKPhysicsContact) {
        
        if gameIsOver == false{
            
        if contact.bodyA.categoryBitMask == 4 && contact.bodyB.categoryBitMask == 1 || contact.bodyB.categoryBitMask == 4 && contact.bodyA.categoryBitMask == 1{
            
            if contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 4{
                
                firstBody = contact.bodyA
                secondBody = contact.bodyB

            }else{
                
                firstBody = contact.bodyB
                secondBody = contact.bodyA
                
            }
            coinsDidGet(coin: secondBody.node as! SKSpriteNode, spaceShi: firstBody.node as! SKSpriteNode)
            
                }else if contact.bodyA.categoryBitMask == ColliderType.speedUp.rawValue || contact.bodyB.categoryBitMask == ColliderType.speedUp.rawValue{
            
            spaceShip.physicsBody?.restitution = 0
            speedUp.physicsBody?.restitution = 0
            
            if contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 5 || contact.bodyA.categoryBitMask == 5 && contact.bodyB.categoryBitMask == 1{
      
                
                if contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 5{
                    
                    firBody = contact.bodyA
                    secBody = contact.bodyB
                    
                }else{
                    
                    firBody = contact.bodyB
                    secBody = contact.bodyA
                    
                }
                
                speeduppower(speedup: secBody.node as! SKSpriteNode, spaceShi0: firBody.node as! SKSpriteNode)
                
            }
                
        }else if contact.bodyA.categoryBitMask == 3 && contact.bodyB.categoryBitMask == 6 ||  contact.bodyA.categoryBitMask == 6 && contact.bodyA.categoryBitMask == 3{
            
            
                if contact.bodyA.categoryBitMask == 3 && contact.bodyB.categoryBitMask == 6{
        
                    f = contact.bodyB
                    s = contact.bodyA
                    
                }else{
                    
                    f = contact.bodyA
                    s = contact.bodyB
                    
                }
            
               meteorAndBulet(bullet: s.node as! SKSpriteNode, meteors: f.node as! SKSpriteNode)
                
            } else if contact.bodyA.categoryBitMask == 3 && contact.bodyB.categoryBitMask == 1 || contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 3 {
            

 
        }else if contact.bodyA.categoryBitMask == ColliderType.meteor.rawValue && contact.bodyB.categoryBitMask == ColliderType.object.rawValue || contact.bodyA.categoryBitMask == ColliderType.object.rawValue && contact.bodyB.categoryBitMask == ColliderType.meteor.rawValue {
            
            }else if contact.bodyA.categoryBitMask == ColliderType.meteor.rawValue && contact.bodyB.categoryBitMask == ColliderType.meteor.rawValue{
            
        
            
        }else if contact.bodyA == ground2 && contact.bodyB.categoryBitMask == ColliderType.meteor.rawValue || contact.bodyA.categoryBitMask == ColliderType.meteor.rawValue && contact.bodyB == ground2 {
        
           
        }else {
            
          self.collideWIthObject()
          
            }
        
let c = labelCoins.text
            
          _ = UserDefaults.standard.set(c, forKey: "current")
            
        }
        
    }
    
/////SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP SPEED UP////////
    
    @objc func speeduppower(speedup: SKSpriteNode, spaceShi0: SKSpriteNode){
       if currentPowerUp == magnet || UsePurchasePowerUp == "Magnet"{
            //Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet Magnet
            magnetCounter = 1
            
            magnet.removeFromParent()
            if PowerUsed{
                let new = 0
                _ = UserDefaults.standard.set(new, forKey: "Powers")
                
            }
            Timer.scheduledTimer(timeInterval: 70, target: self, selector: #selector(Blink), userInfo: nil, repeats: false)
            
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(magnetEffect), userInfo: nil, repeats: false)
            
        }else if currentPowerUp == PowerBullet || UsePurchasePowerUp == "PowerBullet"{
            bulletPowerCounter = 0
            PowerBullet.removeFromParent()
            PowerBulletFunc()
            
        }else if currentPowerUp == speedUp || UsePurchasePowerUp == "SpeedUp"{
            
            //SpeedUp SpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUpSpeedUp
            runPipes = false
            if PowerUsed{
                let new = 0
                _ = UserDefaults.standard.set(new, forKey: "Powers")
            }
            speedup.removeFromParent()
            if UsePurchasePowerUp == "SpeedUp"{
                UsePurchasePowerUp = ""
                PurchasedPowers = 0
            }
            SpeedUpworking()
            print("UsePurchasePowerup \(UsePurchasePowerUp)")
            print("CurrentpPowerUp \(currentPowerUp)")
            print("Purchased power \(PurchasedPowers)")
            speedUPCOUNTER = 0
            
            counterForSpeedUp = 1
            BlinkCounter = 1
            spaceShip.alpha = 0.5
            
            spaceShip.physicsBody?.contactTestBitMask = 0
            
            ground2.position = CGPoint(x: self.frame.midX, y: self.frame.midY - self.frame.height / 2)
            ground2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: ground.size.height / 1.5))
            ground2.physicsBody?.isDynamic = false
            //  self.addChild(ground2)
            
            removeObjs()
            
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(speedUPPipes), userInfo: nil, repeats: false)
            
        }
    }
    
    @objc func PowerBulletFunc(){
        
        if bulletPowerCounter < 240{
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(PowerBulletFunc), userInfo: nil, repeats: false)
            if PowerUsed{
                let new = 0
                _ = UserDefaults.standard.set(new, forKey: "Powers")
                
            }
           
            metavai = false
            bulletPowerCounter += 1
            
        }else{
            metavai = true
        }
        
    }
    
    @objc func magnetEffect(){
//        let magnets = SKFieldNode.radialGravityField()
//        magnets.strength = 50
//        magnets.categoryBitMask = ColliderType.points.rawValue
//        magnets.region = SKRegion(size: self.frame.size)
//      //magnets.animationSpeed = 20
//        magnets.isEnabled = true
//        space.physicsBody?.fieldBitMask = ColliderType.points.rawValue
//        spaceShip.addChild(magnets)
//       // self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
//       // Timer.scheduledTimer(timeInterval: 25, target: self, selector: #selector(magnetEffect), userInfo: nil, repeats: false)
    }


    @objc func removeObjs(){
        
        Timer.scheduledTimer(timeInterval: 13.5, target: self, selector: #selector(Blink), userInfo: nil, repeats: false)
        
        Timer.scheduledTimer(timeInterval: 16, target: self, selector: #selector(RemoveObjectsOfSpeedUp), userInfo: nil, repeats: false)
        
    }
    
    func speedupscore(){
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(SpeedUpworking), userInfo: nil, repeats: false)
    }
    
    @objc func SpeedUpworking(){
        
        Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(increaseScore), userInfo: nil, repeats: false)
        
        counterForSpeedUp += 1
        
        if counterForSpeedUp < 140{
            
            speedupscore()
            
        }
        
    }
    
    @objc func RemoveObjectsOfSpeedUp(){
        
        spaceShip.alpha = 1
        spaceShip.physicsBody?.contactTestBitMask = ColliderType.object.rawValue
        ground2.removeFromParent()
        
    }
    
    @objc func Blink(){
        
            spaceShip.alpha = 1

        Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(BlinkAgain), userInfo: nil, repeats: false)
        
    }
    
    @objc func BlinkAgain(){
        
        BlinkCounter += 1
        
        if BlinkCounter < 5{
            spaceShip.alpha = 0.5
            
            Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(Blink), userInfo: nil, repeats: false)
        }
        
    }
    
    @objc func speedUPPipes(){
        
        let moveObstacles = SKAction.move(by: CGVector(dx: -2 * self.frame.width , dy: 0), duration: TimeInterval(self.frame.width / 150 ))
        
        pipe.run(moveObstacles)
        
        pipe2.run(moveObstacles)
        
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(repeatSpeedUp), userInfo: nil, repeats: false)
        
        Timer.scheduledTimer(timeInterval: TimeInterval(0.5), target: self, selector: #selector(self.makePipes), userInfo: nil, repeats: false)
        
    }
    
    @objc func repeatSpeedUp(){
        
        speedUPCOUNTER += 1
        
        if speedUPCOUNTER < 30{
            
            speedUPPipes()
            
        }else{
            runPipes = true
        }
        
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    

    
      override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self){
            
            let nodeTouched = self.nodes(at: location)
            
            if nodeTouched.first?.name == "shoot"{
                
                shootme()
                
            }else if nodeTouched.first?.name == "UsePower"{
           
                if PurchasedPowers != 0{
                GiveMePower()
                }
            }
        
        
//animate()
        
        if gameIsOver == false{
            
    // touched = true
            
            if gravity == true && nodeTouched.first?.name != "shoot"{
                
                if gameHasStarted == false{
                    
                    gameStarted = true
                    
                    gameHasStarted = true
                }
                if gameStarted == true{
                    
                    setupgame()
                    
                    gameStarted = false
                    
                }
                
                 scoreIsenabled = true
                
                spaceShip.physicsBody?.isDynamic = true
            
            spaceShip.physicsBody?.velocity = CGVector(dx: 0, dy: 0)

                
              if spaceShipCurrentTexture == 1{
                    
                    spaceShipDy = 45
                    
                }else if spaceShipCurrentTexture == 4{
                    
                    spaceShipDy = 50
                    
                }else if spaceShipCurrentTexture == 3{
                    
                    spaceShipDy = 100
                    
                }else if spaceShipCurrentTexture == 2{
                    
                    spaceShipDy = 42
                    
                }else if spaceShipCurrentTexture == 5{
                    
                    spaceShipDy = 25
                    
                }else{
                    
                    spaceShipDy = 37//60
                    
                }
                spaceShip.physicsBody?.applyImpulse(CGVector(dx: 0, dy: spaceShipDy))
            
            spaceShip.zRotation = 0
            
            gameState = true
    
                
            }else if gravity != true && nodeTouched.first?.name != "shoot" {
                
              //  spaceShip = SKSpriteNode(texture: spaceShipTexture2)
                if spaceShipCurrentTexture == 1{
                    
                    spaceShipDy = 45
                    
                }else if spaceShipCurrentTexture == 4{
                    
                    spaceShipDy = 50
                    
                }else if spaceShipCurrentTexture == 3{
                    
                    spaceShipDy = 100
                    
                }else if spaceShipCurrentTexture == 2{
                    
                    spaceShipDy = 42
                    
                }else if spaceShipCurrentTexture == 5{
                    
                    spaceShipDy = 25
                    
                }else{
                    
                    spaceShipDy = 37//60
                    
                }
                
                spaceShip.physicsBody?.isDynamic = true
                
                spaceShip.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                
                spaceShip.physicsBody?.applyImpulse(CGVector(dx: 0, dy: -spaceShipDy))
                
                spaceShip.zRotation = 0
                }
        }
     
        }
            
    }
    
    
  
    
   /* override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touched = false
    }*/
   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
   @objc func collideWIthObject(){
       
                gameIsOver = true
                self.speed = 0
    
//self.isPaused = true

                if gameIsOver == true{
                    if let explossion = SKEmitterNode(fileNamed: "Explosion.sks"){
                        explossion.position = spaceShip.position
                        
                        self.addChild(explossion)
                            spaceShip.removeFromParent()
                    }
                    Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(returnBack), userInfo: nil, repeats: false)
                    
                  PlayAudio.pause()
            PlayAudio.currentTime = 0
                    
                    if UserDefaults.standard.bool(forKey: "musicState") == true{
                    explosionAudio.play()
                    }
                 
                   self.meteorTimer.invalidate()
                    
                    if recordData == nil {
                        
                        saveScore = round(10*score)/10
                        
                        let userDefaults = Foundation.UserDefaults.standard
                        
                        userDefaults.set(saveScore, forKey: "Record")
                        
                    } else {
                      
                        let newScore = (round(10*score)/10)
                        let record:Double = Double(recordData)!.rounded()
                        
                        if newScore > record{
                            
                            let userDefaults = Foundation.UserDefaults.standard
                            
                            userDefaults.set(newScore, forKey: "Record")
                            
                        }
                    }
                    
                    let CoinsuserDefaults = Foundation.UserDefaults.standard
                    
                    CoinsuserDefaults.set(labelCoins.text, forKey: "coin")
        
        }
            //}
        
        
    }

    @objc func returnBack(){
        
        let val = UserDefaults.standard.string(forKey: "Record")
        if val == nil{
     
            score = round(10*score)/10
            let lastScore = score
            lastLabel.text = " New Record You Traveled \(lastScore) Light Years"
           // lastLabel.alpha = 0
            //lastView.alpha = 0
            //gameover.alpha = 0
            lastView.isHidden = false
            lastLabel.isHidden = false
          
            gameover.text = "CONGRATULATIONS"
            gameover.isHidden = false
        
            Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(loadView), userInfo: nil, repeats: false)
            
        }
        if val != nil && score > Double(val!)!  {
            
            score = round(10*score)/10
            let lastScore = score
        //    lastLabel.alpha = 0
          //  lastView.alpha = 0
            //gameover.alpha = 0
            lastLabel.text = " New Record You Traveled \(lastScore) Light Years"
            lastView.isHidden = false
            lastLabel.isHidden = false
          
            gameover.text = "CONGRATULATIONS"
            gameover.isHidden = false
   
            Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(loadView), userInfo: nil, repeats: false)
            
            
        }else{
            
        score = round(10*score)/10
        let lastScore = score
    //        lastLabel.alpha = 0
      //      lastView.alpha = 0
        //    gameover.alpha = 0
        lastLabel.text = "You Traveled \(lastScore) Light Years"
lastView.isHidden = false

        lastLabel.isHidden = false
        gameover.isHidden = false
    
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(loadView), userInfo: nil, repeats: false)
        }
    
        //self.scene?.view?.isPaused = true
    
    }
    ///////SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE SCORE /////////
    @objc func increaseScore(){
               if scoreIsenabled == true{
        if gameIsOver == false{
                
                score += 0.1
       score = round(10*score)/10
            scoreLabel.text = "Light Years: \(score)"
            
        }
        }
        
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    @objc func loadView(){
     
     if let view = self.view {
            // Load the SKScene from 'GameScene.sks'
            if let scene = GameScene(fileNamed: "homeScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .fill // resizefill works fine
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
        
           }
        
    }
    
   @objc func coinsDidGet(coin: SKSpriteNode, spaceShi: SKSpriteNode){
      if giveMeCoin{
            coin.removeFromParent()
    
        newCoins += 1
        labelCoins.text = String(newCoins)
        giveMeCoin = false
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(givemecoin), userInfo: nil, repeats: false)
       }
    }
    
   @objc func givemecoin(){
        giveMeCoin = true
    }
   
@objc func isItAnti(){
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
    
//    @objc func changeLevel(){
    
    
    
//      Level += 1
//
//        if Level == 1{
//            GalaxyLabel.text = "Milky Way"
//            LevelLabel.text = "Level 1"
//            bag.texture = SKTexture(imageNamed: "Lv1.png")
//        }else if Level == 2{
//            GalaxyLabel.text = "Andromeda"
//            LevelLabel.text = "Level 2"
//            bag.texture = SKTexture(imageNamed: "Lv2.png")
//        }else if Level == 3{
//            GalaxyLabel.text = "Black Eye"
//            LevelLabel.text = "Level 3"
//            bag.texture = SKTexture(imageNamed: "Lv3.png")
//        }else if Level == 4{
//            GalaxyLabel.text = "Whirlpool"
//            LevelLabel.text = "Level 4"
//            bag.texture = SKTexture(imageNamed: "Lv4.png")
//        }else if Level == 5{
//            GalaxyLabel.text = "Centaurus"
//            LevelLabel.text = "Level 5"
//            bag.texture = SKTexture(imageNamed: "Lv5.png")
//        }else if Level == 6{
//            GalaxyLabel.text = "Universe Conqured"
//            LevelLabel.text = "Infinity"
//        }
//
//        let moveGround = SKAction.move(by: CGVector(dx: self.frame.minX * 2, dy: 0), duration: 3)
//        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(showLabel), userInfo: nil, repeats: false)
//        bag.size = CGSize(width: self.frame.width, height: self.frame.height)
//        bag.position = CGPoint(x: self.frame.maxX + self.frame.width / 2, y: self.frame.midY)
//        bag.zPosition = -2
//        bag.run(moveGround)
//        bag.alpha = 0.5
//        self.addChild(bag)
//
//    }
//
//    @objc func showLabel(){
//        let fadeAction = SKAction.fadeOut(withDuration: 2)
//        GalaxyLabel.alpha = 1
//        LevelLabel.alpha = 1
//        GalaxyLabel.run(fadeAction)
//        LevelLabel.run(fadeAction)
//    }
//
    override func update(_ currentTime: TimeInterval) {
      /*  // Called before each frame is rendered
        
        //metemitter.position = CGPoint(x: meteor.position.x, y: meteor.position.y)
        
        if pipe.position.x < self.frame.midX - self.frame.width / 2 {
            
            self.pipe.removeFromParent()
            
        }
        
        if pipe2.position.x < self.frame.midX - self.frame.width / 2 {
            
            self.pipe2.removeFromParent()
            
        }
        
        if meteor.position.x < self.frame.minX - self.frame.width / 4 || meteor.position.x > self.frame.maxX + self.frame.width / 4{
            
            self.meteor.removeFromParent()
            self.metemitter.removeFromParent()
            
        }
        
        if coins.position.x < self.frame.midX - self.frame.width / 2 {
            
            self.coins.removeFromParent()
            
        }
        if currentPowerUp.position.x < self.frame.midX - self.frame.width / 2 {
            
            self.currentPowerUp.removeFromParent()
            
        }
        */
        if gameIsOver == true{
            self.physicsWorld.speed = 0
        }
        
        if bullet.position == CGPoint(x: self.frame.midX + self.frame.width / 2, y: bullet.position.y){
         bullet.removeFromParent()
        }
        
        if spaceShip.position.x != currentPosition.x{
            spaceShip.position.x = currentPosition.x
        }
        if spaceShip.position.y <= self.frame.midY - self.frame.height / 2 + 10 {
  spaceShip.physicsBody?.applyImpulse(CGVector(dx: 0, dy: spaceShipDy))
            
        }
        
        
        if UserDefaults.standard.object(forKey: "Powers") as? Int != nil{
            if  UserDefaults.standard.object(forKey: "Powers") as! Int == 0{
                
                UsePower.isHidden = true
                
            }
        }else{
            UsePower.isHidden = true
        }
        
}
    
    @objc func removeantigravitynodeandenablegravity(){

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
    
    @objc func enableGravity(){
        
            self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
         _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.makeitInvisible), userInfo: nil, repeats: false)
    }
    
    @objc func makeitInvisible(){
    
    antiGravity.isHidden = true
        
        gravityNode.isHidden = true
        
    }
    
   @objc func repeatBullets(){

        shootIsActive = true
        
    }
    
   @objc func meteorAndBulet(bullet: SKSpriteNode, meteors: SKSpriteNode){
        
        bullet.removeFromParent()
        meteors.removeFromParent()
       // metemitter.removeFromParent()
        if UserDefaults.standard.bool(forKey: "musicState") == true{
        MeteorBlast.play()
        }
        if let explossion = SKEmitterNode(fileNamed: "Explosion.sks"){
            explossion.position = meteors.position
            self.addChild(explossion)
            
        }
        
    }
    
   @objc func shootme(){
        
       if shootIsActive {
        if UserDefaults.standard.bool(forKey: "musicState") == true{
        BulletAudio.play()
        }
            if spaceShipCurrentTexture >= 3{
            bulletText = SKTexture(imageNamed: "bullet 2.png")
            }else{
        bulletText = SKTexture(imageNamed: "rectangle copy.png")
            }
            if spaceShipCurrentTexture == 4{
                if i < 4 {
                    Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(shootme), userInfo: nil, repeats: false)
                    bulletForSpaceShip4()
                i += 1
                }else if i == 4{
                    i = 1
                    Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(shootme), userInfo: nil, repeats: false)
                    bulletForSpaceShip4()
                }
            }else{

            bullet = SKSpriteNode(texture: bulletText)
            bullet.position = CGPoint(x: spaceShip.position.x + spaceShip.frame.width / 2 + 30, y: spaceShip.position.y)
            bullet.setScale(0.3)
            let moveBullet = SKAction.move(by: CGVector(dx: self.frame.width,dy: 0), duration: 1)
            bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.frame.size)
            bullet.physicsBody?.categoryBitMask = ColliderType.bullet.rawValue
            bullet.physicsBody?.contactTestBitMask = ColliderType.meteor.rawValue
            bullet.physicsBody?.collisionBitMask = ColliderType.none.rawValue
            bullet.physicsBody?.isDynamic = false
            bullet.physicsBody?.affectedByGravity = false
            bullet.physicsBody?.restitution = 0
            bullet.physicsBody?.linearDamping = 0
            bullet.run(moveBullet)
            self.addChild(bullet)
                
            }
            if spaceShipCurrentTexture == 2{
                repeatTime = Int(0.5)
            }
                 shootIsActive = false
            Timer.scheduledTimer(timeInterval: TimeInterval(repeatTime), target: self, selector: #selector(repeatBullets), userInfo: nil, repeats: false)
            
       }
        
    }
    
    @objc func  GiveMePower(){
        
        if PurchasedPowers != nil || PurchasedPowers != 0{
            
            if PurchasedPowers == 1{
                speeduppower(speedup: currentPowerUp, spaceShi0: spaceShip)
                UsePurchasePowerUp = "SpeedUp"
                //currentPowerUp = magnet
                PowerUsed = true
                
                _ =  UserDefaults.standard.set(true, forKey: "CanBuy")
            }else if PurchasedPowers == 2{
                speeduppower(speedup: currentPowerUp, spaceShi0: spaceShip)
                UsePurchasePowerUp = "Magnet"
                //currentPowerUp = magnet
                PowerUsed = true
                
                _ =  UserDefaults.standard.set(true, forKey: "CanBuy")
            }else if PurchasedPowers == 3{
                
                if spaceShipCurrentTexture != 5{
                    speeduppower(speedup: currentPowerUp, spaceShi0: spaceShip)
                    UsePurchasePowerUp = "PowerBullet"
                    // currentPowerUp = PowerBullet
                    PowerUsed = true
                    
                    _ =  UserDefaults.standard.set(true, forKey: "CanBuy")
                }else{
                    errorLabel.text = "You cannot use this power up with this ship"
                    errorLabel.alpha = 1
                    Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(removeErrorLabel), userInfo: nil, repeats: false)
                }
            }
            
        }else{
            
            
        }
        
    }
    
    @objc func removeErrorLabel(){
        UIView.animate(withDuration: 1, animations: {
            self.errorLabel.alpha = 0
            })
        
    }
    
   @objc func bulletForSpaceShip4(){
        if shootIsActive{
        bullet = SKSpriteNode(texture: bulletText)
           let bullet2 = SKSpriteNode(texture: bulletText)
            let bullet3 = SKSpriteNode(texture: bulletText)
        bullet.position = CGPoint(x: spaceShip.position.x + spaceShip.frame.width / 2 + 30, y: spaceShip.position.y)
            bullet2.position = CGPoint(x: spaceShip.position.x + spaceShip.frame.width / 2 + 30, y: spaceShip.position.y)
            bullet3.position = CGPoint(x: spaceShip.position.x + spaceShip.frame.width / 2 + 30, y: spaceShip.position.y)
        bullet.setScale(0.3)
        bullet2.setScale(0.3)
            bullet3.setScale(0.3)
       
            moveBullet = SKAction.move(by: CGVector(dx: self.size.width + 30,dy: 0), duration: 1)
        
         let moveBullet2 = SKAction.move(by: CGVector(dx: self.size.width + 30,dy: self.frame.maxY), duration: 1)
      
             let moveBullet3 = SKAction.move(by: CGVector(dx: self.size.width + 30,dy: self.frame.minY), duration: 1)

            bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.frame.size)
        bullet.physicsBody?.categoryBitMask = ColliderType.bullet.rawValue
        bullet.physicsBody?.contactTestBitMask = ColliderType.meteor.rawValue
        bullet.physicsBody?.collisionBitMask = ColliderType.none.rawValue
        bullet.physicsBody?.isDynamic = false
        bullet.physicsBody?.affectedByGravity = false
        bullet.physicsBody?.restitution = 0
        bullet.physicsBody?.linearDamping = 0
        bullet.run(SKAction.repeatForever(moveBullet))
        self.addChild(bullet)
          
          bullet2.physicsBody = SKPhysicsBody(rectangleOf: bullet.frame.size)
          bullet2.physicsBody?.categoryBitMask = ColliderType.bullet.rawValue
          bullet2.physicsBody?.contactTestBitMask = ColliderType.meteor.rawValue
          bullet2.physicsBody?.collisionBitMask = ColliderType.none.rawValue
          bullet2.physicsBody?.isDynamic = false
          bullet2.physicsBody?.affectedByGravity = false
          bullet2.physicsBody?.restitution = 0
          bullet2.physicsBody?.linearDamping = 0
          bullet2.run(SKAction.repeatForever(moveBullet2))
          self.addChild(bullet2)
         
              bullet3.physicsBody = SKPhysicsBody(rectangleOf: bullet.frame.size)
              bullet3.physicsBody?.categoryBitMask = ColliderType.bullet.rawValue
              bullet3.physicsBody?.contactTestBitMask = ColliderType.meteor.rawValue
              bullet3.physicsBody?.collisionBitMask = ColliderType.none.rawValue
              bullet3.physicsBody?.isDynamic = false
              bullet3.physicsBody?.affectedByGravity = false
              bullet3.physicsBody?.restitution = 0
              bullet3.physicsBody?.linearDamping = 0
              bullet3.run(SKAction.repeatForever(moveBullet3))
              self.addChild(bullet3)
        }
    }
    
}
