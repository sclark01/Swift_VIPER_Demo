import Foundation

@testable import VIPER_Demo

class PeopleListInteractorMock : PeopleListInteractorType {
    let output: PeopleListPresenterType
    let service: PeopleServiceType

    var didCallGetPeople = false

    init(output: PeopleListPresenterType, peopleService: PeopleServiceType) {
        self.output = output
        self.service = peopleService
    }

    func getPeople() {
        didCallGetPeople = true
    }
}