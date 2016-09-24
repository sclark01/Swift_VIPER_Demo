import Foundation

protocol PersonDetailsInteractorInput {
    func getPersonBy(id: Int)
}

protocol PersonDetailsInteractorOutput {
    func got(person: PersonDetailsData)
}
