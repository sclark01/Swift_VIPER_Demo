import Foundation

struct Person {
    let id: Int
    let name: String
    let phone: String
}

extension Person : Equatable {}

func ==(lhs: Person, rhs: Person) -> Bool {
    return
        lhs.id == rhs.id &&
        lhs.phone == rhs.phone &&
        lhs.name == rhs.name
}