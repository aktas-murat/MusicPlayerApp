//
//  SignUpView.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/19/22.
//

import UIKit

final class SignUpView: UIView, Layoutable {
	
	lazy var signUpImageView: UIImageView = {
		
		let signUpImageView = UIImageView()
		signUpImageView.image = UIImage.init(named: "imagesignin")
		return signUpImageView
		
	}()
	
	lazy var signUpButton: UIButton = {
		let signupButton = UIButton()
		signupButton.setTitle("Sign up", for: .normal)
		signupButton.layer.cornerRadius = 15
		signupButton.setTitleColor(.black, for: .normal)
		signupButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
		signupButton.backgroundColor = .white
		
		return signupButton
	}()
	
	lazy var nameTextField: UITextField = {
		let nameTextField = UITextField()
		nameTextField.borderStyle = UITextField.BorderStyle.roundedRect
		nameTextField.placeholder = "Name"
		nameTextField.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
		nameTextField.textColor = .black
		nameTextField.backgroundColor = .white
		nameTextField.textAlignment = .center
		
		return nameTextField
	}()
	
	lazy var surnameTextField: UITextField = {
		let surnameTextField = UITextField()
		surnameTextField.borderStyle = UITextField.BorderStyle.roundedRect
		surnameTextField.placeholder = "Surname"
		surnameTextField.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
		surnameTextField.textColor = .black
		surnameTextField.backgroundColor = .white
		surnameTextField.textAlignment = .center
		
		return surnameTextField
	}()
	
	lazy var mailTextField: UITextField = {
		let mailTextField = UITextField()
		mailTextField.borderStyle = UITextField.BorderStyle.roundedRect
		mailTextField.placeholder = "Email"
		mailTextField.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
		mailTextField.textColor = .black
		mailTextField.backgroundColor = .white
		mailTextField.textAlignment = .center
		
		return mailTextField
	}()
	
	lazy var passwordTextField: UITextField = {
		let passwordTextField = UITextField()
		passwordTextField.placeholder = "Password"
		passwordTextField.isSecureTextEntry = true
		passwordTextField.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
		passwordTextField.textColor = .black
		passwordTextField.backgroundColor = .white
		passwordTextField.textAlignment = .center
		passwordTextField.isSecureTextEntry = true
		
		return passwordTextField
		
	}()
	
	lazy var confirmPasswordTextField: UITextField = {
		let confirmPasswordTextField = UITextField()
		confirmPasswordTextField.placeholder = "Confirm Password"
		confirmPasswordTextField.isSecureTextEntry = true
		confirmPasswordTextField.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
		confirmPasswordTextField.textColor = .black
		confirmPasswordTextField.backgroundColor = .white
		confirmPasswordTextField.textAlignment = .center
		confirmPasswordTextField.isSecureTextEntry = true
		
		return confirmPasswordTextField
		
	}()
	
	func setupViews() {
		addSubview(signUpImageView)
		addSubview(signUpButton)
		addSubview(nameTextField)
		addSubview(surnameTextField)
		addSubview(mailTextField)
		addSubview(passwordTextField)
		addSubview(confirmPasswordTextField)
	}
	
	func setupLayout() {
		
		signUpImageView.snp.makeConstraints { make in
		 make.edges.equalToSuperview()
		}
		
		signUpButton.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.width.equalTo(140)
			make.height.equalTo(45)
			make.bottom.equalToSuperview().inset(120)
		}
		
		confirmPasswordTextField.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(signUpButton.snp.top).offset(-50)
			make.height.equalTo(50)
			make.width.equalTo(250)
		}
		passwordTextField.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(confirmPasswordTextField.snp.top).offset(-20)
			make.height.equalTo(50)
			make.width.equalTo(250)
		}
		
		mailTextField.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(passwordTextField.snp.top).offset(-20)
			make.height.equalTo(50)
			make.width.equalTo(250)
		}
		
		surnameTextField.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(mailTextField.snp.top).offset(-20)
			make.height.equalTo(50)
			make.width.equalTo(250)
		}
		
		nameTextField.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(surnameTextField.snp.top).offset(-20)
			make.height.equalTo(50)
			make.width.equalTo(250)
		}
		
	}
}
