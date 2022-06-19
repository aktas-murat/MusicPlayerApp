//
//  SignupViewController.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/19/22.
//

import UIKit

final class SignUpViewController : UIViewController, Layouting {
	
	typealias ViewType = SignUpView
	override func loadView() {
		view = ViewType.create()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
}
