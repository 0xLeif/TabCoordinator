import UIKit
import SwiftUIKit

public protocol TabNavigating: UITabBarController {
  func navigate(to: UIViewController, style: Navigate.NavigationStyle)
}

public extension TabNavigating {
  func navigate(to: UIViewController, style: Navigate.NavigationStyle) {
    guard let viewControllers = viewControllers,
          let navigationController = viewControllers[selectedIndex] as? UINavigationController,
          let navigatingViewController = navigationController.viewControllers.first as? NavigatingViewController else {
      return
    }
    navigatingViewController.navigate(to: to, style: style)
  }
}
