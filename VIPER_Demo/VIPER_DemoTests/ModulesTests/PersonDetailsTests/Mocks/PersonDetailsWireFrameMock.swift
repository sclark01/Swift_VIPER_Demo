import UIKit

@testable import VIPER_Demo

class PersonDetailsWireFrameMock : PersonDetailsWireFrame {
    var didPresentWithViewController: UIViewController!
    var didPresentWithID: Int!

    override func presentDetailsViewFrom(viewController: UIViewController, withId id: Int) {
        didPresentWithViewController = viewController
        didPresentWithID = id
    }
}
