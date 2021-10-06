//
//  TransformOneViewController.swift
//  Transformation
//
//  Created by mac on 02.10.2021.
//
/*
 Create three sliders below the shape.
 The first will be responsible for the angle.
 The second for the compression or extension from 0.1 to 10.
 The third for the X shift from -50 to 50.
*/

import UIKit

class TransformationBySliderViewController: UIViewController {
    
    private lazy var rectangle: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sliderRotation: UISlider = {
        let slider = UISlider()
        slider.isContinuous = true
        slider.tintColor = UIColor.green
        slider.minimumValue = 0.0
        slider.maximumValue = 4
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(self.rectangleRotation(_:)), for: .valueChanged)
         return slider
    }()
    
    private lazy var sliderCompression: UISlider = {
        let slider = UISlider()
        slider.isContinuous = true
        slider.tintColor = UIColor.green
        slider.minimumValue = 0.1
        slider.maximumValue = 1.9
        slider.value = 1
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(self.rectangleСompression(_:)), for: .valueChanged)
        return slider
    }()
    
    private lazy var sliderTranslated: UISlider = {
        let slider = UISlider()
        slider.tintColor = UIColor.green
        slider.isContinuous = true
        slider.minimumValue = -50
        slider.maximumValue = 50
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(self.rectangleTranslated(_:)), for: .valueChanged)
        return slider
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(rectangle)
        view.addSubview(sliderRotation)
        view.addSubview(sliderCompression)
        view.addSubview(sliderTranslated)
        setupViews()
    }
    
    private func setupViews() {
        NSLayoutConstraint.activate([
            rectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rectangle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -230),
            rectangle.widthAnchor.constraint(equalToConstant: 200),
            rectangle.heightAnchor.constraint(equalToConstant: 200),
        ])
        NSLayoutConstraint.activate([
            sliderRotation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sliderRotation.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            sliderRotation.heightAnchor.constraint(equalToConstant: 77),
            sliderRotation.widthAnchor.constraint(equalToConstant: 380)
        ])
        NSLayoutConstraint.activate([
            sliderCompression.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sliderCompression.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            sliderCompression.heightAnchor.constraint(equalToConstant: 77),
            sliderCompression.widthAnchor.constraint(equalToConstant: 380)
        ])
        NSLayoutConstraint.activate([
            sliderTranslated.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sliderTranslated.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            sliderTranslated.heightAnchor.constraint(equalToConstant: 77),
            sliderTranslated.widthAnchor.constraint(equalToConstant: 380)
        ])
    }
    
    @objc func rectangleRotation(_ sender: UISlider!) {
        rectangle.transform = createTransform()
    }
    
    @objc func rectangleСompression(_ sender: UISlider!) {
        rectangle.transform = createTransform()
    }
    
    @objc func rectangleTranslated(_ sender: UISlider!) {
        rectangle.transform = createTransform()
    }
    
    func createTransform() -> CGAffineTransform {
        var transform = CGAffineTransform.identity
        transform = transform.rotated(by: CGFloat.pi * CGFloat(sliderRotation.value))
        transform = transform.scaledBy(x: CGFloat(sliderCompression.value), y: CGFloat(sliderCompression.value))
        transform = transform.translatedBy(x: CGFloat(sliderTranslated.value), y: 0)
        return transform
    }
}
