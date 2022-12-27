//
//  PermissionRequestViewController.swift
//  GIPHY World
//
//  Created by Mikhail Borisov on 19/12/22.
//

import UIKit

final class PermissionRequestViewController: UIHostingViewControllerCustom<PermissionRequestView> {
    weak var delegate: PermissionRequestContainerDelegate?
    
    let viewModel: PermissionRequestViewModel
        
    init(viewModel: PermissionRequestViewModel) {
        self.viewModel = viewModel
        super.init(rootView: PermissionRequestView(viewModel: viewModel))
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
