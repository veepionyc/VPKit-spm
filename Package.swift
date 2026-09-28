// swift-tools-version: 5.8
// Binary distribution of VPKit.xcframework (https://github.com/veepionyc/VPKit2.0).
//
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
            url: "https://github.com/veepionyc/VPKit-spm/releases/download/2.11.0/VPKit-static.xcframework.zip",
            checksum: "b269ca66cac59c1c5fd8817321939ce71f5781183e940b6da741bd8f812038bb"
        ),
        .binaryTarget(
            name: "VPKit-dynamic-binary",
            url: "https://github.com/veepionyc/VPKit-spm/releases/download/2.11.0/VPKit-dynamic.xcframework.zip",
            checksum: "40b137bd0fb81b921e31d66b2544898b0e7a3f72e8bba8524a545126f9aa1cd9"
        )
    ]
)
