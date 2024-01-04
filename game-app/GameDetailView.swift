//
//  GameDetailView.swift
//  game-app
//
//  Created by Magistra Apta on 04/01/24.
//

import SwiftUI

struct GameDetailView: View {
    @StateObject var gameVM = GameViewModel()
    @State var gameId: Int
    var body: some View {
        ScrollView{
            VStack (alignment: .leading){
                if let gameDetail = gameVM.detail {
                    AsyncImage(url: URL(string: gameDetail.backgroundImage)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minHeight: 200, alignment: .top)
                            .clipped()
                            .cornerRadius(12)
                    } placeholder: {
                        Rectangle()
                            .frame( height: 200)
                            .foregroundColor(.secondary)
                            .cornerRadius(12)
                    }
                    
                    VStack (alignment: .leading, spacing: 8){
                        Text(gameDetail.name)
                            .font(.title2)
                            .bold()
                        Text("Release date: \(gameDetail.released)")
                            .foregroundColor(.secondary)
                        
                        Text(gameDetail.description)
                            .frame(height: 200)
                    }
                    
                    
                } else {
                    ProgressView()
                }

            }
            .padding(.horizontal, 20)

        }
        .task {
             await gameVM.getDetailGame(id: gameId)
        }

                
        
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView(gameId: 3498)
    }
}
