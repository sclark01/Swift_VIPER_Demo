import Foundation

struct PeopleListDataModel {
    private let people: [PersonForListData]

    init(people: [PersonForListData]) {
        self.people = people
    }

    var sections: Int {
        return 1
    }

    var rows: Int {
        return people.count
    }

    func personAt(index i: Int) -> PersonForListDataModel {
        return PersonForListDataModel(person: people[i])
    }
}

struct PersonForListDataModel {
    private let person: PersonForListData

    var name: String {
        return person.name
    }

    var phone: String {
        return "Phone: \(person.phone)"
    }

    var id: Int {
        return person.id
    }
}