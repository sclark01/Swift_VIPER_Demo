import Foundation

@testable import VIPER_Demo

class PeopleListPresenterMock : PeopleListPresenterType {
    var userInterface: PeopleListViewType?
    var interactor: PeopleListInteractorType?
    var peopleListWireFrame: PeopleListWireFrame?
    
    var didCallUpdateView = false
    var didCallDetailsForPersonWithID: Int?

    var gotCalledWithPeople: [PersonForListData]!

    var willSetViewWithPerson: Person!

    func detailsForPerson(withId id: Int) {
        didCallDetailsForPersonWithID = id 
    }

    func got(people: [PersonForListData]) {
        gotCalledWithPeople = people
    }

    func updateView() {
        didCallUpdateView = true
        let people = PeopleListDataModel(people: [PersonForListData(person: willSetViewWithPerson)])
        userInterface?.set(people)
    }
}
