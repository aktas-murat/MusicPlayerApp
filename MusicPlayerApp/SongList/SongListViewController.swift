//
//  SongListViewController.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/3/22.
//

import UIKit

final class SongListViewController: UIViewController, Layouting {
	
	typealias ViewType = SongListView
	
	override func loadView() {
		view = ViewType.create()
		
	}
	
	var test: String?
	var sounds: [SoundModel] = [SoundModel(name: "testsound1234", image: UIImage(named: "splash-logo"), artistName: "ssss", soundName: "")]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		layoutableView.tableView.dataSource = self
		layoutableView.tableView.delegate = self
		
		sounds.append(SoundModel(name: "testsound1", image: UIImage(named: "splash-logo"), artistName: "aaaaa", soundName: "bbbbb" ))
		sounds.append(contentsOf: sounds)
		sounds.append(contentsOf: sounds)
		
	}
}

extension SongListViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sounds.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = SongListTableViewCell(style: .default, reuseIdentifier: "SongListTableViewCell")
		cell.configure(name: sounds[indexPath.row].name, image: sounds[indexPath.row].image, artistName: sounds[indexPath.row].artistName, soundName: "bbbb")
		return cell
	}
}
