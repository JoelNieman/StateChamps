//
//  Article.swift
//  StateChamps
//
//  Created by Joel Nieman on 2/4/16.
//  Copyright © 2016 JoelNieman. All rights reserved.
//

import Foundation

class Article {
    let title: String
    let author: String
    let publishDate: String
    let body: String
    
    init (title: String, author: String, publishDate: String, body: String) {
        self.title = title
        self.author = author
        self.publishDate = publishDate
        self.body = body
    }
}