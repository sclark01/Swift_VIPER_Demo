import Foundation
import Quick
import Nimble

@testable import VIPER_Demo

class PeopleListWireFrameTests : QuickSpec {
    override func spec() {

        var peopleListWireFrame: PeopleListWireFrame!
        var mockMainWireFrame: MainWireFrameMock!
        var mockPersonDetailsWireFrame: PersonDetailsWireFrameMock!

        beforeEach {
            mockMainWireFrame = MainWireFrameMock()
            let mockPeopleListPresenter = PeopleListPresenterMock()
            let mockPeopleListInteractor = PeopleListInteractorMock(output: mockPeopleListPresenter, peopleService: PeopleServiceMock())

            let mockPersonDetailsPresnter = PersonDetailsPresenterMock()
            let mockPersonDetailsInteractor = PersonDetailsInteractorMock()

            mockPersonDetailsWireFrame = PersonDetailsWireFrameMock(personDetailsPresenter: mockPersonDetailsPresnter, personDetailsInteractor: mockPersonDetailsInteractor)

            peopleListWireFrame = PeopleListWireFrame(mainWireFrame: mockMainWireFrame, peopleListPresenter: mockPeopleListPresenter, peopleListInteractor: mockPeopleListInteractor, detailsWireFrame: mockPersonDetailsWireFrame)
        }

        describe("the people list wireframe") {
            it("should present the proper view controller to the mainwireframe") {
                peopleListWireFrame.presentListInterfaceFrom(UIWindow())

                expect(mockMainWireFrame.didDisplayWithViewController).to(beAKindOf(PeopleListViewController))
            }

            it("should present the correct view controller and id to person details wireframe") {
                let id = 10
                peopleListWireFrame.peopleListViewController = PeopleListViewController()
                peopleListWireFrame.presentDetailsFor(id: id)

                expect(mockPersonDetailsWireFrame.didPresentWithViewController).to(beAKindOf(PeopleListViewController))
                expect(mockPersonDetailsWireFrame.didPresentWithID) == id
            }
        }
    }
}
