// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WorldBeers",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "WorldBeers",
            targets: ["WorldBeers"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kaishin/glide", from: "0.4.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "WorldBeers",
            dependencies: [.product(name: "Glide", package: "glide")]),
        .testTarget(
            name: "WorldBeersTests",
            dependencies: ["WorldBeers"]),
    ]
)
