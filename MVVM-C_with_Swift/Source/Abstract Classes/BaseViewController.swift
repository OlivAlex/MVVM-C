//
//  MVVM-C_with_Swift
//
//  Copyright © 2017 Marco Santarossa. All rights reserved.
//

import UIKit

protocol ControllerDelegate {
	func viewDidLoad()
}

class BaseViewController<T>: UIViewController {

	private(set) var viewModel: T
	private(set) var delegate: ControllerDelegate
	
	init(viewModel: T, delegate: ControllerDelegate) {
		self.viewModel = viewModel
		self.delegate = delegate
		
        super.init(nibName: nil, bundle: nil)
        configure()
    }
	
	override func viewDidLoad() {
		delegate.viewDidLoad()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    func configure() {}
}
