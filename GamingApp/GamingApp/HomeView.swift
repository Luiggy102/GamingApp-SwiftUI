//
//  HomeView.swift
//  GamingApp
//
//  Created by LMCM on 3/15/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            Text("")
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Games")
                }
            Text("")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("")
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
