import PackageDescription

let package = Package(
    name: "SwiftDIAPI",
    dependencies: [
        .Package(url: "https://github.com/alexbasson/SwiftDIHLP.git", majorVersion: 0),
        .Package(url: "https://github.com/alexbasson/SwiftDIWebRepositories.git", majorVersion: 0),
        .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1),
        .Package(url: "https://github.com/IBM-Swift/HeliumLogger.git", majorVersion: 1)
    ]
)
