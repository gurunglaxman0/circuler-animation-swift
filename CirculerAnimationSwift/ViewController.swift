//
//  ViewController.swift
//  CirculerAnimationSwift
//
//  Created by Lakshman Gurung on 20/12/17.
//  Copyright © 2017 Lakshman Gurung. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    let animationLayer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(arcCenter: .zero, radius: 125, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true).cgPath
        layer.strokeColor = UIColor.gray.cgColor
        layer.lineWidth = 15
        layer.position = view.center
        layer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(layer)
        
        
        
        animationLayer.path = UIBezierPath(arcCenter: .zero, radius: 125, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true).cgPath
        animationLayer.fillColor = UIColor.clear.cgColor
        animationLayer.strokeColor = UIColor(red: 248/255.0, green: 173/255.0, blue: 0/255.0, alpha: 1.0).cgColor
        animationLayer.lineWidth = 15
        animationLayer.strokeEnd = 0
        animationLayer.position = view.center
        animationLayer.lineCap = kCALineCapRound
        animationLayer.transform =  CATransform3DRotate(animationLayer.transform, -CGFloat.pi/2, 0, 0, 1)
        view.layer.addSublayer(animationLayer)
        
        
        let tapGesture = UITapGestureRecognizer()
        tapGesture.numberOfTapsRequired = 1
        tapGesture.addTarget(self, action: #selector(startAnimation))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func startAnimation(){
        animationLayer.strokeEnd = 0
        let animation = CABasicAnimation()
        animation.fillMode = kCAFillModeForwards
        animation.duration = 3
        animation.fromValue = 0
        animation.toValue = 1
        animation.keyPath = "strokeEnd"
        animation.isRemovedOnCompletion = false
        animationLayer.add(animation, forKey: "drawCircle")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

