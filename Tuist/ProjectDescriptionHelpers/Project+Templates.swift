import ProjectDescription

extension Project {
  public static func app(
    name: String,
    platform: Platform,
    bundleID: String,
    dependencies: [TargetDependency] = []
  ) -> Project {
    return self.project(
      name: name,
      product: .app,
      bundleID: bundleID,
      platform: platform,
      dependencies: dependencies,
      infoPlist: [
        "CFBundleShortVersionString": "1.0",
        "CFBundleVersion": "1"
      ]
    )
  }
  
  public static func framework(
    name: String,
    platform: Platform,
    bundleID: String,
    dependencies: [TargetDependency] = []
  ) -> Project {
    return self.project(
      name: name,
      product: .framework,
      bundleID: bundleID,
      platform: platform,
      dependencies: dependencies
    )
  }
  
  public static func project(
    name: String,
    product: Product,
    bundleID: String,
    platform: Platform,
    dependencies: [TargetDependency] = [],
    infoPlist: [String: InfoPlist.Value] = [:]
  ) -> Project {
    return Project(
      name: name,
      targets: [
        Target(
          name: name,
          platform: platform,
          product: product,
          bundleId: bundleID,
          infoPlist: .extendingDefault(with: infoPlist),
          sources: ["Sources/**"],
          resources: [],
          dependencies: dependencies
        ),
        Target(
          name: "\(name)Tests",
          platform: platform,
          product: .unitTests,
          bundleId: bundleID,
          infoPlist: .default,
          sources: "Tests/**",
          dependencies: [
            .target(name: "\(name)")
          ]
        )
      ]
    )
  }
}
