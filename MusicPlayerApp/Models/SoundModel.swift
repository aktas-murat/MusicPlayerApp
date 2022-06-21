//
//  Sound.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/7/22.
//

import Foundation
import UIKit

struct SoundModel: Codable {
	var name: String
	var imageName: String
	var artistName: String
	var soundName: String
	
}

// MARK: - Helpers
extension SoundModel {

	static func sounds() -> [SoundModel] {
		guard let path = Bundle.main.path(forResource: "sounds", ofType: "json") else { return [] }
		let url = URL(fileURLWithPath: path)
		guard let json = try? Data(contentsOf: url) else { return [] }
		return (try? JSONDecoder().decode([SoundModel].self, from: json)) ?? []
	}

}
