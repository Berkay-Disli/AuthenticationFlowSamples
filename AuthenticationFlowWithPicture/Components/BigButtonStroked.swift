//
//  BigButtonStroked.swift
//  AuthenticationFlowWithPicture
//
//  Created by Berkay Disli on 18.09.2022.
//

import SwiftUI

struct BigButtonStroked: View {
    let text: String
    let fgColor: Color
    let bgColor: Color
    
    var body: some View {
        Text(text)
            .foregroundColor(fgColor)
            .fontWeight(.medium)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(content: {
                RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)).stroke(bgColor)
            })
            .padding(.horizontal)
            .padding(.vertical, 5)
    }
}

struct BigButtonStroked_Previews: PreviewProvider {
    static var previews: some View {
        BigButtonStroked(text: "ahsd", fgColor: .green, bgColor: .orange)
    }
}
