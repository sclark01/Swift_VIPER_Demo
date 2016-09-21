# A Demo of VIPER in iOS
---

## What is VIPER?
Viper is a design pattern developed at [Mutual Mobile](https://github.com/mutualmobile/). It's a backronym for View, Interactor, Presenter, Entity, and Router (often refered to as wireframe). The goal is to break the application into multiple 'modules', each of which is responsible for a single *use case*. It's up to your team to define a *use case* based on your domain, team size, and requirements. Modules should be kept small enough that they encapsulate a single idea, however, not too small that your project becomes too complex to maintain. 
## How does it work?
### VIPER Flow Diagram:
![VIPER Diagram](https://raw.githubusercontent.com/sclark01/Swift_VIPER_Demo/master/viper_wireframe.png "VIPER Diagram")
### Breaking Down the Diagram
##### Launching the App:
* __App Delegate__
    * As With any iOS application, this is where the app control flow begins. The app delegate is responsible for instantiating the AppDependencies and triggering it to configure the application.
* __AppDependencies__
    * This class is responsible for instatiating the routers/wireframes for the application, injecting them with their own proper dependencies (helps with testing), and finally calling the present method on the wire frame for the root module that will be displayed when the app launches.
* __Main Wireframe__ 
    * The main wireframe's responsibility is to load the root view controller. In the demo application, I use the main wireframe to extract the navigation controller from the main UIWindow, and push the first view (in this case the PeopleListViewController) onto the navigation controller. Now that we've pushed the view controller onto the navigation stack, future wireframes will not need a reference to the UIWindow and can instead be pushed and popped from the navigation controller.
##### Within a Module:
* __Router (wireframe)__
    * The wireframe for a module is responsible for maintaining and configuring dependencies between the view, presenter, and interactor. It is also responsible for pushing the correct view when it's being first presented, and calling the present method on subsequent modules that need to be displayed.
* __Presenter__ 
    * The presenter sits between the View and the Interactor, while also maintaining a reference to the Router. The view will notify the presenter when it needs to reload its data and/or the user has interacted it. Depending on the method, the presenter will either delegate the rest of the task to the interactor or to the wireframe. When the interactor has new data to display it will notify the presenter who will in turn give it to the view in the correct format. In the demo app, I use a __PeopleListDataModel__ as the object displayed by the view. This allows for the presentation logic to be seperate from any entity. 
* __View__ 
    *  This is the part of the module that uses UIKit. A protocol is used to define the 'View', and is implemented by a standard UIViewController. Getting new data and handling user interactions should all be passed onto the presenter, which acts as an event handler. Even simple functionality like formatting Strings should be delegated to a dataModel, minimizing the logic inside the ViewController and keeping it as lean as possible. 
* __Interactor__ 
    * 
##### Shared Resources:

## Pros
The main pros of Viper are its modularity, meaning improved code reusue and easier testability. It would be most successful on projects with lots of distinct components and a large team of engineers. Modularizing segments of the app means multiple teams can work concurrently, while minimizing the risk of code duplication and merge conflicts. 

## Cons
* large projects
* many small protocols and implementations that don't do a lot
* Complex dependencies 
    * Could maybe be improved using a Reactive framework    

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

## Further Readings
- https://www.objc.io/issues/13-architecture/viper/
- https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52#.ik0ffbbfh
