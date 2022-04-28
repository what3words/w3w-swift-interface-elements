// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "w3w-swift-interface-elements",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
      .library(name: "W3WSwiftInterfaceElements", targets: ["W3WSwiftInterfaceElements"]),
      .library(name: "W3WSwiftUIInterfaceElements", targets: ["W3WSwiftUIInterfaceElements"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
      .package(url: "https://github.com/what3words/w3w-swift-wrapper.git", "3.7.2"..<"4.0.0"),
      .package(url: "https://github.com/what3words/w3w-swift-design.git", .branch("main")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite. Targets can depend on other targets in this package, and on products in packages this package depends on.
      .target(
        name: "W3WSwiftInterfaceElements",
        dependencies: [
          .product(name: "W3WSwiftApi", package: "w3w-swift-wrapper"),
          .product(name: "W3WSwiftDesign", package: "w3w-swift-design"),
        ]),
      .target(
        name: "W3WSwiftUIInterfaceElements",
        dependencies: [
          .product(name: "W3WSwiftApi", package: "w3w-swift-wrapper"),
          .product(name: "W3WSwiftDesign", package: "w3w-swift-design"),
        ]),
      .testTarget(
        name: "w3w-swift-interface-elementsTests",
        dependencies: ["W3WSwiftInterfaceElements"]),
    ]
)
