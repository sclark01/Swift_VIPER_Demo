import UIKit

class MainWireFrame {
    func display(rootViewController viewController: UIViewController, inWindow window: UIWindow) {
        guard let navController = window.rootViewController as? UINavigationController else { return }
        navController.pushViewController(viewController, animated: true)
    }
}