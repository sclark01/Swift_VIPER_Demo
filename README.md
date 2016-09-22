# A Demo of VIPER in iOS
---

## What is VIPER?
Viper is a design pattern developed at [Mutual Mobile](https://github.com/mutualmobile/). It's a backronym for View, Interactor, Presenter, Entity, and Router (often referred to as wireframe). It was designed as an application of [Clean Architecture](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html). The goal is to break the application into multiple 'modules', each of which is responsible for a single *use case*. It's up to your team to define a *use case* based on your domain, team size, and requirements. Modules should be kept small enough that they encapsulate a single idea, however, not too small that your project becomes too complex to maintain. 
## How does it work?
### VIPER Flow Diagram:
![VIPER Diagram](https://raw.githubusercontent.com/sclark01/Swift_VIPER_Demo/master/viper_wireframe.png "VIPER Diagram")
### Breaking Down the Diagram
##### Launching the App:
* __App Delegate__
    * As with any iOS application, this is where the app control flow begins. The app delegate is responsible for instantiating the AppDependencies and triggering it to configure the application.
* __AppDependencies__
    * This class is responsible for instantiating the routers/wireframes for the application, injecting them with their proper dependencies (helps with testing), and finally calling the `present` method on the wire frame for the root module that will be displayed when the app launches.
* __Main Wireframe__ 
    * The main wireframe's responsibility is to load the root view controller. In the demo application, I use the main wireframe to extract the navigation controller from the main UIWindow, and push the first view (in this case the PeopleListViewController) onto the navigation controller. Now that we've pushed the view controller onto the navigation stack, future wireframes will not need a reference to the UIWindow and can instead be pushed and popped from the navigation controller.
##### Within a Module:
* __Router (wireframe)__
    * The wireframe for a module is responsible for maintaining and configuring dependencies between the view, presenter, and interactor. It is also responsible for pushing the correct view when it's being first presented, and calling the present method on subsequent modules that need to be displayed.
* __Presenter__ 
    * The presenter contains the logic for responding to user input and formatting the data received from the interactor for the view. It maintains a reference to the view, interactor, and router. The view will notify the presenter when it needs to reload its data and/or the user has interacted with it. Depending on the action, the presenter will either delegate the rest of the task to the interactor or to the wireframe. When the interactor has new data to display it will notify the presenter who will in turn give it to the view in the correct format. In the demo app, I use a __PeopleListDataModel__ as the object displayed by the view. This allows for the presentation logic to be separate from any entity. 
* __View__ 
    *  This is the part of the module that uses `UIKit`. A protocol is used to define the view, and is implemented by a standard `UIViewController`. Getting new data and handling user interactions should all be passed onto the presenter, which acts as an event handler. Even simple functionality like formatting strings should be delegated to a data model, minimizing the logic inside the view controller and keeping it as lean as possible. 
* __Interactor__ 
    * The interactor is responsible for the business logic of the app, and particularly fetching data from the correct service layer endpoints. Within the interactor, all the data, possibly from multiple services, would be aggregated, transformed, and sent to the presenter. Services will normally return an entity, which should be transformed into an object the presenter will use. This object can be built from one or more entities and should be presenter specific. These objects in the demo app are the `PersonForListData` and the `PersonDetailsData`.

##### Shared Resources:
* __Services__
    * The service layer is a layer of shared resources. Each _service_ within the layer should follow the [single responsibility principle](https://en.wikipedia.org/wiki/Single_responsibility_principle), limiting itself to a single domain concept. Each service will resolve requests, most often by either hitting a local database or making network requests. Calls to the service should always be asynchronous. 
* __Entity__
    * Entities are basic domain objects that are used by the interactor. Entities can be shared between different modules or module specific. Entities should never be passed to the presenter, and instead a different data object, that is tailored to the presenter should be returned. In the demo app, I use a `PersonForListData` object for the list view, since I don't actually need the age for this view. Similarly, the `PersonDetailsData` object for a person's details, omits the `id` field in the `Person` object. 

## Pros
The main pros of Viper are its modularity, meaning improved code reuse and easier testability. It would be most successful on projects with lots of distinct components and a large team of engineers. Modularizing segments of the app means multiple teams can work concurrently, while minimizing the risk of code duplication and merge conflicts. 

## Cons
For most projects VIPER is probably overkill. It's definitely not an architectural style to start with on day one, but instead something your team may consider transitioning to as the number of components grow and your team expands. The demo app clearly demonstrates how quickly VIPER can cause a simple app to grow out of hand. The maintenance required to maintain the large codebase outweighs the benefits above. Furthermore, the intertwined and often circular dependencies add complexity both to the instantiation of classes as well as testing. I would be curious to explore if this could be improved using a Reactive framework, such as [Reactive Cocoa](https://github.com/ReactiveCocoa/ReactiveCocoa).

## Running the Demo App
#### 1. Install Xcode
* Download Xcode 7.3
#### 2. Install CocoaPods
##### Without latest ruby installed:
* Install rbenv if you do not have it already: `brew install rbenv`
* Install most recent, stable version of ruby using rbenv, i.e. `rbenv install 2.3.1` 

##### With Ruby already installed: 
* Install CocoaPods: `gem install cocoapods`

#### 3. Clone Repo 
* Clone repo: `git@github.com:sclark01/Swift_VIPER_Demo.git`
* `cd` into the directory
* Open the project: `open VIPER_Demo/VIPER_Demo.xcworkspace` 

#### 4. Start the server
* From the main directory, `cd server`
* Install dependencies, `npm install`
* Start server, `npm start`

## Sources & Further Readings
- https://www.objc.io/issues/13-architecture/viper/
- https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52#.ik0ffbbfh

