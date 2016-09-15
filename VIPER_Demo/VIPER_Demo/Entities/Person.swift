import Foundation

struct Person {
    let id: Int
    let name: String
    let phone: String
    let age: String
}

extension Person : Equatable {}

func ==(lhs: Person, rhs: Person) -> Bool {
    return
        lhs.phone == rhs.phone &&
        lhs.name == rhs.name &&
        lhs.age == rhs.age
}