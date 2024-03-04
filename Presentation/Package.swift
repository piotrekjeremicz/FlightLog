// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Presentation",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Presentation",
            targets: ["Presentation"]),
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../../packages/swifty-webview"),
    ],
    targets: [
        .target(
            name: "Presentation",
            dependencies: [
                "Domain",
                .product(name: "WebView", package: "swifty-webview")
            ]),
        .testTarget(
            name: "PresentationTests",
            dependencies: ["Presentation"]),
    ]
)
