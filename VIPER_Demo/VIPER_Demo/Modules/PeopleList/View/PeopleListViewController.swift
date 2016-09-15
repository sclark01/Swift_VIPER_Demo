import UIKit

class PeopleListViewController : UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var eventHandler: PeopleListPresenterType!

    private var peopleList: PeopleListDataModel?

    override func viewDidLoad() {
        if let eventHandler = eventHandler as? PeopleListPresenter {
            eventHandler.updateView()
        }
        navigationItem.title = "Contacts"
    }
}

extension PeopleListViewController : PeopleListViewType {
    func set(people: [Person]) {
        self.peopleList = PeopleListDataModel(people: people)
        tableView.reloadData()
    }
}

extension PeopleListViewController : UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return peopleList?.sections ?? 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList?.rows ?? 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID = "person"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID) ?? UITableViewCell(style: .Subtitle, reuseIdentifier: cellID)

        if let person = peopleList?.personAt(index: indexPath.row) {
            cell.textLabel?.text = person.name
            cell.detailTextLabel?.text = person.phone
        }
        return cell
    }
}

extension PeopleListViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let person = peopleList?.personAt(index: indexPath.row),
           let eventHandler = eventHandler as? PeopleListPresenter {
            eventHandler.detailsForPerson(withId: person.id)
        }
    }
}
