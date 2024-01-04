//
//  HomeView.swift
//  game-app
//
//  Created by Magistra Apta on 04/01/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var gameVM = GameViewModel()
    
    var body: some View {
        List{
            ForEach(gameVM.game){ item in
                NavigationLink {
                    GameDetailView(gameId: item.id)
                } label: {
                    GameComponent(imageUrl: item.backgroundImage, gameTitle: item.name, gameReleaseDate: item.released)
                }

            }
        }
        .navigationTitle("hello")
        .listStyle(.plain)
        .refreshable {
            Task{
                do{
                    try await gameVM.getGameData()
                } catch {
                    print("error getting game")
                }
            }
        }
        .onAppear{
            Task{
                do{
                    try await gameVM.getGameData()
                } catch {
                    print("error getting game")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
    }
}
