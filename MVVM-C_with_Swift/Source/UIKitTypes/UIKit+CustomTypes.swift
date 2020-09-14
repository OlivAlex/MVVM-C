//
//  MVVM-C_with_Swift
//
//  Copyright © 2017 Marco Santarossa. All rights reserved.
//

import UIKit

protocol UIViewControllerType: class {
	var viewType: UIViewType { get }
	
	func addFillerChildViewController(_ childController: UIViewControllerType, toView: UIViewType?)
	func addChildViewController(_ childController: UIViewControllerType)
	func didMove(toParentViewController parent: UIViewControllerType?)
	func removeFromParentViewController()
}

protocol UIViewType: class {
	var translatesAutoresizingMaskIntoConstraints: Bool { get set }
	
	func addSubview(_ view: UIViewType)
	func addFillerSubview(_ subview: UIViewType)
}
