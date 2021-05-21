import UIKit
import SwiftUIKit

public protocol Navigatable: UIViewController {
  var navigate: Navigate { get set }
  func navigate(to: UIViewController, style: Navigate.NavigationStyle)
}

public extension Navigatable {
  func navigate(to: UIViewController, style: Navigate.NavigationStyle) {
    navigate.go(to, style: style)
  }
}
