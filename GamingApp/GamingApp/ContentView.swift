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
                SignInView()
            }
        }
    }
}

struct LogInView: View {
    @State var email = "" // dependiendo del usario, esta var se actualizara
    @State var password = ""
    @State var isPasswordVisible: Bool = false
    var body: some View {
        ScrollView { // ScrollView Para pantallas más pequeñas
            VStack(alignment: .leading) {
                // Mail
                Text("Email").foregroundColor(Color("Dark-Cyan")).fontWeight(.bold)
                TextField("example@mail.com", text: $email)
                    .foregroundColor(.gray)
                    .font(.caption)
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cyan"))
                    .padding(.bottom)
                // Password
                Text("Password").foregroundColor(.white).fontWeight(.bold)
                HStack {
                    if !isPasswordVisible { // difente de == True
                        SecureField("Type your password", text: $password)
                            .foregroundColor(Color(UIColor.lightGray))
                            .font(.caption)
                    } else {
                        TextField("", text: $password)
                            .foregroundColor(Color(UIColor.lightGray))
                            .font(.caption)
                    }
                    Button {
                        isPasswordVisible.toggle()
                    } label: {
                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.white)
                            .padding(.bottom, 3.0)
                    }
                }.padding(.bottom, 3.0)

                Divider()
                    .frame(height: 1)
                    .background(.white)
                    .padding(.bottom)
                Text("Forgot your password?")
                    .font(.footnote)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("Dark-Cyan"))
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
