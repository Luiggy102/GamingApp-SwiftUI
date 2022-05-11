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
                            .padding()
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
    var body: some View {
        VStack() {
           Text("Settings")
                .font(.title2)
                .fontWeight(.bold)
        }
        .frame(maxWidth:.infinity, alignment: .leading)
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
    }
}
