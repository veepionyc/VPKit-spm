// swift-tools-version: 5.8
// Binary distribution of VPKit.xcframework (https://github.com/veepionyc/VPKit2.0).
//
// 2.11.2 — restores the 2.10.1–2.10.4-beta20 changes missing from 2.11.0/2.11.1.
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
            url: "https://github.com/veepionyc/VPKit-spm/releases/download/2.11.2/VPKit-static.xcframework.zip",
            checksum: "9cdfa4f8925a90b19a906396906a5f13371ca03551b9f8ef7dc9a81336c65892"
        ),
        .binaryTarget(
            name: "VPKit-dynamic-binary",
            url: "https://github.com/veepionyc/VPKit-spm/releases/download/2.11.2/VPKit-dynamic.xcframework.zip",
            checksum: "0feb6b3d11d8fa4ab89591f2cb9482ee90bc7d7a416651ab914bac3dcaacbdfd"
        )
    ]
)
