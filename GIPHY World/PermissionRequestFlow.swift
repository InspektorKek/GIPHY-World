//
//  PermissionRequestFlow.swift
//  GIPHY World
//
//  Created by Mikhail Borisov on 27/12/22.
//

import Foundation

enum ChannelDetailFlow {
    enum ViewState {
        case idle
    }
    
    enum Event {
        case onAppear
        case onAskTapped
    }
}
