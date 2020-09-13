//
//  MVVM-C_with_Swift
//
//  Copyright © 2017 Marco Santarossa. All rights reserved.
//

import UIKit

final class UsersViewController: BaseViewController<UsersViewModelType> {

    @IBOutlet fileprivate var activityIndicator: UIActivityIndicatorView!
    @IBOutlet fileprivate var usersSearchView: UIView!
    @IBOutlet private weak var usersCountInfoLabel: UILabel!
    @IBOutlet private weak var searchUserTextField: UITextField!
    @IBOutlet private weak var userFoundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

		let tapGestureRecognizer = UITapGestureRecognizer(target: self,
														  action: #selector(self.stopEditing))
		view.addGestureRecognizer(tapGestureRecognizer)
    }
	
	override func configure() {
		updateActivityIndicatorVisibility(viewModel.shouldShowActivityIndicator)
		updateUsersSearchViewVisibility(viewModel.shouldShowUsersSearchView)
		usersCountInfoLabel.text = viewModel.usersCountInfo
		userFoundLabel.text = viewModel.userFound
	}

	@objc func stopEditing() {
		self.view.endEditing(true)
	}
}

// MARK: - Custom bindings
extension UsersViewController {

    fileprivate func updateActivityIndicatorVisibility(_ shouldShow: Bool) {
        if shouldShow {
            view.addFillerSubview(activityIndicator)
        } else {
            activityIndicator?.removeFromSuperview()
        }
    }
	
    fileprivate func updateUsersSearchViewVisibility(_ shouldShow: Bool) {
        if shouldShow {
            view.addFillerSubview(usersSearchView)
        } else if usersSearchView.superview != nil {
            usersSearchView.removeFromSuperview()
        }
    }
}
