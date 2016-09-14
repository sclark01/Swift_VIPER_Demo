import UIKit

class PeopleListViewController : UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var eventHandler: PeopleListPresenterType!

    private var people: [Person] = []

    override func viewDidLoad() {
        if let eventHandler = eventHandler as? PeopleListPresenter {
            eventHandler.updateView()
        }
        navigationItem.title = "Contacts"
    }
}

extension PeopleListViewController : PeopleListViewType {
    func set(people: [Person]) {
        self.people = people
        tableView.reloadData()
    }
}

extension PeopleListViewController : UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID = "person"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID) ?? UITableViewCell(style: .Subtitle, reuseIdentifier: cellID)

        let person = people[indexPath.row]
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = person.phone
        return cell
    }
}
