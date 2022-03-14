//
//  LogInView.swift
//  GamingApp
//
//  Created by LMCM on 3/13/22.
//

import SwiftUI

struct LogInView: View {
    @State var email = "" // dependiendo del usario, esta var se actualizara
    @State var password = ""
    @State var isPasswordVisible: Bool = false
    var body: some View {
        ScrollView { // ScrollView Para pantallas más pequeñas
            VStack(alignment: .leading) {
                // Mail
                MailInput(title: "Email", bindingEmail: $email)
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
}
    func logIn() {
        print("Logged in")
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView().preferredColorScheme(.dark)
        Image("screen1").resizable()
    }
}
