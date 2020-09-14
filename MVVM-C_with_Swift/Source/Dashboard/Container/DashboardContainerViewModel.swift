//
//  MVVM-C_with_Swift
//
//  Copyright © 2017 Marco Santarossa. All rights reserved.
//

import Foundation

protocol DashboardContainerViewModelType: class {
	var title: String { get }
}

final class DashboardContainerViewModel: DashboardContainerViewModelType {
	var title: String = "Dashboard"
}
