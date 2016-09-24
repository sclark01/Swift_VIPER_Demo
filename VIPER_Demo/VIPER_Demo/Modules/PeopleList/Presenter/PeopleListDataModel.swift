import Foundation

struct PeopleListDataModel {
    fileprivate let people: [PersonForListData]

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

extension PeopleListDataModel : Equatable {}

func ==(lhs: PeopleListDataModel, rhs: PeopleListDataModel) -> Bool {
    if lhs.sections != rhs.sections || lhs.rows != rhs.rows {
        return false
    }

    for person in lhs.people {
        if !rhs.people.contains(person) {
            return false
        }
    }

    return true
}

struct PersonForListDataModel {
    internal let person: PersonForListData

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

extension PersonForListDataModel : Equatable {}

func ==(lhs: PersonForListDataModel, rhs: PersonForListDataModel) -> Bool {
    return lhs.name == rhs.name &&
        lhs.phone == rhs.phone &&
    lhs.id == rhs.id
}
