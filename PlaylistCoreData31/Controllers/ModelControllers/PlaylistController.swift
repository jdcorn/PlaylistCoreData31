//
//  PlaylistController.swift
//  PlaylistCoreData31
//
//  Created by Jon Corn on 1/15/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

// MOC = managed object context

import Foundation
import CoreData

// MARK: - Class
class PlaylistController {
    
    // Properties
    static let shared = PlaylistController()
    
    var playlists: [Playlist] {
        // Any time i want to create a playlist, this is how it's gonna find out where it's going to go on the persistent store
        let moc = CoreDataStack.context
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        let results = try? moc.fetch(fetchRequest)
        return results ?? []
    }
    
    // MARK: - CRUD Functions
    func createPlaylistWith(name: String) {
        _ = Playlist(name: name)
        
    }
    
    func deletePlaylist(playlist: Playlist) {
        if let moc = playlist.managedObjectContext {
            moc.delete(playlist)
            saveToPersistence()
        }
    }
    
    func saveToPersistence() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch let error {
            print("error saving \(error.localizedDescription)")
        }
    }
}
