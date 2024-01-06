//
//  CoreDataViewModel.swift
//  game-app
//
//  Created by Magistra Apta on 06/01/24.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedFavorite: [FavoriteModel] = []
    
    init(){
        container = NSPersistentContainer(name: "GameContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("error: \(error)")
            }
        }
        fetchFavorite()
    }
    
    func fetchFavorite(){
        let request = NSFetchRequest<FavoriteModel>(entityName: "FavoriteModel")
        
        do{
            savedFavorite = try container.viewContext.fetch(request)
        } catch {
            print("error")
        }
        
    }
    
    func addFavorite(name: String, released: String, image: String){
        let newFavorite = FavoriteModel(context: container.viewContext)
        newFavorite.name = name
        newFavorite.released = released
        newFavorite.image = image
        
        saveData()
        
    }
    
    func saveData(){
        do{
            try container.viewContext.save()
            fetchFavorite()
        } catch {
            print("error")
        }
    }
    
    func deleteFavorite(indexSet: IndexSet){
        guard let index = indexSet.first else { return }
        
        let entity = savedFavorite[index]
        container.viewContext.delete(entity)
        saveData()
    }
}

