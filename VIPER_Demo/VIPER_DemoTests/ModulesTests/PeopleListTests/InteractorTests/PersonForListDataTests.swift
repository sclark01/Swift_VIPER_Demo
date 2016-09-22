import Foundation
import Quick
import Nimble

@testable import VIPER_Demo

class PersonForListDataTests : QuickSpec {
    override func spec() {
        describe("person for list data") {
            it("should be equal when the name, id, and phone is the same") {
                let person1 = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
                let dataModel1 = PersonForListData(person: person1)
                let dataModel2 = PersonForListData(person: person1)

                expect(dataModel1) == dataModel2
            }

            it("should not be equal when the name is different") {
                let person1 = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
                let person2 = Person(id: 1, name: "differentName", phone: "somePhone", age: "someAge")
                let dataModel1 = PersonForListData(person: person1)
                let dataModel2 = PersonForListData(person: person2)

                expect(dataModel1) != dataModel2
            }

            it("should not be equal when the phone is different") {
                let person1 = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
                let person2 = Person(id: 1, name: "someName", phone: "differentPhone", age: "someAge")
                let dataModel1 = PersonForListData(person: person1)
                let dataModel2 = PersonForListData(person: person2)

                expect(dataModel1) != dataModel2
            }

            it("should not be equal when the id is different") {
                let person1 = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
                let person2 = Person(id: 2, name: "someName", phone: "somePhone", age: "someAge")
                let dataModel1 = PersonForListData(person: person1)
                let dataModel2 = PersonForListData(person: person2)

                expect(dataModel1) != dataModel2
            }
        }
    }
}