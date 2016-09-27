import Foundation
import Vapor

struct Person {
	let id: Int
	let name: String
	let age: Int
	let phone: String
}

extension Person : JSONRepresentable {
    func makeJSON() throws -> JSON {
        return try! JSON(node: [
            "id" : id,
            "name": name,
            "age" : age,
            "phone": phone
        ])
    }
}

extension Person: Equatable {}

func ==(lhs: Person, rhs: Person) -> Bool {
	return lhs.name == rhs.name &&
			lhs.age == rhs.age &&
			lhs.phone == rhs.phone
}
