//
//  SongListTableViewCell.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/3/22.
//

import UIKit

final class SongListTableViewCell: UITableViewCell {
	
	lazy var titleLabel: UILabel = {
		
		let titleLabel = UILabel()
		titleLabel.backgroundColor = .yellow
		return titleLabel
		
	}()
	
	lazy var logoImageView: UIImageView = {
		
		let logoImageView = UIImageView()
		logoImageView.backgroundColor = .lightGray
		return logoImageView
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
		
		addSubview(titleLabel)
		addSubview(logoImageView)
	}
	func setupLayout() {
		
		titleLabel.snp.makeConstraints { make in
			make.right.equalToSuperview().inset(20)
			make.left.equalTo(logoImageView.snp.right).offset(20)
			make.centerY.equalTo(logoImageView.snp.centerY)
		}
		
		logoImageView.snp.makeConstraints { make in
			make.height.width.equalTo(70)
			make.left.top.bottom.equalToSuperview().inset(10)
		}
		
	}
	
}

// MARK: - Configure
extension SongListTableViewCell {
	
	func configure(name: String, image: UIImage?, artistName: String, soundName: String) {
		titleLabel.text = name
		logoImageView.image = image
		
	}
}
