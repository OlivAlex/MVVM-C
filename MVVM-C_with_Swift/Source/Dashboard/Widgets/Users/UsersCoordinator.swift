//
//  MVVM-C_with_Swift
//
//  Copyright © 2017 Marco Santarossa. All rights reserved.
//

import UIKit

final class UsersCoordinator: Coordinator {
	
	private weak var containerViewController: ContainerViewController?
	
	init(containerViewController: ContainerViewController) {
		self.containerViewController = containerViewController
	}
	
	func start() {
		guard let containerViewController = containerViewController else { return }
		
		let dataProvider = DataProvider()
		let viewModel = UsersViewModel(dataProvider: dataProvider)
		let usersViewController = UsersViewController(viewModel: viewModel, delegate: self)
		viewModel.modelListener = usersViewController
		containerViewController.addChildController(usersViewController)
	}
}

extension UsersCoordinator : ControllerDelegate {
	
	func viewDidLoad() {
		print("View Loaded")
	}
}
