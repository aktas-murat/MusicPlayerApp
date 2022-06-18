//
//  SignInController.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/19/22.
//

import UIKit

final class SignInViewController: UIViewController, Layouting {
	typealias ViewType = SignInView
	override func loadView() {
		view = ViewType.create()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
}
