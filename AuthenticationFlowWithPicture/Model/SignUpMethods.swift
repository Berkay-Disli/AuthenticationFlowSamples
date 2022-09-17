//
//  SignUpMethods.swift
//  AuthenticationFlowWithPicture
//
//  Created by Berkay Disli on 18.09.2022.
//

import Foundation

enum SignUpMethods: String, CaseIterable {
    case apple, facebook, twitter, google, email
    
    var title: String {
        switch self {
        case .apple:
            return "Apple"
        case .facebook:
            return "Facebook"
        case .twitter:
            return "Twitter"
        case .google:
            return "Google"
        case .email:
            return "Email"
        }
    }
}
