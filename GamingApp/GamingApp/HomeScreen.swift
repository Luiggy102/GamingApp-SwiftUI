//
//  HomeScreen.swift
//  GamingApp
//
//  Created by LMCM on 3/18/22.
//

import SwiftUI

struct HomeScreen: View {
    @State var searchQuery: String = ""
    var body: some View {
        ZStack {
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0)
                .ignoresSafeArea()
            Spacer()
            ScrollView {
                VStack {
                    Image("AppLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding()
                    HStack {
                        Button {
                            search()
                        } label: {
                            Image(systemName: "magnifyingglass")
                            .foregroundColor(searchQuery.isEmpty ? Color.gray : Color.blue)
                        }
                        TextField("Seach a video", text: $searchQuery).foregroundColor(.gray)
                    }.frame(maxWidth: .infinity, idealHeight: 35)
                    .padding(.horizontal, 10)
                    .background(Color(red: 20/255, green: 40/255, blue: 69/255))
                    .cornerRadius(10)
                    Text("The most Popular")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .foregroundColor(.white)
                    .font(.title)
                    //
                }.padding(.horizontal, 18)
            } // (horizontal)Para que este un padding en la izquierda y derecha
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
    func search() {
        print("searching \($searchQuery)")
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen().preferredColorScheme(.light)
    }
}
