//
//  GameComponent.swift
//  game-app
//
//  Created by Magistra Apta on 04/01/24.
//

import SwiftUI

struct GameComponent: View {
    
    @State var imageUrl: String
    @State var gameTitle: String
    @State var gameReleaseDate: String
    
    var body: some View {
        HStack(spacing: 16){
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .frame(width: 150, height: 100)
                    .cornerRadius(12)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.secondary)
                    .frame(width: 150, height: 100)
                    .cornerRadius(12)
            }
            
            VStack (alignment: .leading){
                Text(gameTitle)
                Text(gameReleaseDate)
                    .foregroundColor(.secondary)
            }

        }
    }
}

struct GameComponent_Previews: PreviewProvider {
    static var previews: some View {
        GameComponent(imageUrl: "https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg", gameTitle: "GTA V", gameReleaseDate: "2013")
            .previewLayout(.sizeThatFits)
    }
}
