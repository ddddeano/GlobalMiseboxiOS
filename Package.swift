// swift-tools-version:5.9
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
    dependencies: [
        .package(url: "https://github.com/ddddeano/FirebaseiOSMisebox.git", from: "1.1.106"),
    ],
    targets: [
        .target(
            name: "MiseboxiOSGlobal",
            dependencies: [
                .product(name: "FirebaseiOSMisebox", package: "FirebaseiOSMisebox")
            ]),
        .testTarget(
            name: "MiseboxiOSGlobalTests",
            dependencies: ["MiseboxiOSGlobal"]),
    ]
)
