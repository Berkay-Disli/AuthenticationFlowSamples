//
//  AuthenticationViewModel.swift
//  AuthenticationFlowWithPicture
//
//  Created by Berkay Disli on 18.09.2022.
//

import Foundation
import Firebase
import GoogleSignIn

class AuthenticationViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var alertMessage = ""
    @Published var showAlert = false
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func signInWithCredential() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: ApplicationUtility.rootViewController) { [unowned self] user, error in
            
            if let error {
                print(error)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { result, error in
                if let error {
                    print(error.localizedDescription)
                    self.alertMessage = error.localizedDescription
                    self.showAlert = true
                    return
                }
                
                guard let user = result?.user else { return }
                self.userSession = user
                
                /*
                 Firestore.firestore().collection("users").document(user.uid).getDocument { _, error in
                 if error == nil {
                 print("User already exists.")
                 } else {
                 let userData = ["username": user.displayName ?? "No Username", "email": user.email ?? "No E-Mail"] as [String:Any]
                 Firestore.firestore().collection("users").document(user.uid).setData(userData) { error in
                 if let error { print(error.localizedDescription)} else {
                 print("User info saved.")
                 }
                 }
                 }
                 }
                 */
                
            }
        }
        
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            userSession = nil
            print("User logged out.")
        } catch let err {
            print(err.localizedDescription)
            self.alertMessage = err.localizedDescription
            self.showAlert = true
        }
    }
}
