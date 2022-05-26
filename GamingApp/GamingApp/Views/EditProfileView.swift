//
//  EditProfileView.swift
//  GamingApp
//
//  Created by lmcm on 5/11/22.
//

import SwiftUI

struct EditProfileView: View {
    @State private var changedUserName: String = ""
    @State private var changedMail: String = ""
    @State private var chagedPassword: String = ""
    @State private var isShowingPhotoPicker = false
    @State private var avatarImage = UIImage(named: "demoPhoto")!
    var body: some View {
        ZStack {
            Color.theme.backgroundColor.ignoresSafeArea()
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Edit Profile")
            VStack {
                Button {
                    //
                } label: {
                    Image(uiImage: avatarImage)
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
                    .onTapGesture { isShowingPhotoPicker = true }
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
            .sheet(isPresented: $isShowingPhotoPicker) {
                PhotoPicker(avatarImage: $avatarImage)
            }
        }
    }
    func updateUserData() {
        let updateDataObject = SaveData()
         let savedData = updateDataObject.saveData(username: changedUserName,
                                  userMail: changedMail,
                                  userPassword: chagedPassword)
        if savedData == true {
            print("Data updated correctly")
            print("New Data: \n username:\(changedUserName) \n email:\(changedMail) \n password:\(chagedPassword)")
            print("\(String(describing: UserDefaults.standard.stringArray(forKey: "userData")))")
        } else {
            print("Error while updating data")
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
            .preferredColorScheme(.dark)
    }
}
