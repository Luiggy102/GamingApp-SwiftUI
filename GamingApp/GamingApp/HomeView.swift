//
//  HomeView.swift
//  GamingApp
//
//  Created by LMCM on 3/15/22.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Home view")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0) // los tags son para identificar los tabs
            Text("")
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
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color(red: 57, green: 63, blue: 83))
        UITabBar.appearance().isTranslucent = true
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().preferredColorScheme(.dark)
    }
}
