//
//  Sound.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/7/22.
//

import Foundation
import UIKit

struct SoundModel {
	var name: String
	var image: UIImage?
	var artistName: String
	var soundName: String
	
	init(name: String, image: UIImage?, artistName: String, soundName: String) {
		self.name = name
		self.image = image
		self.artistName = artistName
		self.soundName = soundName
	}
}
