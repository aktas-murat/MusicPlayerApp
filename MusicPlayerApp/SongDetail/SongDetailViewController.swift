//
//  SongDetailViewController.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/11/22.
//

import UIKit

final class SongDetailViewController: UIViewController, Layouting {
	
	typealias ViewType = SongDetailView
	
	override func loadView() {
		view = ViewType.create()
		
	}
	
	var sound: SoundModel?
	
	convenience init(sound: SoundModel) {
		self.init()
		self.sound = sound
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
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
