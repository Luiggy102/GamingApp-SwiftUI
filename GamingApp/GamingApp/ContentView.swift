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
                Image("AppLogo").resizable().scaledToFit().frame(width: 250).padding()
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
                Button("Log in") {
                    typeOfLogIn = true
                } .foregroundColor(typeOfLogIn ? .white : .gray)
                Spacer()
                Button("Sign up") {
                    typeOfLogIn = false
                } .foregroundColor(typeOfLogIn ? .gray : .white)
                Spacer()
            }.padding()
            Spacer(minLength: 42)
            if typeOfLogIn == true {
                LogInView()
            } else {
                SignInView()
            }
        }
    }
}

struct LogInView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Email").foregroundColor(.cyan)
            }
        }
    }
}

struct SignInView: View {
    var body: some View {
        Text("Sign in view").foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("screen1").resizable()
        ContentView().preferredColorScheme(.dark)
        LoginAndRegisterView()
        LogInView()
        SignInView()
        Image("screen2").resizable()
    }
}
