import Foundation

@testable import VIPER_Demo

class PeopleListWireFrameMock : PeopleListWireFrame {
    var didPresentWithID: Int!

    override func presentDetailsFor(id id: Int) {
        didPresentWithID = id
    }
}