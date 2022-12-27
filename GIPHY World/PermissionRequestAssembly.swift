//
//  PermissionRequestAssembly.swift
//  GIPHY World
//
//  Created by Mikhail Borisov on 19/12/22.
//

import UIKit

struct PermissionRequestAssembly: SceneAssembly {
    private let delegate: UserContactsSceneDelegate

    init(delegate: UserContactsSceneDelegate) {
        self.delegate = delegate
    }
    
    func makeScene() -> UIViewController {
        let viewModel = PermissionRequestViewModel()
        viewModel.delegate = delegate
        let viewController = PermissionRequestViewController(viewModel: viewModel)
        viewController.delegate = viewModel
        return viewController
    }
}
