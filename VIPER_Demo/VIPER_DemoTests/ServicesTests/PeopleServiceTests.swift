import Foundation
import Quick
import Nimble
import OHHTTPStubs

@testable import VIPER_Demo

class PeopleServiceTests : QuickSpec {
    override func spec() {

        let id = 1
        let expectedPerson = Person(id: id, name: "Some Name", phone: "Some Phone", age: "someAge")

        beforeEach {
            stub(isHost("localhost") && isPath("/listAll") && isMethodGET()) { request in
                let obj = [[
                    "id" : expectedPerson.id,
                    "name" : expectedPerson.name,
                    "phone" : expectedPerson.phone,
                    "age" : expectedPerson.age
                    ],
                    [
                        "id" : 1,
                        "name" : "Another Name",
                        "phone" : "Another Phone",
                        "age" : "Another Age"
                    ]]
                return OHHTTPStubsResponse(JSONObject: obj, statusCode: 200, headers: nil)
            }

            stub(isHost("localhost") && isPath("/personByID") && isMethodGET()) { request in
                let obj = [[
                    "id" : expectedPerson.id,
                    "name" : expectedPerson.name,
                    "phone" : expectedPerson.phone,
                    "age" : expectedPerson.age
                    ]]
                return OHHTTPStubsResponse(JSONObject: obj, statusCode: 200, headers: nil)
            }
        }

        afterEach {
            OHHTTPStubs.removeAllStubs()
        }

        describe("get people") {
            it("should get all people from list all endpoint") {
                let peopleService = PeopleService()
                var completionCalled = false
                var actualPeople: [Person] = []

                peopleService.getPeople { people in
                    completionCalled = true
                    actualPeople = people
                }

                expect(completionCalled).toEventually(beTrue())
                expect(actualPeople.count).toEventually(equal(2))
                expect(actualPeople.first!.id).toEventually(equal(expectedPerson.id))
                expect(actualPeople.first!.name).toEventually(equal(expectedPerson.name))
                expect(actualPeople.first!.phone).toEventually(equal(expectedPerson.phone))
                expect(actualPeople.first!.age).toEventually(equal(expectedPerson.age))
            }
        }

        describe("get a person") {
            it("should get a single person by ID") {
                let peopleService = PeopleService()
                var completionCalled = false
                var actualPerson: Person? = nil

                peopleService.getPersonByID(withID: id) { person in
                    completionCalled = true
                    actualPerson = person
                }

                expect(completionCalled).toEventually(beTrue())
                expect(actualPerson).toEventuallyNot(beNil())
                expect(actualPerson!.id).toEventually(equal(expectedPerson.id))
                expect(actualPerson!.name).toEventually(equal(expectedPerson.name))
                expect(actualPerson!.phone).toEventually(equal(expectedPerson.phone))
                expect(actualPerson!.age).toEventually(equal(expectedPerson.age))
            }
        }
    }
}