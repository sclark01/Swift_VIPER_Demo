import Foundation

@testable import VIPER_Demo

class PersonDetailsPresenterMock : PersonDetailsPresenterType {
    var personDetailsWireFrame: PersonDetailsWireFrame?
    var userInterface: PersonDetailsView?
    var interactor: PersonDetailsInteractorType?

    func updateViewFor(id id: Int) {

    }

    func got(person person: Person) {

    }
}