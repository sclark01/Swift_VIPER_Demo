import Foundation

protocol PeopleListInteractorType : PeopleListInteractorInput {
    var output: PeopleListPresenterType { get }
    var service: PeopleServiceType { get }
}

class PeopleListInteractor : PeopleListInteractorType {
    let output: PeopleListPresenterType
    let service: PeopleServiceType

    init(output: PeopleListPresenterType, peopleService: PeopleServiceType) {
        self.output = output
        self.service = peopleService
    }

    func getPeople() {
        service.getPeople { [weak self] people in
            let peopleList = people.map {
                PersonForListData(person: $0)
            }
            self?.output.got(people: peopleList)
        }
    }
}
