// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS((.v16))],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Core",
            targets: ["Core"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift.git", branch: "master")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Core",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-swift"),
            ]),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"]),
    ]
)
