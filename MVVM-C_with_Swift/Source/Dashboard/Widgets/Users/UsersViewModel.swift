//
//  MVVM-C_with_Swift
//
//  Copyright © 2017 Marco Santarossa. All rights reserved.
//

import Foundation

struct UserSearchPayload {
    let users: [UserModel]
    let query: String
}

protocol UsersViewModelType {
    var shouldShowActivityIndicator: Bool { get }
    var shouldShowUsersSearchView: Bool { get }
    var usersCountInfo: String { get }
    var userFound: String { get }
}

final class UsersViewModel : UsersViewModelType {
	
	var shouldShowActivityIndicator: Bool = true
	var shouldShowUsersSearchView: Bool = true
	var usersCountInfo: String = "Number"
	var userFound: String = "Search for a user"
	
	let dataProvider: UsersDataProviderType!
	init(dataProvider: UsersDataProviderType) {
		self.dataProvider = dataProvider
		
	}
}
