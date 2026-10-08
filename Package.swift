// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "CTNotificationContent",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "CTNotificationContent",
            targets: ["CTNotificationContentWrapper"])
    ],
    // No SDWebImage package: the prebuilt CTNotificationContent binary already contains
    // SDWebImage, so linking the package too put two copies of every SD* class in the
    // extension process.
    dependencies: [],
    targets: [
        // The pre-built xcframework binary — cannot have dependencies itself.
        .binaryTarget(
            name: "CTNotificationContentBinary",
            path: "Framework/CTNotificationContent.xcframework"
        ),
        // Thin wrapper source target that re-exports the binary.
        .target(
            name: "CTNotificationContentWrapper",
            dependencies: [
                "CTNotificationContentBinary",
            ],
            path: "Sources/CTNotificationContentWrapper"
        ),
    ]
)