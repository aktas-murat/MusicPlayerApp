//
//  SignupViewController.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/19/22.
//

import UIKit

final class SignUpViewController: UIViewController, Layouting {
	
	typealias ViewType = SignUpView
	override func loadView() {
		view = ViewType.create()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		layoutableView.signUpButton.addTarget(self, action: #selector(didTapsignUpButton), for: .touchUpInside)
	}
	
}

// MARK: - Actions
extension SignUpViewController {
	
	@objc func didTapsignUpButton() {
		layoutableView.signUpButton.isSelected.toggle()
		self.navigationController?.pushViewController(SignInViewController(), animated: true)
	}
	
}
