//
//  Categories.swift
//  AuthenticationFlowWithPicture
//
//  Created by Berkay Disli on 19.09.2022.
//

import Foundation

enum Categories: String, CaseIterable {
    case top, myFeed, local, inFocus
    
    var title: String {
        switch self {
        case .top:
            return "Top Stories"
        case .myFeed:
            return "My Feed"
        case .local:
            return "Local"
        case .inFocus:
            return "In Focus"
        }
    }
}
