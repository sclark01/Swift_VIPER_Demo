import Foundation
import Quick
import Nimble

@testable import VIPER_Demo

class PersonDetailsPresenterTests : QuickSpec {
    override func spec() {
        describe("person details presenter") {
            var presenter: PersonDetailsPresenter!
            var mockInteractor: PersonDetailsInteractorMock!
            var mockUI: PersonDetailsViewMock!

            beforeEach {
                presenter = PersonDetailsPresenter()
                mockInteractor = PersonDetailsInteractorMock()
                mockUI = PersonDetailsViewMock()

                presenter.interactor = mockInteractor
                presenter.userInterface = mockUI
            }

            it("should update view by calling get person with ID") {
                let id = 10

                presenter.updateViewFor(id: id)

                expect(mockInteractor.getPersonByIdCalled).to(beTrue())
                expect(mockInteractor.getPersonByIdCalledWithId) == id
            }

            it("should notify UI when a person is found") {
                let personData = PersonDetailsData(person: Person(id: 1, name: "aName", phone: "aPhone", age: "anAge"))
                let expectedPerson = PersonDetailsDataModel(person: personData)

                presenter.got(person: personData)

                expect(mockUI.calledDisplayWithPerson).toNot(beNil())
                expect(mockUI.calledDisplayWithPerson) == expectedPerson
            }
        }
    }
}
