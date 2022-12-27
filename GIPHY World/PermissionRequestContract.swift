//
//  PermissionRequestContract.swift
//  GIPHY World
//
//  Created by Mikhail Borisov on 19/12/22.
//

import Foundation

protocol UserContactsContainerDelegate: AnyObject {
    
}

protocol UserContactsSceneDelegate: AnyObject {
    func openSettingsAlert(message: String)
    func openMainFlow()
}
