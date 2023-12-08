// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Data",
            targets: ["Data"]),
    ],
    targets: [
        .target(
            name: "Data"),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data"]),
    ]
)
