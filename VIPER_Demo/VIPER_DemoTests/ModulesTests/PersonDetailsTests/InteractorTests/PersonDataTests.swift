import Foundation
import Quick
import Nimble

@testable import VIPER_Demo

class PersonDataTests : QuickSpec {
    override func spec() {
        describe("person data") {
            it("should be equal when a person has the same name, age, and phone") {
                let person = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
                let personData = PersonDetailsData(person: person)
                let personData2 = PersonDetailsData(person: person)

                expect(personData) == personData2
            }

            it("should be equal when a person has a different id, but same name, age, and phone") {
                let person1 = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
                let person2 = Person(id: 2, name: "someName", phone: "somePhone", age: "someAge")
                let personData = PersonDetailsData(person: person1)
                let personData2 = PersonDetailsData(person: person2)

                expect(personData) == personData2
            }

            it("should not be equal when a person has a different name") {
                let person1 = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
                let person2 = Person(id: 1, name: "differentName", phone: "somePhone", age: "someAge")
                let personData = PersonDetailsData(person: person1)
                let personData2 = PersonDetailsData(person: person2)

                expect(personData) != personData2
            }

            it("should not be equal when a person has a different phone") {
                let person1 = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
                let person2 = Person(id: 1, name: "someName", phone: "differentPhone", age: "someAge")
                let personData = PersonDetailsData(person: person1)
                let personData2 = PersonDetailsData(person: person2)

                expect(personData) != personData2
            }

            it("should not be equal when a person has a different age") {
                let person1 = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
                let person2 = Person(id: 1, name: "someName", phone: "somePhone", age: "differentAge")
                let personData = PersonDetailsData(person: person1)
                let personData2 = PersonDetailsData(person: person2)

                expect(personData) != personData2
            }

            
        }
    }
}
