import Foundation

protocol PersonDetailsPresenterType : PersonDetailsModuleInterface, PersonDetailsInteractorOutput {
    var personDetailsWireFrame: PersonDetailsWireFrame? { get set }
    var userInterface: PersonDetailsView? { get set }
    var interactor: PersonDetailsInteractorType? { get set }
}

class PersonDetailsPresenter : PersonDetailsPresenterType {
    var personDetailsWireFrame: PersonDetailsWireFrame?
    var userInterface: PersonDetailsView?
    var interactor: PersonDetailsInteractorType?

    func updateViewFor(id id: Int) {
        interactor?.getPersonBy(id: id)
    }

    func got(person person: Person) {
        userInterface?.display(PersonDetailsDataModel(person: person))
    }

}