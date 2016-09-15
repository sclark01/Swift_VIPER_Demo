import Foundation
import Quick
import Nimble
import SwiftyJSON

@testable import VIPER_Demo

class PeopleTransformerTests: QuickSpec {
    override func spec() {
        describe("TransformListOfPeople") {
            it("should transform json of people") {
                let expectedPerson = Person(id: 1, name: "someName", phone: "somePhone", age: "someAge")
                let jsonResponse = JSON([["id": 1, "name":"someName", "phone": "somePhone", "age": "someAge"]])
                let actualPerson = PeopleTransformer.transformPeopleFrom(JSON: jsonResponse).first

                expect(expectedPerson) == actualPerson
            }

            it("should put an empty string a JSON field is missing, or -1 for ID") {
                let expectedPerson = Person(id: -1, name: "", phone: "", age: "")
                let jsonResponse = JSON([["Unexpected":"field"]])
                let actualPerson = PeopleTransformer.transformPeopleFrom(JSON: jsonResponse).first

                expect(expectedPerson) == actualPerson
            }    
        }
    }
}