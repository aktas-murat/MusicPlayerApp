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
}
