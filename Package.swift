// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "MiseboxiOSGlobal",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "MiseboxiOSGlobal",
            targets: ["MiseboxiOSGlobal"]),
    ],
    targets: [
        .target(
            name: "MiseboxiOSGlobal"),
        .testTarget(
            name: "MiseboxiOSGlobalTests",
            dependencies: ["MiseboxiOSGlobal"]),
    ]
)
