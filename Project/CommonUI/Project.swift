import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin


// MARK: - Project

let projectName = "TuistExampleApp"
let bundleID = "com.hamin.tuistMain"
let iOSTargetVersion = "13.0"
let commonUITarget = "CommonUITarget"


//let project = Project(
//  name: projectName,
//  organizationName: "tuistOrganization",
//  packages: [.package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.5.0")],
//  settings: nil,
//  targets: [
//      Target(name: commonUITarget,
//             platform: .iOS,
//             product: .dynamicLibrary, // Static Framework, Dynamic Framework
//             bundleId: bundleID,
//             deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: [.iphone]),
//             infoPlist: .default,
//             sources: ["Sources/**/*.swift"]
//            )
//    ],
//  fileHeaderTemplate: nil
//)

let framework = Project.framework(name: "CommonUI", platform: .iOS, bundleID: bundleID)
