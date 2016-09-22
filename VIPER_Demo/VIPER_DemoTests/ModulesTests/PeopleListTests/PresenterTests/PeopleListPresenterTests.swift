import Foundation
import Quick
import Nimble

@testable import VIPER_Demo

class PeopleListPresenterTests : QuickSpec {
    override func spec() {
        var peopleListPresenter: PeopleListPresenter!
        var mockPeopleListInteractor: PeopleListInteractorMock!
        var mockPeopleListView: PeopleListViewMock!
        var mockPeopleListWireFrame: PeopleListWireFrameMock!

        beforeEach {
            peopleListPresenter = PeopleListPresenter()
            mockPeopleListInteractor = PeopleListInteractorMock(output: peopleListPresenter, peopleService: PeopleServiceMock())
            mockPeopleListView = PeopleListViewMock()
            mockPeopleListWireFrame = PeopleListWireFrameMock(mainWireFrame: MainWireFrameMock(), peopleListPresenter: peopleListPresenter, peopleListInteractor: mockPeopleListInteractor, detailsWireFrame: PersonDetailsWireFrameMock(personDetailsPresenter: PersonDetailsPresenterMock(), personDetailsInteractor: PersonDetailsInteractorMock()))

            peopleListPresenter.interactor = mockPeopleListInteractor
            peopleListPresenter.userInterface = mockPeopleListView
            peopleListPresenter.peopleListWireFrame = mockPeopleListWireFrame
        }


        describe("the people list presenter") {
            it("should initiate getting people from interactor on update") {
                peopleListPresenter.updateView()

                expect(mockPeopleListInteractor.didCallGetPeople).to(beTrue())
            }

            it("should update the user interface with a peoplelistData model when it gets people") {
                let people = [PersonForListData(person: Person(id: 1, name: "someName", phone: "somePhone", age: "someAge"))]

                let expectedModel = PeopleListDataModel(people: people)

                peopleListPresenter.gotPeople(people: people)

                expect(mockPeopleListView.didSetWithPeople) == expectedModel
            }

            it("should tell the people list wire frame to present the proper id") {
                let id = 10
                peopleListPresenter.detailsForPerson(withId: id)

                expect(mockPeopleListWireFrame.didPresentWithID) == id
            }

        }
    }
}
