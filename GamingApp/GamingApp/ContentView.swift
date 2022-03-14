//
//  ContentView.swift
//  GamingApp
//
//  Created by LMCM on 3/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Spacer()
            // Color pide Double, se divide el # por 255
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea() // Background
            VStack {
                Image("AppLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250).padding()
                // Main Views
                LoginAndRegisterView()
            }
        }
    }
}

struct LoginAndRegisterView: View {
    @State var typeOfLogIn: Bool = true
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Log in".uppercased()) {
                    typeOfLogIn = true
                } .foregroundColor(typeOfLogIn ? .white : .gray)
                Spacer()
                Button("Sign up".uppercased()) {
                    typeOfLogIn = false
                } .foregroundColor(typeOfLogIn ? .gray : .white)
                Spacer()
            }.padding()
            Spacer(minLength: 42)
            if typeOfLogIn == true {
                LogInView()
            } else {
                SignUpView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
