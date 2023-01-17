//
//  AppDelegate.swift
//  ViperPages
//
//  Created by Alex Shirazi on 1/15/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        
        let router = List_Router.Init()
        let initalViewController = router.entry!
        let navigation = UINavigationController()
        navigation.viewControllers = [initalViewController]

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = navigation
        
        
        return true
    }

}

