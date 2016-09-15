import UIKit

class PeopleListWireFrame {
    let mainWireFrame: MainWireFrame

    var peopleListPresenter: PeopleListPresenterType
    var peopleListInteractor: PeopleListInteractorType?
    var peopleListViewController: PeopleListViewController?

    let personDetailsWireFrame: PersonDetailsWireFrame

    init(mainWireFrame: MainWireFrame, peopleListPresenter: PeopleListPresenterType, peopleListInteractor: PeopleListInteractorType, detailsWireFrame: PersonDetailsWireFrame) {
        self.mainWireFrame = mainWireFrame
        self.peopleListPresenter = peopleListPresenter
        self.peopleListInteractor = peopleListInteractor
        self.personDetailsWireFrame = detailsWireFrame
    }

    func presentListInterfaceFrom(window: UIWindow) {
        let storyBoard = UIStoryboard(name: "PeopleList", bundle: nil)
        guard let viewController = storyBoard.instantiateInitialViewController() as? PeopleListViewController else { return }

        buildPeopleListPresenter(withViewController: viewController)

        viewController.eventHandler = peopleListPresenter
        peopleListViewController = viewController

        mainWireFrame.display(rootViewController: viewController, inWindow: window)
    }

    func presentDetailsFor(id id: Int) {
        if let viewController = peopleListViewController {
            personDetailsWireFrame.presentDetailsViewFrom(viewController: viewController, withId: id)
        }
    }

    private func buildPeopleListPresenter(withViewController viewController: PeopleListViewController) {
        peopleListPresenter.interactor = peopleListInteractor
        peopleListPresenter.userInterface = viewController
        peopleListPresenter.peopleListWireFrame = self
    }
}