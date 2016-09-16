import Foundation

@testable import VIPER_Demo

class PeopleServiceMock : PeopleServiceType {
    var getPersonByIdCallWithId: Int?

    var returnWithPerson: Person?

    func getPeople(onCompletion: ([Person]) -> Void) {

    }

    func getPersonByID(withID id: Int, onCompletion: (Person) -> Void) {
        getPersonByIdCallWithId = id
        onCompletion(returnWithPerson!)
    }
}