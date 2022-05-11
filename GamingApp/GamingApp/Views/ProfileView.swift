//
//  ProfileView.swift
//  GamingApp
//
//  Created by lmcm on 5/11/22.
//

import SwiftUI

struct ProfileView: View {
    @State var username: String = "Lorem"
    var body: some View {
        ZStack {
            Color.theme.backgroundColor.ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            VStack {
                Text("Profile")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
                Spacer()
                ScrollView {
                    VStack {
                        Image("demoPhoto")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(50)
                            .padding(.top)
                        Text("Gamer name user")
                            .font(.title2)
                    }
                    .padding()
                    SettingsSubModule()
                }
            }
        }
        .onAppear {
            //
        }
    }
}

struct SettingsSubModule: View {
    @State var enableNotification: Bool = false
    @State var isEditProfileViewActive: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            Text("Settings".uppercased())
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading)
            Button {
//                isEditProfileViewActive = true
            } label: {
                HStack {
                    Text("Account")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding()
            }
            .background(Color.theme.secondaryColor)
            //
            Toggle("Notifications", isOn: $enableNotification)
                .padding(10)
                .background(Color.theme.secondaryColor)
            //
            Button {
                isEditProfileViewActive = true
            } label: {
                HStack {
                    Text("Edit Profile")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding()
            }
            .background(Color.theme.secondaryColor)
            //
            Button {
//                isEditProfileViewActive = true
            } label: {
                HStack {
                    Text("Rate this app")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding()
            }
            .background(Color.theme.secondaryColor)
            //
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        NavigationLink("",
                        destination: EditProfileView(),
                        isActive: $isEditProfileViewActive)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
    }
}
