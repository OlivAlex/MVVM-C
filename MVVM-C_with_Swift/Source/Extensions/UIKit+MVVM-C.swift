//
//  MVVM-C_with_Swift
//
//  Copyright © 2017 Marco Santarossa. All rights reserved.
//

import UIKit

extension UINavigationController: UINavigationControllerType { }

extension UIViewController: UIViewControllerType {
	
	var viewType: UIViewType {
		return self.view
	}
	
	func addFillerChildViewController(_ childController: UIViewControllerType, toView: UIViewType? = nil) {
		addChildViewController(childController)
		var parentView: UIViewType = childController.viewType
		if let toView = toView {
			parentView = toView
		}
		parentView.addFillerSubview(childController.viewType)
		childController.didMove(toParentViewController: self)
	}
	
	func addChildViewController(_ childController: UIViewControllerType) {
		guard let childController = childController as? UIViewController else { return }
		addChildViewController(childController)
	}
	
	func didMove(toParentViewController parent: UIViewControllerType?) {
		didMove(toParentViewController: parent as? UIViewController)
	}
}

extension UIView: UIViewType {
	func addSubview(_ view: UIViewType) {
		guard let view = view as? UIView else { return }
		addSubview(view)
	}
	
	func addFillerSubview(_ subview: UIViewType) {
		subview.translatesAutoresizingMaskIntoConstraints = false
		
		addSubview(subview)
		
		let views = ["subview": subview]
		let verticalConstraint = NSLayoutConstraint.constraints(
			withVisualFormat: "V:|[subview]|",
			options: [],
			metrics: nil,
			views: views)
		let horizontalConstraint = NSLayoutConstraint.constraints(
			withVisualFormat: "H:|[subview]|",
			options: [],
			metrics: nil,
			views: views)
		
		addConstraints(verticalConstraint + horizontalConstraint)
	}
}
