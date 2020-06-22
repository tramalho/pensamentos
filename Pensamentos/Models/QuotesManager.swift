//
//  QuotesManager.swift
//  Pensamentos
//
//  Created by Thiago Antonio Ramalho on 21/06/20.
//  Copyright © 2020 Tramalho. All rights reserved.
//

import Foundation

class QuotesManager {
    var quotes: [Quote] = []
    
    init() {
        do {
            if let fileUrl = Bundle.main.url(forResource: "quotes", withExtension: "json") {
                let json = try Data(contentsOf: fileUrl)
                let decoder = JSONDecoder()
                quotes = try decoder.decode([Quote].self, from: json)
            }
        } catch let error {
            print(error)
        }
    }
    
    func getRandomQuote() -> Quote {
        
        var result = Quote.empty()
        
        if quotes.count > 0 {
            let index = Int(arc4random_uniform(UInt32(quotes.count)))
            result = quotes[index]
        }
        
        return result
    }
}
