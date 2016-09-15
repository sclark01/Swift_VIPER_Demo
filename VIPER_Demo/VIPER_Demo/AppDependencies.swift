import Foundation
import UIKit

class AppDependencies {
    let peopleListWireFrame: PeopleListWireFrame

    init() {
        let peopleListPresenter = PeopleListPresenter()
        let personDetailsPresenter = PersonDetailsPresenter()
        let service = PeopleService()

        let peopleListInteractor = PeopleListInteractor(output: peopleListPresenter, peopleService: service)
        let personDetailsInteractor = PersonDetailsInteractor(output: personDetailsPresenter, peopleService: service)

        let personDetailsWireFrame = PersonDetailsWireFrame(personDetailsPresenter: personDetailsPresenter, personDetailsInteractor: personDetailsInteractor)
        let peopleListWireFrame = PeopleListWireFrame(mainWireFrame: MainWireFrame(), peopleListPresenter: peopleListPresenter, peopleListInteractor: peopleListInteractor, detailsWireFrame: personDetailsWireFrame)

        self.peopleListWireFrame = peopleListWireFrame
    }

    func installRootViewControllerInto(window: UIWindow) {
        peopleListWireFrame.presentListInterfaceFrom(window)
    }
}
