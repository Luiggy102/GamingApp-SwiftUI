//
//  FavoritesView.swift
//  GamingApp
//
//  Created by LMCM on 5/6/22.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    @StateObject var allVideoGames = ViewModel()
    var body: some View {
        ZStack {
            Color.theme.backgroundColor.ignoresSafeArea()
            VStack {
                Text("Favorites")
                    .font(.largeTitle)
                    .bold()
                ScrollView {
                    ForEach(allVideoGames.gamesInfo, id: \.self) { game in
                        Text(game.title)
                            .padding()
                            .font(.headline)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            .background(Color.theme.secondaryColor)
                    }
                }
                .padding(.bottom, 8)
            }
            .padding(.horizontal, 6)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .preferredColorScheme(.dark)
    }
}
