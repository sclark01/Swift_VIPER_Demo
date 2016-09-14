import Foundation
import UIKit

class AppDependencies {
    let peopleListWireFrame: PeopleListWireFrame

    init() {
        let presenter = PeopleListPresenter()
        let peopleListInteractor = PeopleListInteractor(output: presenter)
        self.peopleListWireFrame = PeopleListWireFrame(mainWireFrame: MainWireFrame(), peopleListPresenter: presenter, peopleListInteractor: peopleListInteractor)
    }

    func installRootViewControllerInto(window: UIWindow) {
        peopleListWireFrame.presentListInterfaceFrom(window)
    }
}
