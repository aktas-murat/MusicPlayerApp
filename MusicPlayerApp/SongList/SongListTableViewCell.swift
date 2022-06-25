//
//  SongListTableViewCell.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/3/22.
//

import UIKit

protocol SongListTableViewCellDelegate: AnyObject {
	
	func didTapPlayButton(sound: SoundModel)
	func didTapStopButton()
}

final class SongListTableViewCell: UITableViewCell {
	
	weak var delegate: SongListTableViewCellDelegate?
	
	var sound: SoundModel?
	
	lazy var titleLabel: UILabel = {
		
		let titleLabel = UILabel()
		titleLabel.textColor = .white
		titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
//		titleLabel.backgroundColor = .yellow
		return titleLabel
		
	}()
	
	lazy var logoImageView: UIImageView = {
		
		let logoImageView = UIImageView()
		return logoImageView
	}()
	
	lazy var artistLabel: UILabel = {
		
		let artistLabel = UILabel()
		artistLabel.textColor = .white
		artistLabel.font = .systemFont(ofSize: 12, weight: .heavy)
		return artistLabel
		
	}()
	
	lazy var playButton: UIButton = {
		
		let playButton = UIButton()
		playButton.setImage(UIImage(named: "play"), for: .normal)
		playButton.setImage(UIImage(named: "pause"), for: .selected)
		playButton.tintColor = .white
		
		return playButton
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		selectionStyle = .none
		backgroundColor = .black
		setupViews()
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupViews() {
		
		playButton.addTarget(self, action: #selector(didTapPlayButton), for: .touchUpInside)
		contentView.addSubview(titleLabel)
		contentView.addSubview(logoImageView)
		contentView.addSubview(artistLabel)
		contentView.addSubview(playButton)
	}
	func setupLayout() {
		
		titleLabel.snp.makeConstraints { make in
			make.right.equalTo(playButton.snp.left).offset(-10)
			make.left.equalTo(logoImageView.snp.right).offset(20)
			make.bottom.equalTo(self.snp.centerY).offset(-5)
		}
		
		logoImageView.snp.makeConstraints { make in
			make.height.width.equalTo(70)
			make.left.top.bottom.equalToSuperview().inset(10)
		}
		
		artistLabel.snp.makeConstraints { make in
			make.left.equalTo(logoImageView.snp.right).offset(20)
			make.right.equalTo(playButton.snp.left).offset(-10)
			make.top.equalTo(self.snp.centerY).offset(5)
		}
		
		playButton.snp.makeConstraints { make in
			make.height.width.equalTo(25)
			make.right.equalToSuperview().inset(20)
			make.centerY.equalTo(snp.centerY)
		}
		
	}
	
}

// MARK: - Configure
extension SongListTableViewCell {
	
	func configure(sound: SoundModel) {
		titleLabel.text = sound.name
		logoImageView.image = UIImage(named: sound.imageName)
		artistLabel.text = sound.artistName
		self.sound = sound
	}
}

// MARK: - Actions
extension SongListTableViewCell {
	
	@objc func didTapPlayButton() {
		playButton.isSelected.toggle()
		guard let sound = sound else { return }
		if playButton.isSelected {
			delegate?.didTapPlayButton(sound: sound)
		}else{
			delegate?.didTapStopButton()
		}
		

	}
	
}
