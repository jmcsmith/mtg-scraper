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
//        print(sets)
        //parseCardByMultiverseId(multiverseId: 439787)
        //parseCardByMultiverseId(multiverseId: 1)
        for i in 1...439787 {
            parseCardByMultiverseId(multiverseId: i)
        }
    }
    
    func getSetListFromSearch() -> [String] {
        let parser = SearchPageParser()
        return parser.parseSearchPage()
    }
    func parseCardByMultiverseId(multiverseId: Int) {
        let parser = CardPageParser()
        guard let myURL = URL(string: Constants.cardURL + multiverseId.description) else {
            print("Error: \(Constants.cardURL) doesn't seem to be a valid URL")
            return
        }
        print(myURL)
        parser.parseCardPage(url: myURL)
    }
    
    
}
