//
//  HomeView.swift
//  GamingApp
//
//  Created by LMCM on 3/15/22.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeScreen()
            .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0) // los tags son para identificar los tabs
            GamesView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Games")
                }.tag(1)
            Text("")
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }.tag(2)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }.tag(3)
        }
        .navigationBarHidden(true)
        .accentColor(Color.white)
        .background(.ultraThinMaterial)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().preferredColorScheme(.dark)
    }
}
