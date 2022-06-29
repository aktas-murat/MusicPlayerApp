//
//  ViewController.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/2/22.
//

import UIKit

final class SplashViewController: UIViewController, Layouting, UIGestureRecognizerDelegate {
	
	typealias ViewType = SplashView
	
	override func loadView() {
		view = ViewType.create()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationController?.isNavigationBarHidden = true
		self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
		self.navigationController?.interactivePopGestureRecognizer?.delegate = self
		
		layoutableView.activityIndicator.startAnimating()
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			self.layoutableView.activityIndicator.stopAnimating()
			self.navigationController?.pushViewController(LoginViewController(), animated: true)
		}
	}
	
}
