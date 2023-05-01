//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by daryl on 2023/4/26.
//  Copyright © 2023 daryl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate  {
    
    

    @IBOutlet var tableView: UITableView!
    var model = Model()
    var videos: [Video] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.videoDelegate = self
        
        model.getVideos()
    }
    
    // MARK: - Model Delegate Methods
    func videoFetched(_ videos: [Video]) {
        // set the return videos to our video property
        self.videos = videos
        // refresh the table view
        tableView.reloadData()
    }

    // MARK: - Table View methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEO_CELL, for: indexPath) as! VideoTableViewCell
        
        // configure the cell with data
        let video = videos[indexPath.row]
        
        cell.setCell(video)
        
        // return the cell
        return cell
    }
    
    
}

