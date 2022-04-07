//
//  HomeScreen.swift
//  GamingApp
//
//  Created by LMCM on 3/18/22.
//

import SwiftUI
import AVKit

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
                    // (horizontal)Para que este un padding en la izquierda y derecha
                    }.padding(.horizontal, 18)
                }
            }
//            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
    }
    func search() {
        print("searching \($searchQuery)")
    }
}

struct HomeScreenSubmodule: View {
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
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
            Text("The most Popular".uppercased())
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
                Button(
                    action: {
                        url = urlVideos[0]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }, label: {
                        Cards(gameName: "The Witcher 3").padding(.bottom, 20)
                    })
            Text("Suggested categories".uppercased())
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
//        .navigationBarHidden(true).navigationBarBackButtonHidden(true)
        ScrollView(.horizontal, showsIndicators: false) { // suggested cateregories buttons
            HStack {
                Button {
                    print("Fps button pushed")
                } label: {
                    CategoriesCard(cateregoryName: "fps", cateregoryImageName: "FPS")
                }

                Button {
                    print("Rpg button pushed")
                } label: {
                    CategoriesCard(cateregoryName: "rpg", cateregoryImageName: "RPG")
                }

                Button {
                    print("Open World button pushed")
                } label: {
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
                    url = urlVideos[1]
                    print("URL: \(url)")
                    isPlayerActive = true
                } label: {
                    ImageCard(imageName: "Abzu")
                }
                Button {
                    url = urlVideos[4]
                    print("URL: \(url)")
                    isPlayerActive = true
                } label: {
                    ImageCard(imageName: "Cuphead")
                }
                Button {
                    url = urlVideos[5]
                    print("URL: \(url)")
                    isPlayerActive = true
                } label: {
                    ImageCard(imageName: "Hades")
                }

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
                    url = urlVideos[6]
                    print("URL: \(url)")
                    isPlayerActive = true
                } label: {
                    ImageCard(imageName: "Grand Theft Auto V")
                }
                Button {
                    url = urlVideos[2]
                    print("URL: \(url)")
                    isPlayerActive = true
                } label: {
                    ImageCard(imageName: "Crash Bandicoot")
                }
                Button {
                    url = urlVideos[3]
                    print("URL: \(url)")
                    isPlayerActive = true
                } label: {
                    ImageCard(imageName: "Death Stranding".uppercased())
                }

            }
        }.padding(.bottom)
        // MARK: - Navigation things
        NavigationLink(
                    destination: VideoPlayer(player:
                            AVPlayer(url: URL(string: url)!))
                            .frame(width: 400, height: 300)
                        ,
                    isActive: $isPlayerActive,
                    label: {
                        EmptyView()
                    })
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
    }
}
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen().preferredColorScheme(.dark)
    }
}
