//
//  SongListViewController.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/3/22.
//
import AVKit
import UIKit

final class SongListViewController: UIViewController, Layouting {
	
	typealias ViewType = SongListView
	
	override func loadView() {
		view = ViewType.create()
		
	}
	
	var test: String?
	var sounds: [SoundModel] = []
	
	var player: AVPlayer?
	var selectedIndex: Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		layoutableView.tableView.dataSource = self
		layoutableView.tableView.delegate = self
	
		sounds = SoundModel.sounds()
	}
}

extension SongListViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sounds.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = SongListTableViewCell(style: .default, reuseIdentifier: "SongListTableViewCell")
		cell.configure(sound: sounds[indexPath.row])
		cell.delegate = self
		return cell
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		self.navigationController?.pushViewController(SongDetailViewController(sounds: sounds, selectedIndex: indexPath.row), animated: true)
		
	}
	
	func playSound(sound: SoundModel) {
		guard let audioFilePath = Bundle.main.path(forResource: sound.soundName, ofType: "mp3") else { return }
		let soundUrl = NSURL.fileURL(withPath: audioFilePath)
		player = AVPlayer(url: soundUrl)
	    player?.play()
	}
	
}

extension SongListViewController: SongListTableViewCellDelegate {
	func didTapStopButton() {
		player?.pause()
	}
	
	func didTapPlayButton(sound: SoundModel) {
		
		playSound(sound: sound)
	}
}
