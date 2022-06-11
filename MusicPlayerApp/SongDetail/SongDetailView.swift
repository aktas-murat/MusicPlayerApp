//
//  SongDetailView.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/11/22.
//

import UIKit

final class SongDetailView: UIView, Layoutable {
	
	lazy var songImageView: UIImageView = {
		
		let songImageView = UIImageView()
		songImageView.backgroundColor = .white
		songImageView.image = UIImage(named: "splash-logo")
		return songImageView
	}()
	
	lazy var songNameLabel: UILabel = {
		
		let songNameLabel = UILabel()
		songNameLabel.backgroundColor = .white
		
		return songNameLabel
	}()
	
	lazy var artistNameLabel: UILabel = {
		
		let artistNameLabel = UILabel()
		artistNameLabel.backgroundColor = .blue
		
		return artistNameLabel
	}()
	
	lazy var playButton: UIButton = {
		
		let playButton = UIButton()
		playButton.setImage(UIImage(named: "play"), for: .normal)
		playButton.setImage(UIImage(named: "pause"), for: .selected)
		playButton.tintColor = .white
		
		return playButton
	}()
	
	lazy var nextButton: UIButton = {
		
		let nextButton = UIButton()
		nextButton.setImage(UIImage(named: "nextButton"), for: .normal)
		nextButton.tintColor = .white
		
		return nextButton
	}()
	
	lazy var previousButton: UIButton = {
		
		let previousButton = UIButton()
		previousButton.setImage(UIImage(named: "previousButton"), for: .normal)
		previousButton.tintColor = .white
		
		return previousButton
	}()
	
	func setupViews() {
		
		playButton.addTarget(self, action: #selector(didTapPlayButton), for: .touchUpInside)
		addSubview(songImageView)
		addSubview(songNameLabel)
		addSubview(artistNameLabel)
		addSubview(playButton)
		addSubview(nextButton)
		addSubview(previousButton)
	}
	
	func setupLayout() {
		
		songImageView.snp.makeConstraints { make in
			make.top.equalToSuperview().inset(120)
			make.left.right.equalToSuperview().inset(30)
			make.height.equalTo(songImageView.snp.width)
		}
		
		songNameLabel.snp.makeConstraints { make in
			make.top.equalTo(songImageView.snp.bottom).offset(80)
			make.left.right.equalToSuperview().inset(30)
			make.height.equalTo(30)
		}
		
		artistNameLabel.snp.makeConstraints { make in
			make.top.equalTo(songNameLabel.snp.bottom).offset(10)
			make.left.right.equalToSuperview().inset(30)
			make.height.equalTo(20)
		}
		playButton.snp.makeConstraints { make in
			make.top.equalTo(artistNameLabel.snp.bottom).offset(80)
			make.centerX.equalToSuperview()
			make.width.height.equalTo(60)
		}
		
		nextButton.snp.makeConstraints { make in
			make.centerY.equalTo(playButton.snp.centerY)
			make.left.equalTo(playButton.snp.right).offset(30)
			make.width.height.equalTo(50)
		}
		
		previousButton.snp.makeConstraints { make in
			make.centerY.equalTo(playButton.snp.centerY)
			make.right.equalTo(playButton.snp.left).offset(-30)
			make.width.height.equalTo(50)
		}
		
	}
	
}

// MARK: - Actions
extension SongDetailView {
	
	@objc func didTapPlayButton() {
		playButton.isSelected.toggle()
		
	}
}