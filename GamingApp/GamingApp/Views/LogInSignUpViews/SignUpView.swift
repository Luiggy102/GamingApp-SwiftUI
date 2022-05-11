//
//  SignUpView.swift
//  GamingApp
//
//  Created by LMCM on 3/14/22.
//

import SwiftUI

struct SignUpView: View {
    @Binding var newUserMail: String
    @Binding var newUserPassword: String
    @Binding var confirmNewUserPassword: String
    @Binding var isHomeViewActive: Bool
    var body: some View {
        ScrollView {
            VStack {
                // foto de usuario
                VStack {
                    Text("Select a profile picture")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Text("You can change it or select another one later")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.bottom)
                    Button {
                        // Botón de cambiar foto
                    } label: {
                        Image("demoPhoto")
                            .resizable()
                            .opacity(1)
                            .foregroundColor(Color.theme.darkCyan)
                            .frame(width: 80, height: 80)
                            .cornerRadius(50)
                            .scaledToFill()
                            .overlay(Image(systemName: "camera")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 30, height: 20)
                                        .scaledToFill()
                            )
                    }
                }
                MailInput(title: "Email", bindingEmail: $newUserMail, placeholder: "Example@mail.com")
                PasswordInput(title: "Password", bindingPassword: $newUserPassword, placeholder: "Type your password")
                PasswordInput(title: "Confirm Password",
                              bindingPassword: $confirmNewUserPassword,
                              placeholder: "Type again your password")
                    .padding(.bottom, 40.0)
                Button {
                   isHomeViewActive = true
                } label: {
                    MainButton(textOfTheButton: "Register")
                }
                Text("Register with Social Media")
                    .foregroundColor(.white)
                    .padding(.top, 60.0)
                HStack {
                    Button {
                        // Botón de Facebook
                    } label: {
                        SecundaryButton(textOfTheButton: "Facebook")
                    }

                    Button {
                        // Botón de Twitter
                    } label: {
                        SecundaryButton(textOfTheButton: "Twitter")
                    }
                }
            }.padding(.horizontal, 30.0)// .padding(.bottom, 50.0)
                .padding(.bottom, 50.0)
        }
    }
}

// struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView()
//            .preferredColorScheme(.dark)
//    }
// }
