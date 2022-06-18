//
//  LoginView.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/15/22.
//

import UIKit

final class LoginView: UIView, Layoutable {
	
	lazy var logoImageView: UIImageView = {
		
		let logoImageView = UIImageView()
		logoImageView.backgroundColor = .white
		logoImageView.image = UIImage(named: "splash-logo")
		return logoImageView
	}()
	
	lazy var signinButton: UIButton = {
		
		let loginButton = UIButton()
		loginButton.backgroundColor = .white
		loginButton.setTitle("Sign in", for: .normal)
		loginButton.layer.cornerRadius = 15
		loginButton.setTitleColor(.black, for: .normal)
		loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
		return loginButton
	}()
	
	lazy var signupButton: UIButton = {
		
		let loginButton = UIButton()
		loginButton.backgroundColor = .white
		loginButton.setTitle("Sign up", for: .normal)
		loginButton.layer.cornerRadius = 15
		loginButton.setTitleColor(.black, for: .normal)
		loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
		return loginButton
	}()
	
	lazy var loginImageView:UIImageView = {
		let loginImageView = UIImageView()
		loginImageView.image = UIImage(named: "imagelogin2")
		return loginImageView
	}()
	
	func setupViews() {
		
		addSubview(loginImageView)
		addSubview(logoImageView)
		addSubview(signinButton)
		addSubview(signupButton)
		
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
			make.width.equalTo(90)
			make.height.equalTo(45)
		}
		
		signupButton.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.top.equalTo(signinButton.snp.bottom).offset(20)
			make.width.equalTo(90)
			make.height.equalTo(45)
		}
		
		loginImageView.snp.makeConstraints { make in
			
			make.edges.equalToSuperview()
		}
		
	}
}
