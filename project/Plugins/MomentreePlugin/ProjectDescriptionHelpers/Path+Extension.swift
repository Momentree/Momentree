//
//  Path+Extension.swift
//  MomentreePlugin
//
//  Created by Importants on 11/23/24.
//

import ProjectDescription

extension Path {
  public static func plistPath(_ plistName: String) -> Path {
    return .relativeToRoot("InfoPlists/\(plistName).plist")
  }
  
  public static func xcconfigPath(_ xcconfigName: String) -> Path {
    return .relativeToRoot("XCConfigs/\(xcconfigName).xcconfig")
  }
}
