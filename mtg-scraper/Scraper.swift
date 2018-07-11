//
//  Scraper.swift
//  mtg-scraper
//
//  Created by Joseph Smith on 7/11/18.
//  Copyright © 2018 Robotic Snail Software. All rights reserved.
//

import Foundation

class Scraper: NSObject, XMLParserDelegate{
    
    var isInSets = false
    var sets: [String] = []
    
    func scrape() {
        print("scrape")
        print(Constants.searchURL)
        _ = getSetListFromSearch()
    }
    
    func getSetListFromSearch() -> [String] {
        
        guard let myURL = URL(string: Constants.searchURL) else {
            print("Error: \(Constants.searchURL) doesn't seem to be a valid URL")
            return sets
        }
        
        let parser = XMLParser(contentsOf: myURL)

        parser?.delegate = self
        
        parser?.parse()
        return sets
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if attributeDict["id"] == "ctl00_ctl00_MainContent_Content_SearchControls_setAddText" {
            isInSets = true
        }
        if elementName == "option" && isInSets {
            print(attributeDict["value"] ?? "")
            if let s = attributeDict["value"] {
                if s != "" {
                    sets.append(s)
                }
            }
            
        }
        
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "select" && isInSets {
            isInSets = false
        }
    }

}
