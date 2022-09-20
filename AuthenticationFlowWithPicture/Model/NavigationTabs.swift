//
//  NavigationTabs.swift
//  AuthenticationFlowWithPicture
//
//  Created by Berkay Disli on 20.09.2022.
//

import Foundation

enum Tabs: String, CaseIterable {
    case news, video, blindspot, topics, map
    
    var icon: String {
        switch self {
        case .news:
            return "newspaper"
        case .video:
            return "video"
        case .blindspot:
            return "circles.hexagonpath"
        case .topics:
            return "rectangle.grid.3x2"
        case .map:
            return "globe.europe.africa"
        }
    }
}
