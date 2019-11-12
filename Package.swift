// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OCI",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "OCI",
            targets: ["OCI"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
           .package(url: "../Cliboci", from: "0.0.8"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "OCI",
            dependencies: []),
        .testTarget(
            name: "OCITests",
            dependencies: ["OCI"]),
    ]
)
