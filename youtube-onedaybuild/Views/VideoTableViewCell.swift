//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by daryl on 2023/4/30.
//  Copyright © 2023 daryl. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet var thumbnailImageView: UIImageView!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var titleLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video) {
        self.video = v
        guard self.video != nil else {
            return
        }
        
        self.titleLabel.text = video!.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // check cache
        if let cacheData = CacheManager.getVideoCache(self.video!.thumbnail) {
            self.thumbnailImageView.image = UIImage(data: cacheData)
            return
        }
        
        let url = URL(string: self.video!.thumbnail)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil {
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                if url?.absoluteString != self.video!.thumbnail {
                    return
                }
            }
            let image = UIImage(data: data!)
            //set the image view
            DispatchQueue.main.async {
                self.thumbnailImageView.image = image
            }
            
        }
        
        dataTask.resume()
        
    }

}
