//
//  TransformTwoViewController.swift
//  Transformation
//
//  Created by mac on 02.10.2021.
//

/*
 Place a square on the screen.
 Make it increase or decrease in size by moving your finger on it.
 That is, when you click on it (or in any area of ​​the screen) and
 further move your finger across the screen, change its size by
 following your finger.
*/

import UIKit

class TransformationByGestureRecognizerViewController: UIViewController {
    
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
        
        let translatedGestureRecognizer = UIPanGestureRecognizer(
            target: self,
            action: #selector(rectangleTranslated(_:))
        )
        let compressionGestureRecognizer = UIPanGestureRecognizer(
            target: self,
            action: #selector(rectangleСompression(_:))
        )
        let rotationhGestureRecognizer = UIRotationGestureRecognizer(
            target: self,
            action: #selector(rectangleRotation(_:))
        )
        view.addGestureRecognizer(compressionGestureRecognizer)
        rectangle.addGestureRecognizer(translatedGestureRecognizer)
        rectangle.addGestureRecognizer(rotationhGestureRecognizer)
        
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
    
    @objc private func rectangleTranslated(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        sender.setTranslation(.zero, in: self.view)
    }
    
    @objc private func rectangleСompression(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
            view.transform = view.transform.scaledBy(x: translation.x/10000+1, y: translation.x/10000+1)
        }
    }
    
    @objc private func rectangleRotation(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0.05
        }
    }
}

