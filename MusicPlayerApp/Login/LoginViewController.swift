//
//  LoginViewController.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/15/22.
//

import UIKit

final class LoginViewController: UIViewController, Layouting {
	typealias ViewType = LoginView
	override func loadView() {
		view = ViewType.create()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		layoutableView.signinButton.addTarget(self, action: #selector(didTapsigninButton), for: .touchUpInside)
	}
}

// MARK: - Actions
extension LoginViewController {
	
	@objc func didTapsigninButton() {
		layoutableView.signinButton.isSelected.toggle()
		self.navigationController?.pushViewController(SignInViewController(), animated: true)
	}
	
}
