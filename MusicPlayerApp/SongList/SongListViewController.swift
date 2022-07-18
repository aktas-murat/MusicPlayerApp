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
	var selectedIndex: Int = -1
	
	override func viewDidLoad() {
		super.viewDidLoad()
		layoutableView.tableView.dataSource = self
		layoutableView.tableView.delegate = self
		layoutableView.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
	
		sounds = SoundModel.sounds()
	}
}

extension SongListViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sounds.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = SongListTableViewCell(style: .default, reuseIdentifier: "SongListTableViewCell")
		cell.configure(sound: sounds[indexPath.row], selectedIndex: indexPath.row)
		cell.playButton.isSelected = indexPath.row == selectedIndex
		cell.delegate = self
		return cell
	}
	
	@objc func didTapBackButton() {
		
		self.navigationController?.popViewController(animated: true)
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		self.navigationController?.pushViewController(SongDetailViewController(sounds: sounds, selectedIndex: indexPath.row), animated: true)
		
	}
	
	func playSound() {
		guard let audioFilePath = Bundle.main.path(forResource: sounds[selectedIndex].soundName, ofType: "mp3") else { return }
		let soundUrl = NSURL.fileURL(withPath: audioFilePath)
		player = AVPlayer(url: soundUrl)
	    player?.play()
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		let selectedCell = cell as? SongListTableViewCell
		selectedCell?.playButton.isSelected = indexPath.row == selectedIndex
	}
	
}

extension SongListViewController: SongListTableViewCellDelegate {
	func didTapPlayButton(selectedIndex: Int) {
		self.selectedIndex = selectedIndex
		playSound()
		closeOtherButtons()
		layoutableView.tableView.reloadData()
		
	}
	
	func didTapStopButton() {
		player?.pause()
	}
	
}

// MARK: - Helpers

extension SongListViewController {
	
	func closeOtherButtons() {
		let visibleCells = layoutableView.tableView.visibleCells
		for (index, visibleCell) in visibleCells.enumerated() {
			if index != selectedIndex {
				let cell = visibleCell as? SongListTableViewCell
				cell?.playButton.isSelected = false
				
			}
		}
	}
}
