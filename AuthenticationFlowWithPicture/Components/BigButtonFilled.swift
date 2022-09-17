//
//  BigButtonFilled.swift
//  AuthenticationFlowWithPicture
//
//  Created by Berkay Disli on 18.09.2022.
//

import SwiftUI

struct BigButtonFilled: View {
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
                Rectangle().fill(bgColor)
                    .cornerRadius(5)
            })
            .padding(.horizontal)
            .padding(.vertical, 5)
    }
}

struct BigButtonFilled_Previews: PreviewProvider {
    static var previews: some View {
        BigButtonFilled(text: "ahsd", fgColor: .orange, bgColor: .green)
    }
}
