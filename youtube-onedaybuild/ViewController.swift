//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by daryl on 2023/4/26.
//  Copyright © 2023 daryl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideos()
    }


}

