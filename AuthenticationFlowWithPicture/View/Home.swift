//
//  Home.swift
//  AuthenticationFlowWithPicture
//
//  Created by Berkay Disli on 18.09.2022.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var authVM: AuthenticationViewModel
    @State private var showSignOutAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("pri").ignoresSafeArea()
                VStack {
                    Text("Home")
                        .font(.largeTitle)
                        .foregroundColor(Color("bg"))
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSignOutAlert.toggle()
                    } label: {
                        Text("Sign Out")
                            .foregroundColor(Color("bg"))
                    }
                    .alert("Signing Out", isPresented: $showSignOutAlert) {
                        Button(role: .destructive) {
                            authVM.signOut()
                        } label: {
                            Text("Sign Out")
                        }

                    } message: {
                        Text("Do you want to sign out?")
                    }

                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(AuthenticationViewModel())
    }
}
