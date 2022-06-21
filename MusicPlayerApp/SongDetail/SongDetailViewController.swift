//
//  SongDetailViewController.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/11/22.
//

import UIKit
import AVKit

final class SongDetailViewController: UIViewController, Layouting {
	
	typealias ViewType = SongDetailView
	
	override func loadView() {
		view = ViewType.create()
		
	}
	
	var player: AVPlayer?
	var selectedIndex: Int = 0
	var sounds: [SoundModel] = []
	
	convenience init(sounds: [SoundModel], selectedIndex: Int) {
		self.init()
		self.sounds = sounds
		self.selectedIndex = selectedIndex
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		layoutableView.previousButton.addTarget(self, action: #selector(didTapPreviousButton), for: .touchUpInside)
		layoutableView.playButton.addTarget(self, action: #selector(didTapPlayButton), for: .touchUpInside)
		layoutableView.nextButton.addTarget(self, action: #selector(didTapNexButton), for: .touchUpInside)
		configure()
	}
	func playSound() {
		guard let audioFilePath = Bundle.main.path(forResource: sounds[selectedIndex].soundName, ofType: "mp3") else { return }
		let soundUrl =  NSURL.fileURL(withPath: audioFilePath)
		player = AVPlayer(url: soundUrl)
		
		if layoutableView.playButton.isSelected {
			player?.play()
	
		} else {
			player?.pause()
		}
		
	}
	
}

// MARK: - Configure
extension SongDetailViewController {
	
	func configure() {
		
		let sound = sounds[selectedIndex]

		layoutableView.configure(sound: sound)
	}
}

// MARK: - Actions
extension SongDetailViewController {
	
	@objc func didTapPlayButton() {
		layoutableView.playButton.isSelected.toggle()
	    playSound()
	}
	
	@objc func didTapNexButton() {
	
		guard selectedIndex < sounds.count else {return}
		selectedIndex += 1
		playSound()
		configure()

	}
	
	@objc func didTapPreviousButton() {
		
		guard selectedIndex != 0 else {return}
		
		selectedIndex -= 1
		playSound()
		configure()
	}
}
