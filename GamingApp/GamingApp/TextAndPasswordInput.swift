//
//  TextAndPasswordInput.swift
//  GamingApp
//
//  Created by LMCM on 3/14/22.
//

import SwiftUI

struct TextAndPasswordInput: View {
    @State var demoVar: String = ""
    @State var demoVar2: String = ""
    var body: some View {
        VStack {
            MailInput(title: "Email", bindingEmail: $demoVar)
            PasswordInput(title: "Password", bindingPassword: $demoVar2)
//            PasswordInputWithButton(title: "a", bindingPassword: $demoVar2, isPasswordVisible: true)
        }
    }
}

struct MailInput: View {
    var title: String
    var bindingEmail: Binding<String>
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.title)
                .foregroundColor(Color("Dark-Cyan"))
                .fontWeight(.bold)
            TextField("example@mail.com", text: self.bindingEmail)
                .foregroundColor(.white)
                .font(.caption)
                .foregroundColor(.blue)
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cyan"))
                .padding(.bottom)
        }
    }
}

struct PasswordInput: View {
    var title: String
    var bindingPassword: Binding<String>
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.title)
                .foregroundColor(Color("Dark-Cyan"))
                .fontWeight(.bold)
            HStack {
                SecureField("Type your password", text: bindingPassword)
                    .foregroundColor(.white)
                .font(.caption)
            }
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cyan"))
                .padding(.bottom)
        }
    }
}

// struct PasswordInputWithButton: View {
//    var title: String
//    var bindingPassword: Binding<String>
//    var isPasswordVisible: Bool
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(self.title)
//                .foregroundColor(Color("Dark-Cyan"))
//                .fontWeight(.bold)
//            HStack {
//                SecureField("Type your password", text: self.bindingPassword)
//                    .foregroundColor(.white)
//                .font(.caption)
//                Button {
//                    self.isPasswordVisible.toggle()
//                } label: {
//                    Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
//                        .foregroundColor(Color("Dark-Cyan"))
//                }
//            }.padding(.bottom, 1)
//            Divider()
//                .frame(height: 1)
//                .background(Color("Dark-Cyan"))
//                .padding(.bottom)
//        }
//    }
// }

struct TextAndPasswordInput_Previews: PreviewProvider {
    static var previews: some View {
        TextAndPasswordInput().preferredColorScheme(.dark)
    }
}
