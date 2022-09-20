//
//  TabManager.swift
//  AuthenticationFlowWithPicture
//
//  Created by Berkay Disli on 20.09.2022.
//

import SwiftUI

struct TabManager: View {
    @EnvironmentObject var navVM: NavigationViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            switch navVM.selectedTab {
            case .news:
                Home()
            case .topics:
                Text("Topics")
            case .video:
                Text("Video")
            case .blindspot:
                Text("Blindspot")
            case .map:
                Text("Map")
            }
            
            
            VStack(spacing: 0) {
                Divider()
                
                HStack(alignment: .bottom) {
                    ForEach(Tabs.allCases, id:\.self) { tab in
                        Spacer()
                        VStack(spacing: 2) {
                            Image(systemName: navVM.selectedTab == tab ? "\(tab.icon).fill":tab.icon)
                                .font(.title3)
                                .frame(height: 25)
                            Text(tab.rawValue.capitalized)
                                .font(.footnote)
                        }
                        .foregroundColor(navVM.selectedTab == tab ? .black:.gray)
                        Spacer()
                    }
                }
                .padding(.top, 6)
                .frame(height: 50)
                .background(Color("pri"))
                .padding(.horizontal, 8)
            }
            zIndex(1)
        }
    }
}
    
struct TabManager_Previews: PreviewProvider {
        static var previews: some View {
            TabManager()
                .environmentObject(NavigationViewModel())
        }
}
