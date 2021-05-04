# Mastermind

_Last revision: 3. 5. 2021_
> Update revision date every time you edit README.md file. This way a reader will know that README is really old or is actually up to date.
## About the App

Let's play [Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game)) and learn at the same time. This is a simple application to showcase following things:

* Screaming architecture
* Clean architecture
* MVVM-C
* Functional/reactive programming
* Combine

## How to start developing

* Nothing special needs to be downloaded or installed before running the application.
* All you need to install is Xcode 12 or newer.

## App structure

The structure of the project is very simple:
* **Application** folder contains classes that start the whole application.
* **Scenes** is where you can find all screens and features of the app.
* **Extensions** is where you can find extensions used in the whole app.
* **Resources** is where you can find needed resources.

### Architecture

Clean architecture was used for this app. The architecture was inspired by a [Medium article](https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3). Feel free to read and explore the article!

Clean architecture divides the application into three different layers.
#### Presentation layer
Presentation layer depends only on the Domain layer. This is where you can find **MVVM-C**:
- `UIViewController` manages UI.
- `ViewModel` executes use cases from the Domain layer and prepares the data for `UIViewController`.
- `Coordinator` manages navigation between different scenes.

#### Domain layer

The domain layer is where you can find the business logic of the application. It contains `Entities`, `Use Cases`, and `Repository Interfaces`. This layer could be potentially reused within different projects. Domain layer **must not** include anything from other layers (e.g presentation layer — `UIKit` or data layer — mapping `Codable`). There **must not** be any 3rd party dependencies as well. All of this allows domain layer to be very easily testable.

#### Data layer

The data layer provides and manages data for use cases found in the domain layer. This is where you:
* **fetch** data from a remote REST API,
* **update** data to a remote REST API,
* **load** data from a local storage (`database`, `UserDefaults`, `Keychain`),
* **save** data to a local storage (`database`, `UserDefaults`, `Keychain`).

The data layer depends only on the domain layer. The data layer also encapsluates 3rd party libraries, therefore the domain layer does not depend on any 3rd party library. The data layer is also responsible for mapping data transfer objects into domain objects.

## API

### Login

#### Endpoint:
`http://emarest.cz.mass-php-1.mit.etn.cz/api/v2/login`
#### HTTP method:
`POST`
#### Body: 
``` json
{

  "user_id": "your_userID",

  "password": "your_password",

  "time-to-live": 3600 // optional, value in seconds - expiration of the token, range <30,3600>

}
```
TBA: testing account
#### Response:
``` json
{
    "access_token": "your_access_token"
}
```

### Start new game

#### Endpoint:
`http://emarest.cz.mass-php-1.mit.etn.cz/api/v2/logik/start`
#### HTTP method:
`POST`
#### Header parameters:
`access_token`
#### Body: 
``` json
{
    "slots": 6
}
```
#### Response:
``` json
{
    "gameId": "4492936ae8ce8a711e01c30d30f884ed"
}
```

### Send guess

#### Endpoint:
`http://emarest.cz.mass-php-1.mit.etn.cz/api/v2/logik/guess`
#### HTTP method:
`POST`
#### Header parameters:
`access_token`
#### Body: 
``` json
{
    "gameId": "4492936ae8ce8a711e01c30d30f884ed",
    "guess": [1, 5, 2, 5, 6, 1]
}
```
#### Response:
``` json
{
    "evaluation": {
        "black": 6,
        "white": 0
    },
    "guessCount": 27
}
```

### Ranking

#### Endpoint:
`http://emarest.cz.mass-php-1.mit.etn.cz/api/v2/logik/ranking`
#### HTTP method:
`GET`
#### Header parameters:
`access_token`
#### Response:
``` json
[
    {
        "participantId": "jiri.zoudun",
        "name": "Jiří Zoudun",
        "timestamp": "2021-04-26 17:26:22",
        "score": "10",
        "slots": "4",
        "id": "67ab865af716d534adb7f89a55ec87f9",
        "icon512": "http://emarest.cz.mass-php-1.mit.etn.cz/icon/512/jiri.zoudun.jpg",
        "icon192": "http://emarest.cz.mass-php-1.mit.etn.cz/icon/192/jiri.zoudun.jpg",
        "icon72": "http://emarest.cz.mass-php-1.mit.etn.cz/icon/72/jiri.zoudun.jpg"
    },
    {
        "participantId": "jiri.zoudun",
        "name": "Jiří Zoudun",
        "timestamp": "2021-04-26 17:28:07",
        "score": "12",
        "slots": "4",
        "id": "914d8c0ee1112ded231b6f82d7d2568c",
        "icon512": "http://emarest.cz.mass-php-1.mit.etn.cz/icon/512/jiri.zoudun.jpg",
        "icon192": "http://emarest.cz.mass-php-1.mit.etn.cz/icon/192/jiri.zoudun.jpg",
        "icon72": "http://emarest.cz.mass-php-1.mit.etn.cz/icon/72/jiri.zoudun.jpg"
    }
]
```

## Dependencies

The preferred dependency manager for this project is [Swift Package Manager](https://swift.org/package-manager/).

### Swift Package Manager

- [SnapKit](https://github.com/SnapKit/SnapKit) is used for auto layout.
- [Resolver](https://github.com/hmlongco/Resolver) is a dependency injection library.