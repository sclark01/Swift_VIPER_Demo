import UIKit

class PersonDetailsViewController : UIViewController {
    var eventHandler: PersonDetailsPresenterType?

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

    override func viewDidLoad() {
        navigationItem.title = "Details"
    }
}

extension PersonDetailsViewController : PersonDetailsView {
    func display(_ person: PersonDetailsDataModel) {
        nameLabel.text = person.name
        phoneLabel.text = person.phone
        ageLabel.text = person.age
    }
}
