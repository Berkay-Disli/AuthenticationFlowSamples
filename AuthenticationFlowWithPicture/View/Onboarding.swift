//
//  Onboarding.swift
//  AuthenticationFlowWithPicture
//
//  Created by Berkay Disli on 18.09.2022.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("bg")
                    .ignoresSafeArea()
                
                // MARK: Main
                VStack {
                    // Logo
                    Text("BERKAY")
                        .font(.system(size: 80))
                        .fontWeight(.bold)
                        .foregroundColor(Color("pri"))
                        .tracking(-7)
                        .frame(height: 580)
                    
                    // Big Buttons
                    VStack {
                        NavigationLink {
                            SignUp()
                        } label: {
                            BigButtonFilled(text: "Sign Up", fgColor: Color("bg"), bgColor: Color("pri"))
                        }

                        
                        Button {
                            
                        } label: {
                            BigButtonStroked(text: "Log In", fgColor: Color("pri"), bgColor: Color("pri"))
                        }
                    }
                    
                    // Small Options
                    VStack {
                        HStack {
                            Text("Continue as Guest")
                            Spacer()
                            Text("Enter Referral Code")
                        }
                        .foregroundColor(Color("pri"))
                        .fontWeight(.bold)
                        .padding()
                        
                        Spacer()
                        
                        HStack(alignment: .top, spacing: 0) {
                            Text("By using the app, you agree to our ")
                            Text("Terms & Conditions")
                                .underline()
                        }
                        .foregroundColor(Color("pri"))
                        .font(.footnote)
                        .padding(.bottom)
                    }
                    
                }
            }
            .toolbar(.hidden)
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
