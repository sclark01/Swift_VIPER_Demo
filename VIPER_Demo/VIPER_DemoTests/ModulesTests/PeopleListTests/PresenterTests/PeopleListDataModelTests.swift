import Foundation
import Quick
import Nimble

@testable import VIPER_Demo

class PeopleListDataModelTests : QuickSpec {
    override func spec() {
        describe("people list data model") {
            var dataModel: PeopleListDataModel!
            var people: [PersonForListData]!
            let person1 = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
            let person2 = Person(id: 2, name: "anotherName", phone: "anotherPhone", age: "anotherAge")

            beforeEach {
                people = [PersonForListData(person: person1), PersonForListData(person: person2)]
                dataModel = PeopleListDataModel(people: people)
            }

            it("should return 1 for number of sections") {
                expect(dataModel.sections) == 1
            }

            it("should return the number of people for the number of rows") {
                let expectedRows = people.count

                expect(dataModel.rows) == expectedRows
            }

            it("should return a person at the given index") {
                let expectedPerson = PersonForListDataModel(person: people.first!)

                expect(dataModel.personAt(index: 0)) == expectedPerson
            }

            describe("equality") {
                it("should return true if the people are the same") {
                    let people = [PersonForListData(person: person1)]
                    let dataModel1 = PeopleListDataModel(people: people)
                    let dataModel2 = PeopleListDataModel(people: people)

                    expect(dataModel1) == dataModel2
                }

                it("should return false if the people are not the same") {
                    let people = [PersonForListData(person: person1)]
                    let otherPeople = [PersonForListData(person: person2)]

                    let dataModel1 = PeopleListDataModel(people: people)
                    let dataModel2 = PeopleListDataModel(people: otherPeople)

                    expect(dataModel1) != dataModel2
                }
            }
        }

        describe("the person for list data model") {
            var person: Person!
            var dataModel: PersonForListDataModel!

            beforeEach {
                person = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
                dataModel = PersonForListDataModel(person: PersonForListData(person: person))
            }

            it("should return a name without any changes") {
                expect(dataModel.name) == person.name
            }

            it("should return an id without any changes") {
                expect(dataModel.id) == person.id
            }

            it("should return a phone with the phone label") {
                let expectedString = "Phone: \(person.phone)"

                expect(dataModel.phone) == expectedString
            }

            describe("equality") {
                it("should return true when the name, phone, and id are the same") {
                    let dataModel1 = PersonForListDataModel(person: PersonForListData(person: person))
                    let dataModel2 = PersonForListDataModel(person: PersonForListData(person: person))

                    expect(dataModel1) == dataModel2
                }

                it("should return true even when the age is different") {
                    let differentPerson = Person(id: 1, name: "someName", phone: "somePhone", age: "differentAge")
                    let dataModel2 = PersonForListDataModel(person: PersonForListData(person: differentPerson))

                    expect(dataModel) == dataModel2
                }

                it("should return false when the name is different") {
                    let differentPerson = Person(id: 1, name: "differentName", phone: "somePhone", age: "someAge")
                    let dataModel2 = PersonForListDataModel(person: PersonForListData(person: differentPerson))

                    expect(dataModel) != dataModel2
                }

                it("should return false when the phone is different") {
                    let differentPerson = Person(id: 1, name: "someName", phone: "differentPhone", age: "someAge")
                    let dataModel2 = PersonForListDataModel(person: PersonForListData(person: differentPerson))

                    expect(dataModel) != dataModel2
                }

                it("should return false when the id is different") {
                    let differentPerson = Person(id: 2, name: "someName", phone: "somePhone", age: "someAge")
                    let dataModel2 = PersonForListDataModel(person: PersonForListData(person: differentPerson))

                    expect(dataModel) != dataModel2
                }
            }
        }
    }
}