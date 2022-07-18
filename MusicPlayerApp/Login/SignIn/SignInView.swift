//
//  SignInView.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/19/22.
//

import UIKit

final class SignInView: UIView, Layoutable {
	
	lazy var navigationLabel: UILabel = {
		
		let navigationLabel = UILabel()
//		navigationLabel.backgroundColor = .blue
		return navigationLabel
	}()
	
	lazy var backButton: UIButton = {
		
		let backButton = UIButton()
		backButton.setImage(UIImage(named: "backimage"), for: .normal)
//		backButton.backgroundColor = .white
		return backButton
		
	}()
	
	lazy var loginImageView: UIImageView = {
		let loginImageView = UIImageView()
		loginImageView.image = UIImage(named: "imagesignin")
		return loginImageView
	}()
	
	lazy var signinButton: UIButton = {
		let signinButton = UIButton()
		signinButton.setTitle("Sign in", for: .normal)
		signinButton.layer.cornerRadius = 15
		signinButton.setTitleColor(.black, for: .normal)
		signinButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
		signinButton.backgroundColor = .white
		
		return signinButton
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
		
		return passwordTextField
		
	}()
	
	func setupViews() {
		
		addSubview(loginImageView)
		addSubview(signinButton)
		addSubview(mailTextField)
		addSubview(passwordTextField)
		addSubview(navigationLabel)
		addSubview(backButton)
		
	}
	
	func setupLayout() {
		
		loginImageView.snp.makeConstraints { make in
			
			make.edges.equalToSuperview()
		}
		
		signinButton.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.width.equalTo(140)
			make.height.equalTo(45)
			make.bottom.equalToSuperview().inset(200)
		}
		
		mailTextField.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.bottom.equalTo(signinButton.snp.top).offset(-140)
			make.height.equalTo(50)
			make.width.equalTo(250)
		}
		passwordTextField.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.top.equalTo(mailTextField.snp.bottom).offset(20) 
			make.height.equalTo(50)
			make.width.equalTo(250)
		}
		
		navigationLabel.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.height.equalTo(100)
			make.width.equalToSuperview()
		}
		
		backButton.snp.makeConstraints { make in
			make.width.height.equalTo(30)
			make.left.equalToSuperview().inset(30)
			make.bottom.equalTo(navigationLabel.snp.bottom).offset(-5)
		}
		
	}
	
}
