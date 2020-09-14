//
//  MVVM-C_with_Swift
//
//  Copyright © 2017 Marco Santarossa. All rights reserved.
//

import Foundation

enum FetchError : Error {
	case invalidURL
	case network(Error)
	case invalidStateNoErrorNoData
}

protocol UsersDataProviderType {
	func fetchUsers(from endpoint: String, completion: @escaping ((Result<Data, FetchError>) -> Void))
}

final class DataProvider: UsersDataProviderType {
    
	func fetchUsers(from rawEndpoint: String, completion: @escaping ((Result<Data, FetchError>) -> Void)) {
		guard let endpointURL = URL(string: rawEndpoint) else {
			completion(.failure(.invalidURL))
			return
		}
		
		let urlRequest = URLRequest(url: endpointURL)
		URLSession.shared.dataTask(with: urlRequest) { possibleData, _, possibleError in
			guard possibleError == nil else {
				completion(.failure(.network(possibleError!)))
				return
			}
			
			guard let data = possibleData else {
				completion(.failure(.invalidStateNoErrorNoData))
				return
			}
			
			completion(.success(data))
		}.resume()
	}
}
