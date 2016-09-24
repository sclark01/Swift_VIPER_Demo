import UIKit
import Quick
import Nimble

@testable import VIPER_Demo

class PersonDetailsWireFrameTests : QuickSpec {
    override func spec() {
        describe("present details view from viewcontroller") {
            var wireFrame: TestablePersonDetailsWireFrame?

            beforeEach {
                wireFrame = TestablePersonDetailsWireFrame(personDetailsPresenter: PersonDetailsPresenterMock(), personDetailsInteractor: PersonDetailsInteractorMock())
            }

            it("push the correct viewcontroller") {
                wireFrame?.presentDetailsViewFrom(viewController: UIViewController(), withId: 1)

                expect(wireFrame?.pushedViewController).to(beAKindOf(PersonDetailsViewController.self))
            }

            it("set the correct person id on the view controller") {
                let id = 2

                wireFrame?.presentDetailsViewFrom(viewController: UIViewController(), withId: id)

                let pushedVC = wireFrame?.pushedViewController as! PersonDetailsViewController

                expect(pushedVC.personId) == id
            }
        }
    }
}

