//
//  MVVM-C_with_Swift
//
//  Copyright © 2017 Marco Santarossa. All rights reserved.
//

import Foundation

final class DashboardContainerCoordinator: Coordinator {
	
	// You may often have a list of Coordinator childs since in your current view you may have subviews.
	private var childCoordinators = [Coordinator]()
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
		viewModel.shouldLoadWidget = { [weak self] in
			self?.loadWidgets()
		}
	}
	
	func loadWidgets() {
		guard let containerViewController = self.usersContainerViewController() else { return }
		let coordinator = UsersCoordinator(containerViewController: containerViewController)
		coordinator.start()
		
		childCoordinators.append(coordinator)
	}
	
	private func usersContainerViewController() -> ContainerViewController? {
		guard let dashboardContainerViewController = dashboardContainerViewController else { return nil }
		
		return ContainerViewController(parentViewController: dashboardContainerViewController,
									   containerView: dashboardContainerViewController.usersContainerView)
	}
}

extension DashboardContainerCoordinator : ControllerDelegate {
	
	func viewDidLoad() {
		dashboardContainerViewController?.viewModel.shouldLoadWidget()
	}
}
