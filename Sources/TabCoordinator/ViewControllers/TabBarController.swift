import UIKit
import SwiftUIKit

public struct TabBarOption {
    public let tabTitle: String
    public let tabImage: UIImage?
    public let rootViewController: NavigatingViewController
    
    public init(
        tabTitle: String,
        tabImage: UIImage?,
        rootViewController: NavigatingViewController
    ) {
        self.tabTitle = tabTitle
        self.tabImage = tabImage
        self.rootViewController = rootViewController
    }
}

open class TabBarController: UITabBarController, TabNavigating {
    
    public let options: [TabBarOption]
    
    open init(options: [TabBarOption]) {
        self.options = options
        super.init(nibName: nil, bundle: nil)
        
        viewControllers = options.map { option in
            UINavigationController(rootViewController: option.rootViewController)
                .configure { $0.tabBarItem = UITabBarItem(title: option.tabTitle, image: option.tabImage, selectedImage: nil) }
        }
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
