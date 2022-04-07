//
//  GamesView.swift
//  GamingApp
//
//  Created by LMCM on 4/7/22.
//

import SwiftUI

struct GamesView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.gamesInfo, id: \.self) { game in
                    HStack {
                        UrlImage(urlString: game.galleryImages[0])
                        Text(game.title)
                            .bold()
                    }
                }
            }
            .navigationTitle("Games")
        }.onAppear {
            viewModel.fetch()
        }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
