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
	
}

// MARK: - Helpers
extension SignInViewController {
	
	func showAlert (alertMessage: String) {
		
		let alert = UIAlertController(title: "ERROR!", message: alertMessage, preferredStyle: UIAlertController.Style.alert)
		alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
		self.present(alert, animated: true, completion: nil)
		
	}
	
	func checkUser () -> Bool {
//		let defaults = UserDefaults.standard
		
		let userEmail = UserDefaults.standard.object(forKey: "email") as? String ?? ""
		let userPassword = UserDefaults.standard.object(forKey: "password") as? String ?? ""
		
		guard userEmail == layoutableView.mailTextField.text else {return false}
		guard userPassword == layoutableView.passwordTextField.text else {return false}
		return true
	
	}
}
