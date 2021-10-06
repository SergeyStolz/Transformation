//
//  AppDelegate.swift
//  Transformation
//
//  Created by mac on 02.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window?.rootViewController = TabBarController()
        self.window?.makeKeyAndVisible()
        return true
    }
}
