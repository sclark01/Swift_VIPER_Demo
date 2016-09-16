import Foundation

@testable import VIPER_Demo

class PersonDetailsInteractorMock : PersonDetailsInteractorType {
    let output: PersonDetailsPresenterType
    let service: PeopleServiceType

    var getPersonByIdCalled = false
    var getPersonByIdCalledWithId: Int? = nil

    init() {
        output = PersonDetailsPresenterMock()
        service = PeopleServiceMock()
    }

    func getPersonBy(id id: Int) {
        getPersonByIdCalled = true
        getPersonByIdCalledWithId = id
    }
}