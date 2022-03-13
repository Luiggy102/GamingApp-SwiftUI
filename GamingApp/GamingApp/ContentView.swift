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
    @State var email = "" // dependiendo del usario, esta var se actualizara
    var body: some View {
        ScrollView { // ScrollView Para pantallas más pequeñas
            VStack(alignment: .leading) {
                Text("Email").foregroundColor(Color("Dark-Cyan")).fontWeight(.bold)
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text(verbatim: "mail@example.com").font(.caption).foregroundColor(.gray)
                    } else {
                        TextField(" ", text: $email)
                    }
                }
            }.padding(.horizontal, 77.0)
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
        ContentView().preferredColorScheme(.dark)
        Image("screen1").resizable()
        LoginAndRegisterView()
        LogInView()
        SignInView()
        Image("screen2").resizable()
    }
}
