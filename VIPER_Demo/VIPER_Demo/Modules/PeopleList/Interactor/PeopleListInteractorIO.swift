import Foundation

protocol PeopleListInteractorInput {
    func getPeople()
}

protocol PeopleListInteractorOutput {
    func got(people: [PersonForListData])
}
