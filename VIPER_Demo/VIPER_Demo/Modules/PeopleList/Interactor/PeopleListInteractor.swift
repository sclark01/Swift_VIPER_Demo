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
            guard let strongSelf = self,
                output = strongSelf.output as? PeopleListPresenter else { return }
            output.gotPeople(people: people)
        }
    }
}