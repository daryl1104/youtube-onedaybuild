//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by daryl on 2023/4/26.
//  Copyright © 2023 daryl. All rights reserved.
//

import Foundation
struct Constants {
    static var API_KEY = ""
    static var PLAYLIST_ID = "PLMRqhzcHGw1aMOUiH5tq-rlyvpYHwGluV"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
