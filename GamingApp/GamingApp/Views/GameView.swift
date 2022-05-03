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
                VideoPlayer(player: .init(url: URL(string: gameUrl)!))
                    .frame(height: 300)
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                       Text("\(title)")
                            .font(.largeTitle)
                            .padding(.leading)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
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

// struct GameViewModel {
//    var gameUrl = "Example.com"
//    var title = "Sonic"
//    var studio = "Sega"
//    var contentRaiting = "E+"
//    var publicationYear = "1991"
//    var welcomeDescription =
//                    """
// Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente
// """
//    var platforms = ["sega", "nintendo"]
//    var tags = ["plataformas", "mascota"]
//    var galleryImages = [
//
// "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg",
//
// "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg",
// "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"]
// }
