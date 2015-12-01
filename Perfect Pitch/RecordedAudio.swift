//
//  RecordedAudio.swift
//  Perfect Pitch
//
//  Created by Santiago Avila Arroyave on 12/1/15.
//  Copyright © 2015 Santiago Avila Arroyave. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject {
    
    var filePathUrl: NSURL
    var title: String
    
    init(filePathUrl: NSURL, title: String) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
}