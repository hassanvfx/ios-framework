// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FrameworkLib",
    platforms: [
        .iOS(.v15), // iOS 15 and later
        .macOS(.v12), // macOS 12 and later (corresponding to iOS 15)
        .watchOS(.v8) // watchOS 8 and later (corresponding to iOS 15)
    ],
    products: [
        .library(
            name: "FrameworkLib",
            targets: ["FrameworkLib"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // Example: .package(url: "https://example.com/ExamplePackage.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "FrameworkLib",
            dependencies: [
                // .product(name: "SomeProduct", package: "SomeOtherPackage")
            ],
            // swiftSettings: [
            //     .define("SOME_CONDITIONAL_FLAG")
            // ],
            // linkerSettings: [
            //     .linkedFramework("SomeFramework")
            // ]
        ),
        .testTarget(
            name: "FrameworkLibTests",
            dependencies: ["FrameworkLib"]
        ),
    ],
    swiftLanguageVersions: [.v5],
    // cLanguageStandard: .gnu11,
    // cxxLanguageStandard: .gnucxx11
)
