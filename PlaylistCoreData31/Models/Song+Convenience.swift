//
//  Song+Convenience.swift
//  PlaylistCoreData31
//
//  Created by Jon Corn on 1/15/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import Foundation
import CoreData

extension Song {
    
    convenience init(artist: String, title: String, playlist: Playlist, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.artist   = artist
        self.title    = title
        self.playlist = playlist
    }
}
