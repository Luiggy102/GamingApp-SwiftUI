//
//  GameView.swift
//  GamingApp
//
//  Created by LMCM on 5/1/22.
//

import SwiftUI
import AVKit

struct GameView: View {
    var gameUrl, title, studio, contentRaiting, publicationYear, welcomeDescription: String
    var platforms, tags, galleryImages: [String]
    var body: some View {
        ZStack {
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0)
                .ignoresSafeArea()
            VStack {
                let player = AVPlayer(url: URL(string: gameUrl)!)
                VideoPlayer(player: player)
                    .ignoresSafeArea()
                    .frame(height: 200)
                    .onAppear {
//                        player.play()
                        player.isMuted = true
                    }
                    .onDisappear { player.pause() }
                ScrollView {
                    VideoInfo(title: title,
                              studio: studio,
                              contentRaiting: contentRaiting,
                              publicationYear: publicationYear,
                              welcomeDescription: welcomeDescription,
                              tags: tags,
                              galleryImages: galleryImages)
                }
            }
        }
    }
}

struct VideoInfo: View {
    var title, studio, contentRaiting, publicationYear, welcomeDescription: String
    var tags, galleryImages: [String]
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.largeTitle)
                .bold()
                .padding(.leading)
                .padding(.top)
            HStack {
                Text("\(studio)  ")
                    .bold()
                + Text(contentRaiting + "  ")
                    .fontWeight(.light)
                + Text(publicationYear)
                    .fontWeight(.light)
            }
            .padding()
            Text(welcomeDescription)
                .padding(.horizontal)
                .padding(.top, 8)
            HStack {
                ForEach(tags, id: \.self) { tag in
                    Text("#\(tag)")
                        .font(.subheadline)
                        .padding(.top)
                        .padding(.leading)
                }
            }
            Text("Galery" .uppercased())
                .font(.title)
                .bold()
                .padding(.leading)
                .padding(.top)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(galleryImages, id: \.self) { gameImage in
                        UrlImage(urlString: gameImage)
                            .frame(width: 250, height: 150)
                            .padding()
                    }
                }
            }
            .padding(.horizontal)
            VStack(alignment: .leading, spacing: 0) {
                Text("Comments" .uppercased())
                    .font(.title)
                    .bold()
                    .padding(.leading)
                CommentView(username: "UserExample",
                            comment:
"""
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam
""",
                            daysAgo: 3)
                CommentView(username: "UserExample_1",
                            comment:
"""
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
veniam
""",
                            daysAgo: 7)
            }
            Text("Similar Games" .uppercased())
                .font(.title)
                .bold()
                .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button {
                    } label: { ImageCard(imageName: "Grand Theft Auto V") }
                    Button {
                    } label: { ImageCard(imageName: "Crash Bandicoot") }
                    Button {
                    } label: { ImageCard(imageName: "Death Stranding".uppercased()) }
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CommentView: View {
    let username, comment: String
    let daysAgo: UInt
    var body: some View {
        VStack {
            HStack {
                Image("demoPhoto")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .cornerRadius(50)
                    .scaledToFill()
                VStack {
                    Text(username)
                    Text(String(daysAgo) + "day(s) ago")
                        .font(.subheadline)
                        .fontWeight(.light)
                }
            }
            .padding(.horizontal)
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .leading)
            Text(comment)
                .padding(.horizontal)
                .padding(.bottom)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 20/255, green: 40/255, blue: 69/255))
        .cornerRadius(10)
        .padding()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameUrl: "Example.com",
                 title: "Sonic",
                 studio: "Sega",
                 contentRaiting: "E+",
                 publicationYear: "1991",
                 welcomeDescription:
                    """
Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente
""",
                 platforms: ["sega", "nintendo"],
                 tags: ["plataformas", "mascota"],
                 galleryImages: [
                    "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg",
                    "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg",
                    "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"]
        )
        .preferredColorScheme(.dark)
    }
}
