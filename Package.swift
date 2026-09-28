// swift-tools-version: 5.8
// Binary distribution of VPKit.xcframework (https://github.com/veepionyc/VPKit2.0).
//
// 2.11.1 — advertising identifier as an explicit, ATT-gated opt-in (sendIDFA:).
// 2.11.0 — analytics now go to the Veepio collector on Google Cloud; the AWS
// Kinesis dependency is gone. Pick one product:
//   VPKit-dynamic  dynamic xcframework
//   VPKit-static   static xcframework

import PackageDescription

let package = Package(
    name: "VPKit xcfamework",
    products: [
        .library(
            name: "VPKit-static",
            targets: ["VPKit-static-target"]),
        .library(
            name: "VPKit-dynamic",
            targets: ["VPKit-dynamic-target"]),
    ],
    dependencies: [
        .package(
            url: "https://gitlab.com/foundry/dotveep-spm",
            from: "2.0.0")
    ],
    targets: [
        .target (
            name: "VPKit-static-target",
            dependencies: [
                .target(name: "VPKit-static-binary"),
                .product(name: "dotveep-static",
                         package: "dotveep-spm")
            ],
            path: "wrapper/VPKit-static-target"
        ),
        .target (
            name: "VPKit-dynamic-target",
            dependencies: [
                .target(name: "VPKit-dynamic-binary"),
                .product(name: "dotveep-dynamic",
                         package: "dotveep-spm")
            ],
            path: "wrapper/VPKit-dynamic-target"
        ),
        .binaryTarget(
            name: "VPKit-static-binary",
            url: "https://github.com/veepionyc/VPKit-spm/releases/download/2.11.1/VPKit-static.xcframework.zip",
            checksum: "89e8bb1df6e5aa8353e4ce84a33a97a3419f46a08a10926f4616aef3f169494e"
        ),
        .binaryTarget(
            name: "VPKit-dynamic-binary",
            url: "https://github.com/veepionyc/VPKit-spm/releases/download/2.11.1/VPKit-dynamic.xcframework.zip",
            checksum: "69c9fe516bddd9a0567b0a435de800064cf0b7f9ffae3e2fbfda9aa425a88c0a"
        )
    ]
)
