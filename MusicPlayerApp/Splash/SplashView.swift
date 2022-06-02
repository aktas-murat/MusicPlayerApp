//
//  SplashView.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/2/22.
//

import UIKit

final class SplashView: UIView, Layoutable {
	
	lazy var logoImageView: UIImageView = {
		
		let imageView = UIImageView()
		
		imageView.image = UIImage(named: "splash-logo")
		imageView.backgroundColor = .systemBlue
		return imageView
		
	}()
	
	lazy var activityIndicator: UIActivityIndicatorView = {
		
		let activityIndicator = UIActivityIndicatorView()
		activityIndicator.style = .medium
		activityIndicator.color = .white
		return activityIndicator
		
	}()
	
	func setupViews() {
		
		addSubview(logoImageView)
		addSubview(activityIndicator)
	}
	
	func setupLayout() {
		
		logoImageView.snp.makeConstraints { make in
			make.width.height.equalTo(200)
			make.center.equalToSuperview()
		}
		
		activityIndicator.snp.makeConstraints { make in
			make.width.height.equalTo(50)
			make.centerX.equalToSuperview()
			make.top.equalTo(logoImageView.snp.bottom).offset(50)
		}
		
	}
	
}
