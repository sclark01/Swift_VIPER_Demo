import Foundation

@testable import VIPER_Demo

class PeopleListViewMock : PeopleListViewType {
    var didSetWithPeople: PeopleListDataModel!

    func set(people: PeopleListDataModel) {
        didSetWithPeople = people
    }
}