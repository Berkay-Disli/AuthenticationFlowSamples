//
//  ContentView.swift
//  AuthenticationFlowWithPicture
//
//  Created by Berkay Disli on 17.09.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authVM: AuthenticationViewModel
    var body: some View {
        if authVM.userSession == nil {
            Onboarding()
                .transition(AnyTransition.opacity.animation(.easeInOut))
        } else {
            TabManager()
                .transition(AnyTransition.opacity.animation(.easeInOut))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthenticationViewModel())
            .environmentObject(NavigationViewModel())
    }
}
