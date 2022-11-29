import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin


// MARK: - Project

let projectName = "TuistExampleApp"
let bundleID = "com.hamin.tuistMain"
let iOSTargetVersion = "13.0"

let mainTarget = "MainTarget"

let project = Project(
  name: projectName,
  organizationName: "tuistOrganization",
  packages: [.package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.5.0")],
  settings: nil,
  targets: [
      Target(name: mainTarget,
             platform: .iOS,
             product: .app, // Static Framework, Dynamic Framework
             bundleId: bundleID,
             deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: [.iphone]),
             infoPlist: .default,
             sources: ["Sources/**/*.swift"],
             dependencies: [.framework(path: .relativeToCurrentFile("../../CommonUI"))]
            )
    ],
  schemes: [
    Scheme(name: "\(projectName)-Debug"),
    Scheme(name: "\(projectName)-Release")
  ],
  fileHeaderTemplate: nil
)
