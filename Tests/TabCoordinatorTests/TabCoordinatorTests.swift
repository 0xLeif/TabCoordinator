import XCTest
@testable import TabCoordinator

final class TabCoordinatorTests: XCTestCase {
  func testExample() {
    let expectedNumberOfViewControllers = 3
    
    XCTAssertEqual(
      RootViewController(
        options: [
          TabBarOption(tabTitle: "First", tabImage: nil, rootViewController: NavigatingViewController()),
          TabBarOption(tabTitle: "Second", tabImage: nil, rootViewController: NavigatingViewController()),
          TabBarOption(tabTitle: "Third", tabImage: nil, rootViewController: NavigatingViewController())
        ]
      )
      .tabController.viewControllers?.count,
      expectedNumberOfViewControllers
    )
  }
  
  static var allTests = [
    ("testExample", testExample),
  ]
}
