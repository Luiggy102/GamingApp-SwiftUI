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
        ZStack {
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea() // Background
            ScrollView { // ScrollView Para pantallas más pequeñas
                VStack(alignment: .leading) {
                    // Mail
                    Text("Email").foregroundColor(Color("Dark-Cyan")).fontWeight(.bold)
                    TextField("example@mail.com", text: $email)
                        .foregroundColor(.white)
                        .font(.caption)
                        .foregroundColor(.blue)
                        .disableAutocorrection(true)
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
                                .disableAutocorrection(true)
                        } else {
                            TextField("", text: $password)
                                .foregroundColor(Color(UIColor.lightGray))
                                .font(.caption)
                                .disableAutocorrection(true)
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
                    Button {
                        // Action of the "Forgot your password?" button here
                    } label: {
                        Text("Forgot your password?")
                            .font(.footnote)
                            .frame(width: 300, alignment: .trailing)
                            .foregroundColor(Color("Dark-Cyan"))
                            .padding(.bottom)
                    }
                }.padding(.horizontal, 77.0)
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
