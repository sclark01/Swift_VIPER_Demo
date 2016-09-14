import UIKit

class PeopleListWireFrame {
    let mainWireFrame: MainWireFrame

    var peopleListPresenter: PeopleListPresenterType
    var peopleListInteractor: PeopleListInteractorType?
    var peopleListViewController: PeopleListViewController?

    init(mainWireFrame: MainWireFrame, peopleListPresenter: PeopleListPresenterType, peopleListInteractor: PeopleListInteractorType) {
        self.mainWireFrame = mainWireFrame
        self.peopleListPresenter = peopleListPresenter
        self.peopleListInteractor = peopleListInteractor
    }

    func presentListInterfaceFrom(window: UIWindow) {
        let storyBoard = UIStoryboard(name: "PeopleList", bundle: nil)
        guard let viewController = storyBoard.instantiateInitialViewController() as? PeopleListViewController else { return }

        peopleListPresenter.interactor = peopleListInteractor
        peopleListPresenter.userInterface = viewController

        viewController.eventHandler = peopleListPresenter
        peopleListViewController = viewController

        mainWireFrame.display(rootViewController: viewController, inWindow: window)
    }
}