//
//  Quotes.swift
//  Pensamentos
//
//  Created by Thiago Antonio Ramalho on 21/06/20.
//  Copyright © 2020 Tramalho. All rights reserved.
//

import Foundation

struct Quote: Codable {
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String {
        return "“\(quote)”"
    }
    
    var authorFormatted: String {
        return "- \(author) -"
    }
    
    static func empty() -> Quote {
      return Quote(quote: "", author: "", image: "")
    }
}
