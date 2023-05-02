//
//  DetailViewController.swift
//  youtube-onedaybuild
//
//  Created by daryl on 2023/5/1.
//  Copyright © 2023 daryl. All rights reserved.
//

import UIKit
import WebKit


class DetailViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var webView: WKWebView!
    
    @IBOutlet var textView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard video != nil else{
            return
        }
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        // load url. put it into web view
        let embedUrl = Constants.YT_EMBED_URL + video!.videoId
        let url = URL(string: embedUrl)
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
        
        // title, description, date
        titleLabel.text = video!.title
        let df = DateFormatter()
        df.dateFormat = "HHHH MM DD : HH mm ss"
        dateLabel.text = df.string(from: video!.published)
        textView.text = video!.description
        //
        
    }
    
    

}
