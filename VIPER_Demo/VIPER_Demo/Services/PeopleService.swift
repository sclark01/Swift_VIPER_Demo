import Foundation
import Alamofire
import SwiftyJSON

protocol PeopleServiceType {
    func getPeople(_ onCompletion: @escaping ([Person]) -> Void)
    func getPersonByID(withID id: Int, onCompletion: @escaping (Person) -> Void)
}

class PeopleService : PeopleServiceType {
    func getPeople(_ onCompletion: @escaping ([Person]) -> Void) {
        Alamofire
            .request("http://localhost:8000/listAll")
            .validate(statusCode: 200..<400)
            .responseJSON { response in
                if let value = response.result.value {
                    let json = JSON(value)
                    let people = PeopleTransformer.transformPeopleFrom(JSON: json)
                    onCompletion(people)
                }
        }
    }

    func getPersonByID(withID id: Int, onCompletion: @escaping (Person) -> Void) {
        Alamofire
            .request("http://localhost:8000/personByID?", parameters: ["id":id])
            .validate(statusCode: 200..<400)
            .responseJSON { response in
                if let value = response.result.value {
                    let json = JSON(value)
                    let people = PeopleTransformer.transformPeopleFrom(JSON: json)
                    onCompletion(people.first ?? Person(id: -1, name: "", phone: "", age: ""))
                }
        }
    }
}
