//
//  Scraper.swift
//  mtg-scraper
//
//  Created by Joseph Smith on 7/11/18.
//  Copyright © 2018 Robotic Snail Software. All rights reserved.
//

import Foundation

class Scraper{
    

    var sets: [String] = []
    
    func scrape() {
        print("scrape")
        print(Constants.searchURL)
        sets = getSetListFromSearch()
        print(sets)
    }
    
    func getSetListFromSearch() -> [String] {
        let parser = SearchPageParser()
        return parser.parseSearchPage()
    }
    
    
    
}
