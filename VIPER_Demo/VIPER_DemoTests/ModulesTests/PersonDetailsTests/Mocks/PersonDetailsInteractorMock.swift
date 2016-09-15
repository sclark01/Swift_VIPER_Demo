import Foundation

@testable import VIPER_Demo

class PersonDetailsInteractorMock : PersonDetailsInteractorType {
    let output: PersonDetailsPresenterType
    let service: PeopleServiceType

    init() {
        output = PersonDetailsPresenterMock()
        service = PeopleServiceMock()
    }
}