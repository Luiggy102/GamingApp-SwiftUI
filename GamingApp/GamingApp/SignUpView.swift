//
//  SignUpView.swift
//  GamingApp
//
//  Created by LMCM on 3/14/22.
//

import SwiftUI

struct SignUpView: View {
    @State var newUserMail = ""
    @State var newUserPassword = ""
    var body: some View {
        ScrollView {
            VStack {
                // foto de usuario
                VStack {
                    Text("Select a profile picture")
                        .fontWeight(.bold)
                    Text("You can change it or select another one later")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .opacity(1)
                        .foregroundColor(Color("Dark-Cyan"))
                        .frame(width: 100, height: 100)
                        .scaledToFill()
                        .overlay(Image(systemName: "camera")
                                    .resizable()
                                    .frame(width: 50, height: 40)
                                    .scaledToFill()
                        )
                }
                MailInput(title: "Email", bindingEmail: $newUserMail)
                PasswordInput(title: "Password", bindingPassword: $newUserPassword)
                PasswordInput(title: "Confirm Password", bindingPassword: $newUserPassword)
                    .padding(.bottom, 40.0)
                MainButton(textOfTheButton: "Register")
                Text("Register with Social Media")
                    .padding(.top, 60.0)
                HStack {
                    SecundaryButton(textOfTheButton: "Facebook")
                    SecundaryButton(textOfTheButton: "Twitter")
                }
            }.padding(.horizontal, 30.0)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .preferredColorScheme(.dark)
        Image("screen2")
            .resizable()
    }
}
