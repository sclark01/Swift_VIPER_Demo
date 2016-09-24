import Foundation

protocol PersonDetailsInteractorType : PersonDetailsInteractorInput {
    var output: PersonDetailsPresenterType { get }
    var service: PeopleServiceType { get }
}

class PersonDetailsInteractor : PersonDetailsInteractorType {
    let output: PersonDetailsPresenterType
    let service: PeopleServiceType

    init(output: PersonDetailsPresenterType, peopleService: PeopleServiceType) {
        self.output = output
        self.service = peopleService
    }

    func getPersonBy(id: Int) {
        service.getPersonByID(withID: id) { [weak self] person in
            self?.output.got(person: PersonDetailsData(person: person))
        }
    }
}
