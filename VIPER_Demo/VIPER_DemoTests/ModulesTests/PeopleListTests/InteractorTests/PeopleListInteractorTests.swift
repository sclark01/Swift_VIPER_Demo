import Foundation
import Quick
import Nimble

@testable import VIPER_Demo

class PeopleListInteractorTests : QuickSpec {
    override func spec() {
        describe("people list interactor") {
            var mockService: PeopleServiceMock!
            var mockPresenter: PeopleListPresenterMock!
            var interactor: PeopleListInteractor!

            let person = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
            beforeEach {
                mockService = PeopleServiceMock()
                mockPresenter = PeopleListPresenterMock()

                mockService.returnWithPerson = person
                interactor = PeopleListInteractor(output: mockPresenter, peopleService: mockService)
            }

            it("should request people from service") {
                interactor.getPeople()

                expect(mockService.getPeopleCalled).to(beTrue())
            }

            it("should call output with list of person for list data") {
                interactor.getPeople()

                let expected = PersonForListData(person: person)

                expect(mockPresenter.gotCalledWithPeople.first).toEventually(equal(expected))
            }
        }
    }
}