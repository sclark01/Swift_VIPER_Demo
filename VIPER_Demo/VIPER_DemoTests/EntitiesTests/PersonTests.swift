import Foundation
import Quick
import Nimble

@testable import VIPER_Demo

class PersonTests : QuickSpec {
    override func spec() {
        describe("a person") {
            it("should be equal when they have the same value for phone, name, and age") {
                let person1 = Person(id: 0, name: "someName", phone: "somePhone", age: "someAge")
                let person2 = Person(id: 0, name: "someName", phone: "somePhone", age: "someAge")

                expect(person1) == person2
            }

            it("should be equal when they have the same value for phone, name, and age, but a different ID") {
                let person1 = Person(id: 0, name: "someName", phone: "somePhone", age: "someAge")
                let person2 = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")

                expect(person1) == person2
            }

            it("should not be equal when they have a different value for name") {
                let person1 = Person(id: 0, name: "someName", phone: "somePhone", age: "someAge")
                let person2 = Person(id: 1, name: "differentName", phone: "somePhone", age: "someAge")

                expect(person1) != person2
            }

            it("should not be equal when they have a different value for phone") {
                let person1 = Person(id: 0, name: "someName", phone: "somePhone", age: "someAge")
                let person2 = Person(id: 1, name: "someName", phone: "differentPhone", age: "someAge")

                expect(person1) != person2
            }

            it("should not be equal when they have a different value for age") {
                let person1 = Person(id: 0, name: "someName", phone: "somePhone", age: "someAge")
                let person2 = Person(id: 1, name: "someName", phone: "somePhone", age: "differentAge")

                expect(person1) != person2
            }
        }
    }
}