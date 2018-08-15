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
        ball.physicsBody?.restitution = 1.0
        ball.physicsBody?.affectedByGravity = false
        // ball.physicsBody?.linearDamping = 0.0
        ball.physicsBody?.friction = 0.0
        addChild(ball)
    }
    
    func getTouchedBody(_ touch: UITouch) -> SKPhysicsBody? {
        return physicsWorld.body(at: getPointFromTouch(touch))
    }

    func getPointFromTouch(_ touch: UITouch) -> CGPoint {
        let location = touch.location(in: self.view)
        let y = size.height - location.y
        return CGPoint(x: location.x, y: y)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if let body = getTouchedBody(touch) {
                let shove = CGVector(dx: 23.0, dy: 100.0)
                let point = getPointFromTouch(touch)
                body.applyImpulse(shove, at: point)
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
    }
}
