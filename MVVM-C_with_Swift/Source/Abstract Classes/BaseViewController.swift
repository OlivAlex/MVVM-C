//
//  MVVM-C_with_Swift
//
//  Copyright © 2017 Marco Santarossa. All rights reserved.
//

import UIKit

class BaseViewController<T>: UIViewController {

	private(set) var viewModel: T {
		didSet {
			configure()
		}
	}
    
    init(viewModel: T) {
		self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
		
        configure()
    }
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    func configure() {}
}
