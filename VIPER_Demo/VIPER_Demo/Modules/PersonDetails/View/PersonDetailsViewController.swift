import UIKit

class PersonDetailsViewController : UIViewController {
    var eventHandler: PersonDetailsPresenter?

    var personId: Int? {
        didSet {
            if let id = personId {
                eventHandler?.updateViewFor(id: id)
            }
        }
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
}

extension PersonDetailsViewController : PersonDetailsView {
    func display(person: PersonDetailsDataModel) {
        nameLabel.text = person.name
        phoneLabel.text = person.phone
        ageLabel.text = person.age
    }
}
