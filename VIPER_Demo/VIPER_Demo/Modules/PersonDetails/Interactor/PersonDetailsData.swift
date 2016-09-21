import Foundation

struct PersonDetailsData {
    let name: String
    let age: String
    let phone: String

    init(person: Person) {
        name = person.name
        age = person.age
        phone = person.phone
    }
}

extension PersonDetailsData : Equatable {}

func ==(lhs: PersonDetailsData, rhs: PersonDetailsData) -> Bool {
    return lhs.name == rhs.name &&
        lhs.age == rhs.age &&
        lhs.phone == rhs.phone
}