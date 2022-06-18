//
//  FireAuth.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import Firebase

class FireAuth {
    
    static func signIn() {
        Auth.auth().signInAnonymously { authResult, error in
            if let error = error {
                print("HELLO! Fail! Error: \(error)")
            }
            
            if let authResult = authResult {
                print("HELLO! Success! Signed in. uid: \(authResult.user.uid)")
            }
        }
    }
    
    static func userId() -> String? {
        let user = Auth.auth().currentUser
        if let user = user {
            return user.uid
        }
        return nil
    }
}
