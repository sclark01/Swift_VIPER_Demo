import Foundation

struct PersonDetailsDataModel {
    private let person: PersonData

    init(person: PersonData) {
        self.person = person
    }

    var name: String {
        return "Name: \(person.name)"
    }

    var phone: String {
        return "Phone: \(person.phone)"
    }

    var age: String {
        return "Age: \(person.age)"
    }
}

extension PersonDetailsDataModel : Equatable {}

func ==(lhs: PersonDetailsDataModel, rhs: PersonDetailsDataModel) -> Bool {
    return lhs.person == rhs.person
}