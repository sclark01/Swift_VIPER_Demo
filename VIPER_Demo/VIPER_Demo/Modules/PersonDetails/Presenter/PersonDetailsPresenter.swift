import Foundation

protocol PersonDetailsPresenterType {
    var personDetailsWireFrame: PersonDetailsWireFrame? { get set }
    var userInterface: PersonDetailsView? { get set }
    var interactor: PersonDetailsInteractorType? { get set }
}

class PersonDetailsPresenter : PersonDetailsPresenterType, PersonDetailsModuleInterface, PersonDetailsInteractorOutput {
    var personDetailsWireFrame: PersonDetailsWireFrame?
    var userInterface: PersonDetailsView?
    var interactor: PersonDetailsInteractorType?

    func updateViewFor(id id: Int) {
        guard let interactor = interactor as? PersonDetailsInteractor else { return }
        interactor.getPersonBy(id: id)
    }

    func got(person person: Person) {
        userInterface?.display(PersonDetailsDataModel(person: person))
    }

}