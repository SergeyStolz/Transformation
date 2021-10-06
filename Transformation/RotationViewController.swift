//
//  TransformThreeViewController.swift
//  Transformation
//
//  Created by mac on 02.10.2021.
//

/*
 Place a square on the screen.
 Make it rotate with your finger, that is,
 when you press on it (or in any area of ​​the screen)
 and then move your finger across the screen, rotate
 it following your finger.
*/

import UIKit

class RotationViewController: UIViewController {
    
    private var prevPoint: CGPoint?
    
    private lazy var rectangle: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(rectangle)
        rectangle.center = view.center
        
        let rotationhGestureRecognizer = UIPanGestureRecognizer(
            target: self,
            action: #selector(rectangleRotation(_:))
        )
        
        let compressionGestureRecognizer = UIPinchGestureRecognizer(
            target: self,
            action: #selector(rectangleCompression(_:))
        )
        
        view.addGestureRecognizer(rotationhGestureRecognizer)
        view.addGestureRecognizer(compressionGestureRecognizer)
        setupViews()
    }
    
    private func setupViews() {
        NSLayoutConstraint.activate([
            rectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rectangle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rectangle.widthAnchor.constraint(equalToConstant: 200),
            rectangle.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func angle(_ angle3:  CGFloat, _ angle2:  CGFloat) -> CGFloat {
        let angleInDegrees = (angle2 - angle3)
        return angleInDegrees
    }
    
    @objc private func rectangleRotation(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            prevPoint = gesture.location(in: self.view)
        case .changed:
            let currentPoint = gesture.location(in: self.view)
            if let prev = prevPoint, gesture.view != nil {
                
                let dY3 = prev.y - view.center.y
                let dX3 = prev.x - view.center.x
                let angleInDegreesA3 = atan(dY3/dX3)
                
                
                let dY2 = currentPoint.y - view.center.y
                let dX2 = currentPoint.x - view.center.x
                let angleInDegreesA2 = atan(dY2/dX2)
                
                let angleInDegreesA1 = angle(angleInDegreesA3, angleInDegreesA2)
                rectangle.transform = rectangle.transform.rotated(by: angleInDegreesA1)
            }
            prevPoint = currentPoint
        case .ended:
            prevPoint = nil
        default :
            ()
        }
    }
    
    @objc private func rectangleCompression(_ gesture: UIPinchGestureRecognizer) {
        if gesture.view != nil {
            rectangle.transform = rectangle.transform.scaledBy(x: gesture.scale, y: gesture.scale)
            gesture.scale = 1
        }
    }
}
