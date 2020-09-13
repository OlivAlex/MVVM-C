//
//  MVVM-C_with_Swift
//
//  Copyright © 2017 Marco Santarossa. All rights reserved.
//

import UIKit

final class DashboardContainerViewController: BaseViewController<DashboardContainerViewModelType> {
	
    @IBOutlet private(set) weak var usersContainerView: UIView!
	
    override func configure() {
	
		// We need to do something with the view model 🤔.
		// Like set our UI maybe...
    }
}
