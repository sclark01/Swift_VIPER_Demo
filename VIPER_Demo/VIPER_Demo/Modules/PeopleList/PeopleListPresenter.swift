import Foundation

protocol PeopleListPresenterType {
    var userInterface: PeopleListViewType? { get set }
}
struct PeopleListPresenter : PeopleListPresenterType {
    var userInterface: PeopleListViewType?
}