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
	
	func setupViews() {
		addSubview(tableView)
		backgroundColor = .black
	}
	
	func setupLayout() {
		tableView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}
	}
	
}
