//
//  AppDelegate.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/2/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow()
		window?.rootViewController = UINavigationController(rootViewController: SplashViewController())
		window?.makeKeyAndVisible()
		
		return true
		
	}
	
}
