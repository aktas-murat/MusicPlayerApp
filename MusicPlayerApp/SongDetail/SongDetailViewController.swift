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
	
	var sound: SoundModel?
	var player: AVPlayer?
	
	convenience init(sound: SoundModel) {
		self.init()
		self.sound = sound
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		layoutableView.playButton.addTarget(self, action: #selector(didTapPlayButton), for: .touchUpInside)
		
		configure()
	}
}

// MARK: - Configure
extension SongDetailViewController {
	
	func configure() {
		guard let sound = sound else {
			return
		}

		layoutableView.configure(sound: sound)
	}
}

// MARK: - Actions
extension SongDetailViewController {
	
	@objc func didTapPlayButton() {
		layoutableView.playButton.isSelected.toggle()
		guard let audioFilePath = Bundle.main.path(forResource: sound?.name, ofType: "mp3") else { return }
		let soundUrl =  NSURL.fileURL(withPath: audioFilePath)
		player = AVPlayer(url: soundUrl)
		
		if layoutableView.playButton.isSelected {
			player?.play()
	
		} else {
			player?.pause()
		}
		
	}
}
