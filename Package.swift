// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CreateExec",
    products: [
        .executable(name: "cec", targets: ["CreateExec"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/JoserccCLI/Swiftline", from: "0.6.0"),
        .package(url: "https://github.com/kylef/Commander", from: "0.9.1"),
        .package(url: "https://github.com/kareman/SwiftShell", from: "5.0.1"),
        .package(url: "https://github.com/groue/GRMustache.swift", from: "4.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "CreateExec",
            dependencies: ["Swiftline", "Commander", "SwiftShell","Mustache"]),
        .testTarget(
            name: "CreateExecTests",
            dependencies: ["CreateExec"]),
    ]
)
