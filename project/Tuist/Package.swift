// swift-tools-version: 6.0
@preconcurrency import PackageDescription

#if TUIST
@preconcurrency import ProjectDescription

let packageSettings = PackageSettings(
  productTypes: [
    "ComposableArchitecture": .framework,
    "TCACoordinators": .framework
  ]
)
#endif

let package = Package(
  name: "Momentree",
  dependencies: [
    .package(
        url: "https://github.com/pointfreeco/swift-composable-architecture.git",
        branch: "1.16.1"
    ),
    .package(
        url: "https://github.com/johnpatrickmorgan/TCACoordinators.git",
        branch: "0.10.1"
    )
  ]
)
