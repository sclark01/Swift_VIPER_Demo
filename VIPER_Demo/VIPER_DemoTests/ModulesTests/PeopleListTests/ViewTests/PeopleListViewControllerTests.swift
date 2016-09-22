import UIKit
import Quick
import Nimble

@testable import VIPER_Demo

class PeopleListViewControllerTests : QuickSpec {
    override func spec() {
        describe("the people list view controller") {
            var viewController: PeopleListViewController!
            var mockPresenter: PeopleListPresenterMock!

            let person = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")

            beforeEach {
                let storyBoard = UIStoryboard(name: "PeopleList", bundle: nil)
                viewController = storyBoard.instantiateInitialViewController() as! PeopleListViewController
                mockPresenter = PeopleListPresenterMock()
                mockPresenter.userInterface = viewController
                mockPresenter.willSetViewWithPerson = person
                viewController.eventHandler = mockPresenter
                let _ = viewController.view
            }

            it("should ask for data from event handler on load") {
                expect(mockPresenter.didCallUpdateView).to(beTrue())
            }

            it("should return the count of people for number of rows in section") {
                let rows = viewController.tableView(viewController.tableView, numberOfRowsInSection: 0)
                expect(rows).toEventually(equal(1))
            }

            it("should return the correct cell with label set") {
                let cell = viewController.tableView(viewController.tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
                expect(cell.textLabel!.text).toEventually(equal(person.name))
                expect(cell.detailTextLabel!.text).toEventually(equal("Phone: \(person.phone)"))
            }

            it("should notify event handler on selection with corrrect ID") {
                viewController.tableView(viewController.tableView, didSelectRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))

                expect(mockPresenter.didCallDetailsForPersonWithID) == person.id
            }
        }
    }
}

