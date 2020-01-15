//
//  SongController.swift
//  PlaylistCoreData31
//
//  Created by Jon Corn on 1/15/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    
    // MARK: - CRUD Functions
    static func createSongWith(title: String, artist: String, playlist: Playlist) {
        // Doesn't care about name of song, throw in _
        _ = Song(artist: artist, title: title, playlist: playlist)
        PlaylistController.shared.saveToPersistence()
    }
    
    static func deleteSong(song: Song) {
        if let moc = song.managedObjectContext {
            moc.delete(song)
            PlaylistController.shared.saveToPersistence()
        }
    }
}
