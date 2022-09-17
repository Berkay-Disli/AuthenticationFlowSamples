//
//  IconButtonStroked.swift
//  AuthenticationFlowWithPicture
//
//  Created by Berkay Disli on 18.09.2022.
//

import SwiftUI

struct IconButtonStroked: View {
    let text: String
    let fgColor: Color
    let bgColor: Color
    let img: String
    var body: some View {
        ZStack {
            Image(img)
                .resizable()
                .scaledToFit()
                .padding(8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .saturation(0)
                .colorMultiply(.black)
                .colorInvert()
            
            Text(text)
                .foregroundColor(fgColor)
                .fontWeight(.medium)
                
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(content: {
            RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)).stroke(bgColor)
        })
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

struct IconButtonStroked_Previews: PreviewProvider {
    static var previews: some View {
        IconButtonStroked(text: "Sign Up with Apple", fgColor: .black, bgColor: Color("bg"), img: "twitter")
    }
}
