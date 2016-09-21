import Foundation

struct PersonData {
    let name: String
    let age: String
    let phone: String

    init(person: Person) {
        name = person.name
        age = person.age
        phone = person.phone
    }
}

extension PersonData : Equatable {}

func ==(lhs: PersonData, rhs: PersonData) -> Bool {
    return lhs.name == rhs.name &&
        lhs.age == rhs.age &&
        lhs.phone == rhs.phone
}