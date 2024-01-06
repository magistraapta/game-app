//
//  FavoriteView.swift
//  game-app
//
//  Created by Magistra Apta on 06/01/24.
//

import SwiftUI

struct FavoriteView: View {
    @StateObject var coreVM = CoreDataViewModel()
    var body: some View {
        List{
            ForEach(coreVM.savedFavorite){ item in
                HStack {
                    AsyncImage(url: URL(string: item.image ?? "default")) { image in
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
                    
                    VStack{
                        Text(item.name ?? "default")
                    }
                }
            }
            .onDelete(perform: coreVM.deleteFavorite)
        }
        .onAppear{
            coreVM.fetchFavorite()
        }
        .listStyle(.plain)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
