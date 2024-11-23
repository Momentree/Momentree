//
//  Dependency+Extension.swift
//  MomentreePlugin
//
//  Created by Importants on 11/23/24.
//

import ProjectDescription

public extension TargetDependency {
    nonisolated(unsafe) static var TCA: TargetDependency = .external(name: "ComposableArchitecture")
    
    nonisolated(unsafe) static var TCACoordinators: TargetDependency = .external(name: "TCACoordinators")
}
