//
//  GameScene.swift
//  orbitaSpriteKit
//
//  Created by Kaua Miguel on 14/07/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        let noCentral = SKSpriteNode(color: .blue, size: CGSize(width: 30, height: 30))
        noCentral.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(noCentral)
        
        let noOrbitando =  SKSpriteNode(color: .red, size: CGSize(width: 30, height: 30))
        noOrbitando.position = CGPoint(x: frame.midX + 100, y: frame.minY)
        addChild(noOrbitando)
        
        let acaoDeRotacao = SKAction.rotate(byAngle: CGFloat.pi * 2, duration: 4)
        let repetirAcao = SKAction.repeatForever(acaoDeRotacao)
        
        //Acao de rotacionar em torno do ponto central
        
        let acaoDeMover = SKAction.customAction(withDuration: 4, actionBlock: { node, elapsedTime in
            let angle = elapsedTime / CGFloat(4) * CGFloat.pi * 2
            //100 é o raio da circunferencia
            let x = cos(angle) * CGFloat(100)
            let y = sin(angle) * CGFloat(100)
            node.position = CGPoint(x: noCentral.position.x + x, y: noCentral.position.y + y)
        })
        
        
        noOrbitando.run(repetirAcao)
        noOrbitando.run(SKAction.repeatForever(acaoDeMover))
    }
}
