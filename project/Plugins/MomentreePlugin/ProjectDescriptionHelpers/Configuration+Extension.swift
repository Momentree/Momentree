//
//  Configuration+Extension.swift
//  MomentreePlugin
//
//  Created by Importants on 11/23/24.
//

import ProjectDescription

public extension Configuration {
  
  enum ConfigScheme: ConfigurationName, CaseIterable {
    case debug = "Debug"
    case release = "Release"
  }
  
  static func configure(configurations: [ConfigScheme]) -> [Configuration] {
    return configurations.map { configScheme -> Configuration in
      let configName = configScheme.rawValue
      let settings: SettingsDictionary = ["URL_SCHEMES": .string(configScheme == .release ? "momentree" : "momentree-dev")]
      
      switch configScheme {
        case .release:
          return .release(
            name: configName,
            settings: settings,
            xcconfig: .xcconfigPath(configName.rawValue)
          )
        case .debug:
          return .debug(
            name: configName,
            settings: settings,
            xcconfig: .xcconfigPath(configName.rawValue)
          )
      }
    }
  }
}
