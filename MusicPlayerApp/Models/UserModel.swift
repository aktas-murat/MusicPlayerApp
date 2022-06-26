//
//  UserModel.swift
//  MusicPlayerApp
//
//  Created by Murat Aktaş on 6/21/22.
//

import Foundation
import UIKit

struct UserModel {
	
	var name: String
	var surname: String
	var email: String
	var password: String
	
	init(name: String, surname: String, email: String, password: String) {
			self.name = name
			self.surname = surname
			self.email = email
			self.password = password
		}
}
