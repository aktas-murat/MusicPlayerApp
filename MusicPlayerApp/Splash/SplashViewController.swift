//
//  ViewController.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/2/22.
//

import UIKit

final class SplashViewController: UIViewController, Layouting {
	
	typealias ViewType = SplashView
	
	override func loadView() {
		view = ViewType.create()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		layoutableView.activityIndicator.startAnimating()
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			self.layoutableView.activityIndicator.stopAnimating()
			self.navigationController?.pushViewController(SongListViewController(), animated: true)
		}
	}
	
}
