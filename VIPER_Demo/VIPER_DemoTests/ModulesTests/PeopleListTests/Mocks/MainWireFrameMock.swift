import UIKit

@testable import VIPER_Demo

class MainWireFrameMock : MainWireFrame {

    var didDisplayWithViewController : UIViewController!

    override func display(rootViewController viewController: UIViewController, inWindow window: UIWindow) {
        didDisplayWithViewController = viewController
    }
}
