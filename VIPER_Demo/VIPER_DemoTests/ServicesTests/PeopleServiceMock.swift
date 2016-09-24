import Foundation

@testable import VIPER_Demo

class PeopleServiceMock : PeopleServiceType {
    var getPersonByIdCallWithId: Int?

    var returnWithPerson: Person?
    var getPeopleCalled = false

    func getPeople(_ onCompletion: @escaping ([Person]) -> Void) {
        getPeopleCalled = true
        onCompletion([returnWithPerson!])
    }

    func getPersonByID(withID id: Int, onCompletion: @escaping (Person) -> Void) {
        getPersonByIdCallWithId = id
        onCompletion(returnWithPerson!)
    }
}
