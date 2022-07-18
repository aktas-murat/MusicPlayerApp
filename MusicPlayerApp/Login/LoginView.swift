//
//  LoginView.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/15/22.
//

import UIKit

final class LoginView: UIView, Layoutable {
	
	lazy var navigationLabel: UILabel = {
		
		let navigationLabel = UILabel()
//		navigationLabel.backgroundColor = .blue
		return navigationLabel
	}()
	

	
	lazy var logoImageView: UIImageView = {
		
		let logoImageView = UIImageView()
		logoImageView.backgroundColor = .white
		logoImageView.image = UIImage(named: "newlogo")
		return logoImageView
	}()
	
	lazy var signinButton: UIButton = {
		
		let signinButton = UIButton()
		signinButton.backgroundColor = .white
		signinButton.setTitle("Sign in", for: .normal)
		signinButton.layer.cornerRadius = 15
		signinButton.setTitleColor(.black, for: .normal)
		signinButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
		return signinButton
	}()
	
	lazy var signupButton: UIButton = {
		
		let signupButton = UIButton()
		signupButton.backgroundColor = .white
		signupButton.setTitle("Sign up", for: .normal)
		signupButton.layer.cornerRadius = 15
		signupButton.setTitleColor(.black, for: .normal)
		signupButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
		return signupButton
	}()
	
	lazy var loginImageView: UIImageView = {
		let loginImageView = UIImageView()
		loginImageView.image = UIImage(named: "imagelogin2")
		return loginImageView
	}()
	
	func setupViews() {
		
		addSubview(loginImageView)
		addSubview(logoImageView)
		addSubview(signinButton)
		addSubview(signupButton)
		addSubview(navigationLabel)
		
	}
	
	func setupLayout() {
		
		logoImageView.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.top.equalToSuperview().inset(240)
			make.height.width.equalTo(200)
			
		}
		
		signinButton.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.top.equalTo(logoImageView.snp.bottom).offset(100)
			make.width.equalTo(140)
			make.height.equalTo(45)
		}
		
		signupButton.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.top.equalTo(signinButton.snp.bottom).offset(20)
			make.width.equalTo(140)
			make.height.equalTo(45)
		}
		
		loginImageView.snp.makeConstraints { make in
			
			make.edges.equalToSuperview()
		}
		navigationLabel.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.height.equalTo(100)
			make.width.equalToSuperview()
		}
		
		
	}
}
