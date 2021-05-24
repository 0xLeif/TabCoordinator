import UIKit
import SwiftUIKit

open class NavigatingViewController: UIViewController, Navigatable {
    public lazy var navigate: Navigate = Navigate(controller: navigationController)
    
    private var rootView: ((NavigatingViewController) -> UIView)?
    private var onDidLoad: ((Navigate) -> Void)?
    
    open init(
        rootView: ((NavigatingViewController) -> UIView)? = nil,
        onDidLoad: ((Navigate) -> Void)? = nil
    ) {
        self.rootView = rootView
        self.onDidLoad = onDidLoad
        
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        onDidLoad?(navigate)
        onDidLoad = nil
        
        if let rootView = rootView {
            view = rootView(self)
        }
    }
}
