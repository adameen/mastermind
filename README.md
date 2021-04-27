# Mastermind

Let's play Mastermind and learn at the same time. This is a simple application to showcase following things:

* **Screaming architecture** The features of the app are instantly visible when opening the project in Xcode.
* **Clean architecture** It is important to separate three different layers in the appliaction:
    * Presentation layer. This layer contains UI of the application. This is where you can find MVVM-C.
    * Domain layer. Contains the business logic of the application in the form of use cases. It is UI independent and should be very easily testable. 
    * Data layer. Takes care of getting data for the domain layer in the form of repositories. Repositories can access data from a REST API or other data storages such as DBs, UserDefaults, Keychain and so on. This layer does not contain any business logic. It is just providing needed data.
* **Functional/reactive programming**
* **Combine**

## API
The API documentation can be found [here](https://www.etnetera.cz/hrava-hlava/zadani).