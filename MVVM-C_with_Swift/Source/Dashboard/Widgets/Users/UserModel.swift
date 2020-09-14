//
//  MVVM-C_with_Swift
//
//  Copyright © 2017 Marco Santarossa. All rights reserved.
//

import Foundation

struct UserModel: Decodable {
	private(set) var id: Int
	private(set) var name: String
	private(set) var username: String
}
