// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Wrift",
    products: [
        .executable(name: "wrift", targets: ["Wrift"]),
        .library(name: "WriftKit", targets: ["WriftKit"])
    
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/kylef/PathKit.git", from: "1.0.0"),
        .package(url: "https://github.com/onevcat/Rainbow.git", from: "3.1.0"),
        .package(url: "https://github.com/jakeheis/SwiftCLI.git", from: "5.3.0"),
        .package(url: "https://github.com/mxcl/Version.git", from: "1.1.0"),
        .package(url: "https://github.com/JohnSundell/Files", from: "4.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Wrift",
            dependencies: ["WriftCLI"]),
        .target(name: "WriftCLI", dependencies: ["Rainbow", "SwiftCLI", "WriftKit"]),
        .target(name: "WriftKit", dependencies: ["Rainbow", "PathKit", "Version", "SwiftCLI","Files"]),
        .testTarget(
            name: "WriftTests",
            dependencies: ["Wrift"]),
    ]
)
