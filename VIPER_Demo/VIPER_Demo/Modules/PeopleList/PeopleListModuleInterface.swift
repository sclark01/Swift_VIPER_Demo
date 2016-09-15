import Foundation

protocol PeopleListModuleInterface {
    func updateView()
    func detailsForPerson(withId Id: Int)
}