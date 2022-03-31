//
//  Buttons.swift
//  GamingApp
//
//  Created by LMCM on 3/14/22.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        VStack {
            MainButton(textOfTheButton: "Main Button")
            HStack {
                SecundaryButton(textOfTheButton: "Secundary button")
                SecundaryButton(textOfTheButton: "Secundary button")
            }
        }
    }
}

struct MainButton: View {
        var textOfTheButton: String
        var body: some View {
            Text(self.textOfTheButton.uppercased())
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6.0)
                        .stroke(Color("Dark-Cyan"), lineWidth: 1.0)
                        .shadow(color: .white, radius: 6))
            }
}

struct SecundaryButton: View {
    var textOfTheButton: String
    var body: some View {
        Text(self.textOfTheButton)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity/2, maxHeight: 8, alignment: .center)
            .padding()
            .background(Color(red: 31/255, green: 49/255, blue: 80/255))
            .cornerRadius(9)
        }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons().preferredColorScheme(.dark)
    }
}
