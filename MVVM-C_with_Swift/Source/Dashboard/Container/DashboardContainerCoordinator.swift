//
//  MVVM-C_with_Swift
//
//  Copyright © 2017 Marco Santarossa. All rights reserved.
//

import Foundation

final class DashboardContainerCoordinator: Coordinator {
	private weak var dashboardContainerViewController: DashboardContainerViewController?
	private weak var navigationController: UINavigationControllerType?
	
	init(navigationController: UINavigationControllerType) {
		self.navigationController = navigationController
	}
}

extension DashboardContainerCoordinator {
	
	func start() {
		guard let navigationController = navigationController else { return }
		let viewModel = DashboardContainerViewModel()
		let container = DashboardContainerViewController(viewModel: viewModel,
														 delegate: self)
		
		navigationController.pushViewController(container, animated: true)
		dashboardContainerViewController = container
	}
}

extension DashboardContainerCoordinator : ControllerDelegate {
	
	func viewDidLoad() {
		guard let dashboardContainerViewController = dashboardContainerViewController else { return }
		let containerViewController = ContainerViewController(dashboardContainerViewController,
															  containerView: dashboardContainerViewController.usersContainerView)
		let coordinator = UsersCoordinator(containerViewController: containerViewController)
		coordinator.start()
	}
}
