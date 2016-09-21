import Foundation

protocol PersonDetailsInteractorInput {
    func getPersonBy(id id: Int)
}

protocol PersonDetailsInteractorOutput {
    func got(person person: PersonData)
}