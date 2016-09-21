import Foundation

@testable import VIPER_Demo

class PersonDetailsPresenterMock : PersonDetailsPresenterType {
    var personDetailsWireFrame: PersonDetailsWireFrame?
    var userInterface: PersonDetailsView?
    var interactor: PersonDetailsInteractorType?

    var gotPerson: PersonData?
    var didUpdateViewForId: Int?

    func updateViewFor(id id: Int) {
        didUpdateViewForId = id 
    }

    func got(person person: PersonData) {
        gotPerson = person
    }
}