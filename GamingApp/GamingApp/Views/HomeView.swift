//
//  HomeView.swift
//  GamingApp
//
//  Created by LMCM on 3/15/22.
//

import SwiftUI
import UIKit
import AVKit

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
            FavoritesView()
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
        .accentColor(.white)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    init() {
           UITabBar.appearance().barTintColor = UIColor(
            Color(red: 20/255, green: 40/255, blue: 69/255)
           )
           UITabBar.appearance().isTranslucent = true
           print("Init Home View")
    }
}

struct HomeScreen: View {
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
                    HomeScreenSubmodule()
                    // (horizontal)Para que este un padding en la izquierda y derecha
                }.padding(.horizontal, 18)
            }
        }
    }
    //    func search() {
    //        print("searching \($searchQuery)")
    //    }
}

struct HomeScreenSubmodule: View {
    @State var searchQuery: String = ""
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    @State var isGameInfoEmpty: Bool = false
    @State var isGameViewActive = false
    @StateObject var foundedGame = SearchGame()
    // MARK: - game vars
    @State var gameUrl: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var contentRaiting: String = ""
    @State var publicationYear: String = ""
    @State var welcomeDescription: String = ""
    @State var platforms: [String] = [""]
    @State var tags: [String] = [""]
    @State var galleryImages: [String] = [""]
    let urlVideos: [String] = [
        // Witcher 3
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4",
        // Abzu
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4",
        // Crash
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4",
        // Death stranding
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4",
        // Cuphead
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4",
        // Hades
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4",
        // GTA V
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"
    ]
    var body: some View {
        VStack {
            HStack {
                    Button {
                        watchGame(searchQuery)
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(searchQuery.isEmpty ? Color.gray : Color.blue)
                    }
                    .alert(Text("Error"), isPresented: $isGameInfoEmpty, actions: {
                        //
                    }, message: { Text("The game wasn't found") })
                    TextField("Seach a video",
                              text: $searchQuery)
                        .foregroundColor(.gray)
                }
                    .frame(maxWidth: .infinity, idealHeight: 35)
                .padding(.horizontal, 10)
                .background(Color(red: 20/255, green: 40/255, blue: 69/255))
                .cornerRadius(10)
                Text("The most Popular".uppercased())
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                Button(
                    action: {
                        watchGame("The Witcher 3")
                    }, label: {
                        Cards(gameName: "The Witcher 3").padding(.bottom, 20)
                    })
                Text("Suggested categories".uppercased())
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
            ScrollView(.horizontal, showsIndicators: false) { // suggested cateregories buttons
                HStack {
                    Button { print("Fps button pushed") } label: {
                        CategoriesCard(cateregoryName: "fps", cateregoryImageName: "FPS")
                    }
                    Button { print("Rpg button pushed") } label: {
                        CategoriesCard(cateregoryName: "rpg", cateregoryImageName: "RPG")
                    }
                    Button { print("Open World button pushed") } label: {
                        CategoriesCard(cateregoryName: "Open World", cateregoryImageName: "OpenWorld")
                    }
                }
            }
            Text("Recommended for you".uppercased())
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            // Recommended for you buttons
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button {
                        watchGame("Abzu")
                    } label: { ImageCard(imageName: "Abzu") }
                    Button {
                        watchGame("Cuphead")
                    } label: { ImageCard(imageName: "Cuphead") }
                    Button {
                        watchGame("Hades")
                    } label: { ImageCard(imageName: "Hades") }
                }
            }
            Text("Videos you may like".uppercased())
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            // Videos you may like buttons
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button {
                        watchGame("Grand Theft Auto V")
                    } label: { ImageCard(imageName: "Grand Theft Auto V") }
                    Button {
                        watchGame("Crash Bandicoot")
                    } label: { ImageCard(imageName: "Crash Bandicoot") }
                    Button {
                        watchGame("Death Stranding".uppercased())
                    } label: { ImageCard(imageName: "Death Stranding".uppercased()) }
                }
            }.padding(.bottom)
            // MARK: - Navigation things
                NavigationLink(
                    "",
                    destination: GameView(gameUrl: gameUrl,
                                          title: title,
                                          studio: studio,
                                          contentRaiting: contentRaiting,
                                          publicationYear: publicationYear,
                                          welcomeDescription: welcomeDescription,
                                          platforms: platforms,
                                          tags: tags,
                                          galleryImages: galleryImages),
                    isActive: $isGameViewActive
                )
    }
    func watchGame(_ searchQuery: String) {
        foundedGame.search(searchQuery)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            print("games founded: \(foundedGame.seachedGames.count)")
            if foundedGame.seachedGames.count == 0 {
                isGameInfoEmpty = true
            } else {
                gameUrl = foundedGame.seachedGames[0].videosUrls.mobile
                title = foundedGame.seachedGames[0].title
                studio = foundedGame.seachedGames[0].studio
                contentRaiting = foundedGame.seachedGames[0].contentRaiting
                publicationYear = foundedGame.seachedGames[0].publicationYear
                welcomeDescription = foundedGame.seachedGames[0].welcomeDescription
                platforms = foundedGame.seachedGames[0].platforms
                tags = foundedGame.seachedGames[0].tags
                galleryImages = foundedGame.seachedGames[0].galleryImages
                isGameViewActive = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().preferredColorScheme(.dark)
    }
}
