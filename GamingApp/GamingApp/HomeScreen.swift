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
                    HomeScreenSubmodule()
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

struct HomeScreenSubmodule: View {
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    let urlVideos: [String] = [
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4",
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"
    ]
    var body: some View {
        VStack {
            Text("The most Popular".uppercased())
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
        }
    }
}
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen().preferredColorScheme(.light)
    }
}
