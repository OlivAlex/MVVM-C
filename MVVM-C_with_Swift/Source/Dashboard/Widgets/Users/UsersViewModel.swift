//
//  MVVM-C_with_Swift
//
//  Copyright © 2017 Marco Santarossa. All rights reserved.
//

import Foundation

protocol UsersViewModelType {
    var shouldShowActivityIndicator: Bool { get }
    var shouldShowUsersSearchView: Bool { get }
    var usersCountInfo: String { get }
    var userFound: String { get }
	
	func controllerRequestedUpdate(with input: String)
}

final class UsersViewModel : UsersViewModelType {
	
	// Repeating code here is a small price to pay for avoiding other dependencies onto the codebase.
	var shouldShowActivityIndicator: Bool = false {
		didSet {
			modelListener?.modelChanged()
		}
	}
	var shouldShowUsersSearchView: Bool = true {
		didSet {
			modelListener?.modelChanged()
		}
	}
	var usersCountInfo: String = "Enter an ID" {
		didSet {
			modelListener?.modelChanged()
		}
	}
	var userFound: String = "Search for a user" {
		didSet {
			modelListener?.modelChanged()
		}
	}
	
	var modelListener: ModelListener?
	let dataProvider: UsersDataProviderType!
	init(dataProvider: UsersDataProviderType) {
		self.dataProvider = dataProvider
	}
	
	func controllerRequestedUpdate(with input: String) {
		
		shouldShowActivityIndicator = true
		
		dataProvider.fetchUsers(from: "https://jsonplaceholder.typicode.com/users/\(input)") { fetchUsersData in
			guard case .success(let usersData) = fetchUsersData else {
				return
			}
			
			let decoder = JSONDecoder()
			guard let newModel = try? decoder.decode(UserModel.self, from: usersData) else {
				self.shouldShowActivityIndicator = false
				self.usersCountInfo = "Not Found"
				self.userFound = ""
				return
			}
			
			self.userFound = newModel.name
			self.usersCountInfo = newModel.username
			self.shouldShowActivityIndicator = false
		}
	}
}
