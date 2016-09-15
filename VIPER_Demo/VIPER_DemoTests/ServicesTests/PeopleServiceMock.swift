import Foundation

@testable import VIPER_Demo

class PeopleServiceMock : PeopleServiceType {
    func getPeople(onCompletion: ([Person]) -> Void) {

    }

    func getPersonByID(withID id: Int, onCompletion: (Person) -> Void) {

    }
}