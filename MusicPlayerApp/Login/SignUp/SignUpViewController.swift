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
		
		guard checkAllFields() else {
			showAlert(alertMessage: "Please enter all fields")
			return
		}
		
		guard checkConfirm() else {
			showAlert(alertMessage: "Passwords do not match")
			return
		}
		
		self.navigationController?.pushViewController(SongListViewController(), animated: true)
		saveUserInfoToUserDefault()
	}
	
	func saveUserInfoToUserDefault() {
		
		let defaults = UserDefaults.standard
		defaults.set(layoutableView.mailTextField.text, forKey: "email")
		defaults.set(layoutableView.passwordTextField.text, forKey: "password")
		
	}
}

// MARK: - Helpers
extension SignUpViewController {
	
	func showAlert (alertMessage: String) {
		
		let alert = UIAlertController(title: "ERROR!", message: alertMessage, preferredStyle: UIAlertController.Style.alert)
		alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
		self.present(alert, animated: true, completion: nil)
		
	}
	
	func checkAllFields() -> Bool {
		
		guard layoutableView.mailTextField.text != nil && layoutableView.mailTextField.text != "" else {return false}
		guard layoutableView.nameTextField.text != nil && layoutableView.nameTextField.text != "" else {return false}
		guard layoutableView.surnameTextField.text != nil && layoutableView.surnameTextField.text != "" else {return false}
		guard layoutableView.passwordTextField.text != nil && layoutableView.passwordTextField.text != "" else {return false}
		guard layoutableView.confirmPasswordTextField.text != nil && layoutableView.passwordTextField.text != "" else {return false}
		return true
		
	}
	
	func checkConfirm() -> Bool {
		
		guard layoutableView.passwordTextField.text == layoutableView.confirmPasswordTextField.text else {return false}
		return true
	}
}
