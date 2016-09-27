import Vapor
import Foundation

let drop = Droplet()
let service = PeopleService()

drop.get { req in
    let lang = req.headers["Accept-Language"]?.string ?? "en"
    return try drop.view.make("welcome", [
    	"message": Node.string(drop.localization[lang, "welcome", "title"])
    ])
}

drop.get("list") { req in
    return service.getAllPeople()
}

drop.get("listAll") { req in
    return service.getAllPeopleWithDetails()
}

drop.get("personByID") { req in
    guard let id = req.data["id"]?.int else {
        throw Abort.badRequest
    }
    return service.getPersonBy(id: id)
}

drop.run()
