import Foundation
import Alamofire
import SwiftyJSON

protocol PeopleServiceType {
    func getPeople(onCompletion: ([Person]) -> Void)
}

class PeopleService : PeopleServiceType {
    func getPeople(onCompletion: ([Person]) -> Void) {
        Alamofire
            .request(.GET, "http://localhost:8000/listAll")
            .validate(statusCode: 200..<400)
            .responseJSON { response in
                if let value = response.result.value {
                    let json = JSON(value)
                    let people = PeopleTransformer.transformPeopleFrom(JSON: json)
                    onCompletion(people)
                }
        }
    }
}