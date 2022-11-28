import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin


// MARK: - Project

let projectName = "TuistExampleApp"
let bundleID = "com.hamin.tuistMain"
let iOSTargetVersion = "13.0"

let mainTarget = "MainTarget"
let commonUITarget = "CommonUITarget"


let project = Project(
  name: projectName,
  organizationName: "tuistOrganization",
  options: .options(
    textSettings: Project.Options.TextSettings.textSettings(
      usesTabs: true,
      indentWidth: 2,
      tabWidth: 2,
      wrapsLines: true
    )
  ),
  packages: [.package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.5.0")],
  settings: nil,
//      .settings(configurations: [
//    .debug(name: "Debug", xcconfig: "Confiugrations/\(projectName)-Debeg.xcconfg"),
//    .debug(name: "Release", xcconfig: "Confiugrations/\(projectName)-Release.xcconfg"),
//  ]),
  targets: [
      Target(name: mainTarget,
             platform: .iOS,
             product: .staticLibrary, // Static Framework, Dynamic Framework
             bundleId: bundleID,
             deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: [.iphone]),
             infoPlist: .default,
             sources: ["Targets/\(mainTarget)/Sources/**"]
            ),
      Target(name: commonUITarget,
             platform: .iOS,
             product: .staticLibrary,
             bundleId: "common.ui.tuist")
    ],
  schemes: [
    Scheme(name: "\(projectName)-Debug"),
    Scheme(name: "\(projectName)-Release")
  ],
  fileHeaderTemplate: nil
  
)
