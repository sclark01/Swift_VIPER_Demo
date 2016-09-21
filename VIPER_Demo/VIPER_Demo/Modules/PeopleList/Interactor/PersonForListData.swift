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