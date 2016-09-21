import Foundation

protocol PeopleListInteractorInput {
    func getPeople()
}

protocol PeopleListInteractorOutput {
    func gotPeople(people people: [PersonForListData])
}