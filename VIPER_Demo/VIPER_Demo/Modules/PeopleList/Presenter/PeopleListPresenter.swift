import Foundation

protocol PeopleListPresenterType : PeopleListInteractorOutput, PeopleListModuleInterface {
    var userInterface: PeopleListViewType? { get set }
    var interactor: PeopleListInteractorType? { get set }
    var peopleListWireFrame: PeopleListWireFrame? { get set }
}

class PeopleListPresenter : PeopleListPresenterType {
    var userInterface: PeopleListViewType?
    var interactor: PeopleListInteractorType?
    var peopleListWireFrame: PeopleListWireFrame?

    func updateView() {
        interactor?.getPeople()
    }

    func gotPeople(people: [PersonForListData]) {
        userInterface?.set(PeopleListDataModel(people: people))
    }

    func detailsForPerson(withId Id: Int) {
        peopleListWireFrame?.presentDetailsFor(id: Id)
    }
}
