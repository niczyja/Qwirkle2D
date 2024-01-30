// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDL2",
    products: [
        .library(
            name: "SDL2",
            targets: ["SDL2"]),
    ],
    targets: [
        .target(
            name: "SDL2"),
    ]
)
