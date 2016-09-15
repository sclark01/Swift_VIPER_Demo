import UIKit

@testable import VIPER_Demo

class TestablePersonDetailsWireFrame : PersonDetailsWireFrame {
    var pushedViewController: UIViewController?

    override func push(newViewController vc: UIViewController, onTo oldVC: UIViewController) {
        pushedViewController = vc
    }
}