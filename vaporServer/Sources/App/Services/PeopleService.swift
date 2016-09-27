import Foundation
import Vapor

struct PeopleService {
	let people = [
		Person(id: 0, name: "Spence Chen", age: 20, phone: "+1 (929) 535-3923"),
		Person(id: 1, name: "Dorsey Spears", age: 23, phone: "+1 (878) 414-3393"),
		Person(id: 2, name: "Higgins Hahn", age: 24, phone: "+1 (978) 456-3280"),
		Person(id: 3, name: "McDonald Peterson", age: 37, phone: "+1 (812) 428-2904"),
		Person(id: 4, name: "Hannah Bates", age: 23, phone: "+1 (825) 578-2298"),
		Person(id: 5, name: "Evangelina Santiago", age: 39, phone: "+1 (922) 532-3163"),
		Person(id: 6, name: "Ballard Craig", age: 25, phone: "+1 (833) 446-2826"),
		Person(id: 7, name: "Brown Holt", age: 33, phone: "+1 (961) 570-2724"),
        Person(id: 8, name: "Shea Clark-Tieche", age: 23, phone: "+1 (233) 534-2233")

	]

    func getAllPeople() -> JSON {
        return try! JSON(node: people.map { person in
            try! JSON(node: ["id" : person.id, "name" : person.name])
            })
    }

    func getAllPeopleWithDetails() -> JSON {
        return try! JSON(node: self.people.map { try! $0.makeJSON() })
    }

    func getPersonBy(id: Int) -> JSON {
        let person = people.filter {
            $0.id == id
        }.first
        return try! JSON(node: [person?.makeJSON()])
    }
}
