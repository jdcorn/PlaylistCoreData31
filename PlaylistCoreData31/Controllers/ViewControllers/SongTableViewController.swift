//
//  SongTableViewController.swift
//  PlaylistCoreData31
//
//  Created by Jon Corn on 1/15/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {
    
    // MARK: - Properties
    var playlistLanding: Playlist?
    
    // MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        title = playlistLanding?.name
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        print("test")
        guard let songName = titleTextField.text, !songName.isEmpty,
              let artistName = artistTextField.text, !artistName.isEmpty,
              let playlist = playlistLanding else { return }
        
        SongController.createSongWith(title: songName, artist: artistName, playlist: playlist)
        
        titleTextField.text = ""
        artistTextField.text = ""
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistLanding?.songs?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        // Getting our songs from playlistLanding
        if let playlist = playlistLanding,
            let song = playlist.songs?.object(at: indexPath.row) as? Song {
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = song.artist
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlistLanding,
                let song = playlist.songs?.object(at: indexPath.row) as? Song else { return }
            SongController.deleteSong(song: song)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
