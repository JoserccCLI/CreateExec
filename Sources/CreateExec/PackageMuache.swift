//
//  File.swift
//  
//
//  Created by 张行 on 2019/12/31.
//

import Foundation

let packageMuache = """
// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "{{name}}",
    products: [
        .executable(name: "{{name}}", targets: ["{{name}}"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.{{#dependencies}}\(dependenciesMustache){{/dependencies}}
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "{{name}}",
            dependencies: [{{#dependencies}}\(dependenciesLibMustache){{/dependencies}}]),
        .testTarget(
            name: "{{name}}Tests",
            dependencies: ["{{name}}"]),
    ]
)
"""

let dependenciesMustache = """
\n        .package(url: "{{url}}", from: "{{from}}"),
"""

let dependenciesLibMustache = """
 "{{libName}}",
"""


