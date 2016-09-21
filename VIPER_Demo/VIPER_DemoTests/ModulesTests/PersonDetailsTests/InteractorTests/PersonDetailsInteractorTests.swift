import Foundation
import Quick
import Nimble

@testable import VIPER_Demo

class PersonDetailsInteractorTests : QuickSpec {
    override func spec() {
        describe("get person by id") {
            var interactor: PersonDetailsInteractor?
            var mockService: PeopleServiceMock?
            var mockPresenter: PersonDetailsPresenterMock?
            let id = 10
            let person = Person(id: id, name: "someName", phone: "somePhone", age: "someAge")

            beforeEach {
                mockService = PeopleServiceMock()
                mockPresenter = PersonDetailsPresenterMock()
                interactor = PersonDetailsInteractor(output: mockPresenter!, peopleService: mockService!)

                mockService!.returnWithPerson = person
            }

            it("should call the service with proper id") {
                interactor!.getPersonBy(id: id)

                expect(mockService!.getPersonByIdCallWithId).toNot(beNil())
                expect(mockService!.getPersonByIdCallWithId) == id
            }

            it("should call the presenter on success with correct personData") {
                interactor!.getPersonBy(id: id)

                let expectedPersonData = PersonData(person: person)

                expect(mockPresenter?.gotPerson).toEventually(equal(expectedPersonData))
            }
        }
    }
}