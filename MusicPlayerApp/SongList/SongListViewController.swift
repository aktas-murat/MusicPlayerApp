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
	var sounds: [SoundModel] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		layoutableView.tableView.dataSource = self
		layoutableView.tableView.delegate = self
		
		for index in 1...11 {
			let sound = SoundModel(name: "Sound" + String(index), image: UIImage(named: "image" + String(index)),            artistName: "artist" + String(index) , soundName: "Sound" + String(index))
			sounds.append(sound)
		}
	}
}

extension SongListViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sounds.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = SongListTableViewCell(style: .default, reuseIdentifier: "SongListTableViewCell")
		cell.configure(sound: sounds[indexPath.row])
		return cell
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		self.navigationController?.pushViewController(SongDetailViewController(sounds: sounds, selectedIndex: indexPath.row), animated: true)
		
	}
	
}
