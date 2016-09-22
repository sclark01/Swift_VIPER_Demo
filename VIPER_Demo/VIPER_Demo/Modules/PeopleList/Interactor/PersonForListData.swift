import Foundation

struct PersonForListData {
    let id: Int
    let name: String
    let phone: String

    init(person: Person) {
        id = person.id
        name = person.name
        phone = person.phone
    }
}

extension PersonForListData : Equatable {}

func ==(lhs: PersonForListData, rhs: PersonForListData) -> Bool {
    return lhs.id == rhs.id &&
    lhs.name == rhs.name &&
    lhs.phone == rhs.phone 
}