import ProjectDescription

let project = Project(
    name: "Momentree",
    targets: [
        .target(
            name: "Momentree",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Momentree",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Momentree/Sources/**"],
            resources: ["Momentree/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "MomentreeTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.MomentreeTests",
            infoPlist: .default,
            sources: ["Momentree/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Momentree")]
        ),
    ]
)
