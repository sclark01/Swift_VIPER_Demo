import UIKit

class PersonDetailsWireFrame {

    let personDetailsPresenter: PersonDetailsPresenter

    init(personDetailsPresenter presenter: PersonDetailsPresenter) {
        self.personDetailsPresenter = presenter
    }

    func presentDetailsViewFrom(viewController viewController: UIViewController) {
        personDetailsPresenter.personDetailsWireFrame = self

        let storyBoard = UIStoryboard(name: "PersonDetails", bundle: nil)
        guard let newViewController = storyBoard.instantiateInitialViewController() as? PersonDetailsViewController else { return }
        newViewController.personDetailsPresenter = personDetailsPresenter
        viewController.navigationController?.pushViewController(newViewController, animated: true)
    }
}
