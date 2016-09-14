import Foundation

protocol PeopleListPresenterType {
    var userInterface: PeopleListViewType? { get set }
    var interactor: PeopleListInteractorType? { get set }
}

class PeopleListPresenter : PeopleListPresenterType, PeopleListInteractorOutput, PeopleListModuleInterface {
    var userInterface: PeopleListViewType?
    var interactor: PeopleListInteractorType?

    func updateView() {
        guard let interactor = interactor as? PeopleListInteractor else { return }
        interactor.getPeople()
    }

    func gotPeople(people people: [Person]) {
        userInterface?.set(people)
    }
}