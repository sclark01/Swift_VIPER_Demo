import Foundation
import Quick
import Nimble

@testable import VIPER_Demo

class PersonDetailsDataModelTests : QuickSpec {
    override func spec() {
        describe("person data model") {
            var dataModel: PersonDetailsDataModel!

            beforeEach {
                let person = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
                dataModel = PersonDetailsDataModel(person: person)
            }

            it("should return a properly formatted name") {
                let expectedNameString = "Name: someName"

                expect(dataModel.name) == expectedNameString
            }

            it("should return a properly formatted phone") {
                let expectedNameString = "Phone: somePhone"

                expect(dataModel.phone) == expectedNameString
            }

            it("should return a properly formatted age") {
                let expectedNameString = "Age: someAge"

                expect(dataModel.age) == expectedNameString
            }

            it("should be equal to another data model if it's the same person") {
                let samePerson = Person(id: 2, name: "sameName", phone: "samePhone", age: "sameAge")
                let dataModel1 = PersonDetailsDataModel(person: samePerson)
                let dataModel2 = PersonDetailsDataModel(person: samePerson)

                expect(dataModel1) == dataModel2
            }

            it("should not be equal to another data model if it's not the same person") {
                let aPerson = Person(id: 2, name: "sameName", phone: "samePhone", age: "sameAge")
                let aDifferentPerson = Person(id: 1, name: "difName", phone: "difPhone", age: "difAge")
                let dataModel1 = PersonDetailsDataModel(person: aPerson)
                let dataModel2 = PersonDetailsDataModel(person: aDifferentPerson)

                expect(dataModel1) != dataModel2
            }
        }
    }
}