import UIKit
import SwiftUIKit

public protocol Presenting: UIViewController {
    var navigate: Navigate { get set }
    func present(viewController: UIViewController)
}

public extension Presenting {
    func present(viewController: UIViewController) {
        guard viewController is UINavigationController else {
            navigate.go(UINavigationController(rootViewController: viewController), style: .modal)
            return
        }
        navigate.go(viewController, style: .modal)
    }
}
