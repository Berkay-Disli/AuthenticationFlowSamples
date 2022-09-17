//
//  SignUp.swift
//  AuthenticationFlowWithPicture
//
//  Created by Berkay Disli on 18.09.2022.
//

import SwiftUI

struct SignUp: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }

                
                Text("Sign up with one of the following")
                    .foregroundColor(Color("pri"))
                    .font(.system(size: 47))
                    .fontWeight(.bold)
                    .padding(.top, 100)
                    .padding()
                    .padding(.bottom, 25)
                
                ForEach(SignUpMethods.allCases, id:\.self) { item in
                    IconButtonStroked(text: item.title, fgColor: Color("pri"), bgColor: Color("pri"), img: item.rawValue)
                        .padding(.bottom, 2)
                }
                
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
        .toolbar(.hidden)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
