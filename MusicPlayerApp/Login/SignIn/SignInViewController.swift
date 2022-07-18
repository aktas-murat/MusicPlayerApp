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
		layoutableView.signinButton.addTarget(self, action: #selector(didTapsigninButton), for: .touchUpInside)
		layoutableView.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
		
		layoutableView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView(_:))))
			   layoutableView.isUserInteractionEnabled = true
	}
}

// MARK: - Actions
extension SignInViewController {
	
	@objc func didTapsigninButton() {
	    
		guard checkUser() else {
			showAlert(alertMessage: "Email or Password is incorrect")
			return
		}
		  
		self.navigationController?.pushViewController(SongListViewController(), animated: true)
	}
	
	@objc func didTapBackButton() {
		
		self.navigationController?.popViewController(animated: true)
		
	}
	
	@objc func didTapView (_ sender: UITapGestureRecognizer) {
		print("ClickCheck")
		let userEmail = UserDefaults.standard.object(forKey: "email") as? String ?? ""
		let password = UserDefaults.standard.object(forKey: "password") as? String ?? ""
		print(userEmail)
		print(password)
		
		layoutableView.endEditing(true)
	}
	
}

// MARK: - Helpers
extension SignInViewController {
	
	func showAlert (alertMessage: String) {
		
		let alert = UIAlertController(title: "ERROR!", message: alertMessage, preferredStyle: UIAlertController.Style.alert)
		alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
		self.present(alert, animated: true, completion: nil)
		
	}
	
	func checkUser () -> Bool {
		
		let userEmail = UserDefaults.standard.object(forKey: "email") as? String ?? ""
		let userPassword = UserDefaults.standard.object(forKey: "password") as? String ?? ""
		
		guard userEmail == layoutableView.mailTextField.text else {return false}
		guard userPassword == layoutableView.passwordTextField.text else {return false}
		return true
	
	}
}
