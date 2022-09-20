//
//  NavigationViewModel.swift
//  AuthenticationFlowWithPicture
//
//  Created by Berkay Disli on 20.09.2022.
//

import Foundation

class NavigationViewModel: ObservableObject {
    @Published var selectedTab: Tabs = .news
    
    
    func setSelectedTab(tab: Tabs) {
        selectedTab = tab
    }
}
