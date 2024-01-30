// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDL",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(name: "SDL", targets: ["SDL"]),
    ],
    targets: [
        .binaryTarget(name: "SDL2", path: "SDL2.xcframework"),
        .target(name: "Bridge", dependencies: ["SDL2"]),
        .target(name: "SDL", dependencies: ["Bridge"]),
    ]
)
