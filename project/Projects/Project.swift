//
//  Project.swift
//  MomentreeManifests
//
//  Created by Importants on 11/23/24.
//

import ProjectDescription
import MomentreePlugin


let project = Project.app(
  name: Project.appName,
  destinations: .iOS,
  dependencies: [
    .TCA,
    .TCACoordinators
  ],
  testDependencies: []
)

