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
}
