//
//  Cards.swift
//  GamingApp
//
//  Created by LMCM on 3/28/22.
//

import SwiftUI

struct Cards: View {
    @State var gameName: String
    var body: some View {
        VStack(spacing: 0) {
            Image(gameName)
                .resizable()
                .scaledToFill()
            Text(gameName)
                .font(.headline)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .background(Color(red: 20/255, green: 40/255, blue: 69/255))
                .foregroundColor(.white)
        }
    }
}

struct Cards_Previews: PreviewProvider {
    static var previews: some View {
        Cards(gameName: "Cuphead")
    }
}
