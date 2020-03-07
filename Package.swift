// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MPHUD",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "MPHUD", targets: ["MPHUD"]),
    ],
    targets: [
        .target(name: "MPHUD", dependencies: []),
        .testTarget(name: "MPHUDTests", dependencies: ["MPHUD"]),
    ]
)
