//
//  ContentView.swift
//  GamingApp
//
//  Created by LMCM on 3/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var typeOfLogIn: Bool = true
    @State var isHomeViewActive: Bool = false
    @State var email = ""
    @State var password = ""
    @State var isPasswordVisible: Bool = false
    @State var newUserMail = ""
    @State var newUserPassword = ""
    @State var confirmNewUserPassword = ""
    var body: some View {
        NavigationView {
            ZStack {
            Color.theme.backgroundColor.ignoresSafeArea()
                Spacer()
                VStack {
                    Image("AppLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding(.top)
                    VStack {
                        HStack {
                            Spacer()
                            Button("Log in".uppercased()) {
                                typeOfLogIn = true
                            }.foregroundColor(typeOfLogIn ? .white : .gray)
                            Spacer()
                            Button("Sign up".uppercased()) {
                                typeOfLogIn = false
                            } .foregroundColor(typeOfLogIn ? .gray : .white)
                            Spacer()
                        }.padding()
                        Spacer(minLength: 42)
                        NavigationLink("", destination: HomeView(), isActive: $isHomeViewActive)
                        if typeOfLogIn == true {
                            LogInView(email: $email,
                                      password: $password,
                                      isPasswordVisible: $isPasswordVisible,
                                      isHomeViewActive: $isHomeViewActive)
                        } else {
                            SignUpView(newUserMail: $newUserMail,
                                       newUserPassword: $newUserPassword,
                                       confirmNewUserPassword: $confirmNewUserPassword,
                                        isHomeViewActive: $isHomeViewActive)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
