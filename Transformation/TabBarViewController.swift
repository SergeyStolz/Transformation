//
//  TabBarViewController.swift
//  Transformation
//
//  Created by mac on 02.10.2021.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(
                for: TransformationBySliderViewController(),
                   title: NSLocalizedString("Transformation by slider ", comment: ""),
                   image: UIImage(systemName: "cube.transparent")!
            ),
            createNavController(
                for: TransformationByGestureRecognizerViewController(),
                   title: NSLocalizedString("Transformation by GestureRecognizer", comment: ""),
                   image: UIImage(systemName: "cube.transparent")!
            ),
            createNavController(
                for: RotationViewController(),
                   title: NSLocalizedString("Rotation", comment: ""),
                   image: UIImage(systemName: "cube.transparent.fill")!
            )
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        return navController
    }
    
}
