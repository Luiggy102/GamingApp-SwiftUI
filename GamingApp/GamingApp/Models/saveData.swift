//
//  saveData.swift
//  GamingApp
//
//  Created by lmcm on 5/16/22.
//

import Foundation

class SaveData {
    var username: String = ""
    var userMail: String = ""
    var userPasword: String = ""
    func saveData(username: String, userMail: String, userPassword: String) -> Bool {
        UserDefaults.standard.set([username, userMail, userPassword], forKey: "userData")
        return true
    }
    func validateData(mail userMail: String, password userPassword: String) -> Bool {
        var savedMail = ""
        var savedPassword = ""
        if UserDefaults.standard.stringArray(forKey: "userData") != nil {
            savedMail = UserDefaults.standard.stringArray(forKey: "userData")![1]
            savedPassword = UserDefaults.standard.stringArray(forKey: "userData")![2]
            if userMail == savedMail && userPassword == savedPassword {
               return true
            } else { return false}
        } else { return false }
    }
    func getData() -> [String] {
        let userData: [String]? = UserDefaults.standard.stringArray(forKey: "userData")
        guard let userData = userData else { print("No user Data"); return [] }
        return userData
    }
}

// func saveUserData(email: String, password: String, username: String) {
//    UserDefaults.standard.set(email, forKey: "userEmail")
//    UserDefaults.standard.set(password, forKey: "userPassword")
//    UserDefaults.standard.set(username, forKey: "username")
//    print("New data: mail\(String(describing: UserDefaults.standard.string(forKey: "userEmail")))")
//    print("New data: password\(String(describing: UserDefaults.standard.string(forKey: "userPassword")))")
//    print("New data: username\(String(describing: UserDefaults.standard.string(forKey: "username")))")
// }
