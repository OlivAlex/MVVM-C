//
//  MVVM-C_with_Swift
//
//  Copyright © 2017 Marco Santarossa. All rights reserved.
//

// TODO: Rename file.
import UIKit

/*
The Coordinator must provide a start method to create the MVVM layers and add View in the view hierarchy.
Its responsibility is to show a new view and to inject the dependencies which the View and ViewModel need.
*/
protocol Coordinator {
    func start()
}

protocol UINavigationControllerType: class {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
}
