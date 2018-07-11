//
//  SearchPageParser.swift
//  mtg-scraper
//
//  Created by Joseph Smith on 7/11/18.
//  Copyright © 2018 Robotic Snail Software. All rights reserved.
//

import Foundation

class SearchPageParser: NSObject, XMLParserDelegate {
    
    func parser(parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if elementName == "select" {
           print(attributeDict)
        }
    }
}
