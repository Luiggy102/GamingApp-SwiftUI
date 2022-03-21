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
    // MARK: - LogIn vars
    @State var email = "" // dependiendo del usario, esta var se actualizara
    @State var password = ""
    @State var isPasswordVisible: Bool = false
    // MARK: - SignUp vars
    @State var newUserMail = ""
    @State var newUserPassword = ""
    @State var confirmNewUserPassword = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0)
                    .ignoresSafeArea() // Background
                Spacer()
                VStack {
                    Image("AppLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding()
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
                        if typeOfLogIn == true {
                            // MARK: - Log In View
                            ScrollView { // ScrollView Para pantallas más pequeñas
                                VStack(alignment: .leading) {
                                    // Mail
                                    MailInput(title: "Email", bindingEmail: $email, placeholder: "Example@mail.com")
                                    // Password
                                    Text("Password")
                                        .foregroundColor(Color("Dark-Cyan"))
                                        .fontWeight(.bold)
                                    HStack {
                                        if !isPasswordVisible { // difente de == True
                                            SecureField("Type your password", text: $password)
                                                .foregroundColor(Color("Dark-Cyan"))
                                                .font(.caption)
                                                .disableAutocorrection(true)
                                        } else {
                                            TextField("", text: $password)
                                                .foregroundColor(Color("Dark-Cyan"))
                                                .font(.caption)
                                                .disableAutocorrection(true)
                                        }
                                        Button {
                                            isPasswordVisible.toggle()
                                        } label: {
                                            Image(systemName: !isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                                .foregroundColor(Color("Dark-Cyan"))
                                        }
                                    }.padding(.bottom, 2)
                                    NavigationLink("", destination: HomeView(), isActive: $isHomeViewActive)
                                    Divider()
                                        .frame(height: 1)
                                        .background(Color("Dark-Cyan"))
                                        .padding(.bottom)
                                    // botón de Forgot your password
                                    Button {
                                        // acción para el botón de olvidar contraseña
                                    } label: {
                                        Text("Forgot your password?")
                                            .font(.footnote)
                                            .frame(width: 300, alignment: .trailing)
                                            .foregroundColor(Color("Dark-Cyan"))
                                            .padding(.bottom, 40.0)
                                    }
                                    // Botón de iniciar sesion
                                    Button {
                                        logIn()
                                    } label: {
                                        MainButton(textOfTheButton: "Log in")
                                    }
                                    Text("Log in with social media")
                                        .foregroundColor(.white)
                                        .padding(.top, 100)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    HStack(alignment: .center) {
                                        // facebook button
                                        Button {
                                            // acción
                                        } label: {
                                            SecundaryButton(textOfTheButton: "Facebook")
                                        }
                                        // Twitter button
                                        Button {
                                            // acción
                                        } label: {
                                            SecundaryButton(textOfTheButton: "Twitter")
                                        }
                                    }
                                }.padding(.horizontal, 77.0)
                            }
                        } else {
                            // MARK: - Sig Up View
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
                                                .foregroundColor(Color("Dark-Cyan"))
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
                                    MailInput(
                                        title: "Email", bindingEmail: $newUserMail, placeholder: "Example@mail.com")
                                    PasswordInput(
                                        title: "Password",
                                        bindingPassword: $newUserPassword,
                                        placeholder: "Type your password")
                                    PasswordInput(title: "Confirm Password",
                                                  bindingPassword: $confirmNewUserPassword,
                                                  placeholder: "Type again your password")
                                    .padding(.bottom, 40.0)
                                    Button {
                                        // Botón de registrarse
                                        logIn()
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
                                NavigationLink("", destination: HomeView(), isActive: $isHomeViewActive)
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    func logIn() {
        isHomeViewActive = true
    }
}

// MARK: -

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
