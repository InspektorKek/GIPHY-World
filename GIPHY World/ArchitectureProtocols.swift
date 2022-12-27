//
//  ArchitectureProtocols.swift
//  GIPHY World
//
//  Created by Mikhail Borisov on 19/12/22.
//

import UIKit

/// Basic protocol for all assemblies
protocol SceneAssembly {
    func makeScene() -> UIViewController
}
