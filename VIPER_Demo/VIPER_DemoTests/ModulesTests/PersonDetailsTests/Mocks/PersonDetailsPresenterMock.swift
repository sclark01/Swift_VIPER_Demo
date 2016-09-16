import Foundation

@testable import VIPER_Demo

class PersonDetailsPresenterMock : PersonDetailsPresenterType {
    var personDetailsWireFrame: PersonDetailsWireFrame?
    var userInterface: PersonDetailsView?
    var interactor: PersonDetailsInteractorType?

    var gotPerson: Person?

    func updateViewFor(id id: Int) {

    }

    func got(person person: Person) {
        gotPerson = person
    }
}