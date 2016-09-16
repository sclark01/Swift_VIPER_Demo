import Foundation
import Quick
import Nimble

@testable import VIPER_Demo

class PersonDetailsViewControllerTests : QuickSpec {
    override func spec() {
        describe("the view controller") {
            it("should call the event handler to update view when id is set") {
                let vc = PersonDetailsViewController()
                let mockPresenter = PersonDetailsPresenterMock()
                let id = 10

                vc.eventHandler = mockPresenter
                vc.personId = id

                expect(mockPresenter.didUpdateViewForId).toNot(beNil())
                expect(mockPresenter.didUpdateViewForId) == id
            }

            it("should set the correct labels") {
                let storyBoard = UIStoryboard(name: "PersonDetails", bundle: nil)
                let vc = storyBoard.instantiateInitialViewController() as! PersonDetailsViewController
                let _ = vc.view

                let person = PersonDetailsDataModel(person: Person(id: 1, name: "someName", phone: "somePhone", age: "someAge"))

                vc.display(person)

                expect(vc.ageLabel.text) == person.age
                expect(vc.nameLabel.text) == person.name
                expect(vc.phoneLabel.text) == person.phone
            }
        }
    }
}