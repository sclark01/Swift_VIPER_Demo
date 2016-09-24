import UIKit

class PeopleListViewController : UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var eventHandler: PeopleListPresenterType?
    fileprivate var peopleList: PeopleListDataModel?

    override func viewDidLoad() {
        eventHandler?.updateView()
        navigationItem.title = "Contacts"
    }
}

extension PeopleListViewController : PeopleListViewType {
    func set(_ people: PeopleListDataModel) {
        self.peopleList = people 
        tableView.reloadData()
    }
}

extension PeopleListViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return peopleList?.sections ?? 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList?.rows ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "person"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellID)

        if let person = peopleList?.personAt(index: (indexPath as NSIndexPath).row) {
            cell.textLabel?.text = person.name
            cell.detailTextLabel?.text = person.phone
        }
        return cell
    }
}

extension PeopleListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let person = peopleList?.personAt(index: (indexPath as NSIndexPath).row) {
            eventHandler?.detailsForPerson(withId: person.id)
        }
    }
}
