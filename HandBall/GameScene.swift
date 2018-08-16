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
   
    private var isTouchingPaddle = false

    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor.black
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        addBall()
        addPaddle()
    }
    
    func addPaddle() {
        let paddle = SKShapeNode(rect: CGRect(x: -100, y: -25, width: 200, height: 50))
        paddle.name = "paddle"
        paddle.fillColor = SKColor.darkGray
        paddle.strokeColor = SKColor.black
        paddle.position = CGPoint(x: frame.midX, y: frame.midY - 100)
        
        paddle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 200, height: 50))
        // paddle.physicsBody?.affectedByGravity = false
        // paddle.physicsBody?.allowsRotation = false
        // paddle.physicsBody?.restitution = 1.0
        paddle.physicsBody?.isDynamic = false
        addChild(paddle)
    }
    
    func addBall() {
        let ballSize = CGFloat(50)
        let ball = SKShapeNode(circleOfRadius: ballSize)
        ball.strokeColor = SKColor.black
        ball.fillColor = SKColor.cyan
        ball.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ballSize)
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.restitution = 1.0
        ball.physicsBody?.affectedByGravity = true
        // ball.physicsBody?.friction = 0.0
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
        if let touch = touches.first {
            if let body = getTouchedBody(touch) {
                if body.node?.name == "paddle" {
                    self.isTouchingPaddle = true
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if self.isTouchingPaddle {
                let paddle = self.childNode(withName: "paddle")
                let point = getPointFromTouch(touch)
                paddle?.position.x = point.x
                paddle?.position.y = min(point.y, frame.height / 3)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // if let touch = touches.first {
        //     if let body = getTouchedBody(touch) {
        //         let shove = CGVector(dx: 23.0, dy: 100.0)
        //         let point = getPointFromTouch(touch)
        //         body.applyImpulse(shove, at: point)
        //     }
        // }
        self.isTouchingPaddle = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
    }
}
