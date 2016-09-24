import UIKit

class PersonDetailsWireFrame {

    var personDetailsPresenter: PersonDetailsPresenterType
    var personDetailsViewController: PersonDetailsViewController?
    let personDetailsInteractor: PersonDetailsInteractorType

    init(personDetailsPresenter presenter: PersonDetailsPresenterType, personDetailsInteractor: PersonDetailsInteractorType) {
        self.personDetailsPresenter = presenter
        self.personDetailsInteractor = personDetailsInteractor
    }

    func presentDetailsViewFrom(viewController: UIViewController, withId id: Int) {
        let storyBoard = UIStoryboard(name: "PersonDetails", bundle: nil)
        guard let newViewController = storyBoard.instantiateInitialViewController() as? PersonDetailsViewController else { return }

        configurePersonDetailsPresenterWith(viewController: newViewController)

        newViewController.eventHandler = personDetailsPresenter
        newViewController.personId = id

        personDetailsViewController = newViewController

        push(newViewController: newViewController, onTo: viewController)
    }

    internal func push(newViewController vc: UIViewController, onTo oldVC: UIViewController) {
        oldVC.navigationController?.pushViewController(vc, animated: true)
    }

    fileprivate func configurePersonDetailsPresenterWith(viewController vc: PersonDetailsViewController) {
        personDetailsPresenter.userInterface = vc
        personDetailsPresenter.personDetailsWireFrame = self
        personDetailsPresenter.interactor = personDetailsInteractor
    }
}
