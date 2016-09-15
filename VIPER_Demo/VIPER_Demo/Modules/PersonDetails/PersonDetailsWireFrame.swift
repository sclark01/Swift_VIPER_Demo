import UIKit

class PersonDetailsWireFrame {

    let personDetailsPresenter: PersonDetailsPresenter
    var personDetailsViewController: PersonDetailsViewController?
    let personDetailsInteractor: PersonDetailsInteractorType

    init(personDetailsPresenter presenter: PersonDetailsPresenter, personDetailsInteractor: PersonDetailsInteractorType) {
        self.personDetailsPresenter = presenter
        self.personDetailsInteractor = personDetailsInteractor
    }

    func presentDetailsViewFrom(viewController viewController: UIViewController, withId id: Int) {
        let storyBoard = UIStoryboard(name: "PersonDetails", bundle: nil)
        guard let newViewController = storyBoard.instantiateInitialViewController() as? PersonDetailsViewController else { return }

        personDetailsPresenter.userInterface = newViewController
        personDetailsPresenter.personDetailsWireFrame = self
        personDetailsPresenter.interactor = personDetailsInteractor

        newViewController.eventHandler = personDetailsPresenter
        newViewController.personId = id

        personDetailsViewController = newViewController

        viewController.navigationController?.pushViewController(newViewController, animated: true)
    }
}
