import UIKit
import SwiftUIKit

public class RootViewController: UIViewController, Presenting {
  public lazy var navigate: Navigate = Navigate(controller: navigationController)
  
  public let tabController: TabBarController
  
  public let options: [TabBarOption]
  
  public init(options: [TabBarOption]) {
    self.options = options
    self.tabController = TabBarController(
      options: options
    )
    super.init(nibName: nil, bundle: nil)
  }
  
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    view.embed {
      ContainerView(parent: self) {
        tabController
      }
    }
  }
}
