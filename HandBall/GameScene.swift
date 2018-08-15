//
//  GameScene.swift
//  HandBall
//
//  Created by Jeremy Greer on 8/15/18.
//  Copyright © 2018 Grizzle. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    

    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.cyan
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        addBall()
    }
    
    func addBall() {
        let ball = SKShapeNode(circleOfRadius: CGFloat(50))
        ball.strokeColor = SKColor.darkGray
        ball.fillColor = SKColor.gray
        ball.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(50))
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.restitution = 0.5
        ball.physicsBody?.affectedByGravity = false
        addChild(ball)
        ball.physicsBody?.applyImpulse(CGVector(dx: 200, dy: 200))
    }

    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
    }
}
