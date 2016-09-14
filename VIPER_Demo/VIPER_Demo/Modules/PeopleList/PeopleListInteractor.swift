import Foundation

protocol PeopleListInteractorType {
    var output: PeopleListPresenterType { get }
}

struct PeopleListInteractor : PeopleListInteractorType {
    let output: PeopleListPresenterType

    init(output: PeopleListPresenterType) {
        self.output = output
    }
}