// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "API",
    products: [
        .library(
            name: "API",
            targets: ["API"]),
    ],
    dependencies: [
        .package(path: "../Packages/Network"),
        .package(path: "../Packages/Model")
    ],
    targets: [
        .target(
            name: "API",
            dependencies: [
                .product(name: "Network", package: "Network"),
                .product(name: "Model", package: "Model")
            ]
        ),
        .testTarget(
            name: "APITests",
            dependencies: ["API"]),
    ]
)
