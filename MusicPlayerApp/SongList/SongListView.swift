//
//  SongListView.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/3/22.
//

import UIKit

final class SongListView: UIView, Layoutable {
	
	lazy var tableView: UITableView = {
		
		let tableView = UITableView()
		tableView.backgroundColor = .black
	    return tableView
		
	}()
	
	lazy var navigationLabel: UILabel = {
		
		let navigationLabel = UILabel()
//      	navigationLabel.backgroundColor = .blue
		return navigationLabel
	}()
	
	lazy var backButton: UIButton = {
		
		let backButton = UIButton()
		backButton.setImage(UIImage(named: "backimage"), for: .normal)
//		backButton.backgroundColor = .white
		return backButton
	}()
	
	func setupViews() {
		addSubview(tableView)
		addSubview(navigationLabel)
		addSubview(backButton)
		backgroundColor = .black
	}
	
	func setupLayout() {
		tableView.snp.makeConstraints { make in
			make.top.equalTo(navigationLabel.snp.bottom)
			make.width.equalToSuperview()
			make.bottom.equalToSuperview()
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
