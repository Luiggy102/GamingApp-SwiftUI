//
//  EditProfileView.swift
//  GamingApp
//
//  Created by lmcm on 5/11/22.
//

import SwiftUI

struct EditProfileView: View {
    @State var changedUserName: String = ""
    @State var changedMail: String = ""
    @State var chagedPassword: String = ""
    var body: some View {
        ZStack {
            Color.theme.backgroundColor.ignoresSafeArea()
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Edit Profile")
            VStack {
                Button {
                    //
                } label: {
                Image("demoPhoto")
                    .resizable()
                    .opacity(1)
                    .foregroundColor(Color.theme.darkCyan)
                    .frame(width: 118, height: 118)
                    .cornerRadius(50)
                    .scaledToFill()
                    .overlay(Image(systemName: "camera")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 50, height: 40)
                                .opacity(20)
                                .scaledToFill()
                    )
                    .padding()
                }
                Spacer()
                ScrollView {
                    VStack {
                       MailInput(title: "Username",
                                 bindingEmail: $changedUserName,
                                 placeholder: "New Username")
                       MailInput(title: "Email",
                                 bindingEmail: $changedMail,
                                 placeholder: "Example@mail.com")
                        PasswordInput(title: "New password",
                                      bindingPassword: $chagedPassword,
                                      placeholder: "***********")
                        Button { updateUserData() } label: {
                            MainButton(textOfTheButton: "Update profile")
                        }

                    }
                    .padding()
                }
            }
        }
    }
    func updateUserData() {
       //
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
            .preferredColorScheme(.dark)
    }
}
