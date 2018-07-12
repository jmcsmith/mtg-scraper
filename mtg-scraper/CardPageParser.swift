//
//  CardPageParser.swift
//  mtg-scraper
//
//  Created by Joseph Smith on 7/12/18.
//  Copyright © 2018 Robotic Snail Software. All rights reserved.
//

import Foundation

class CardPageParser: NSObject, XMLParserDelegate {
    
    var isInName = false
    
    func parseCardPage(url: URL){
        let s = try? String(contentsOf: url)
        //print(s)
        let parser = XMLParser(contentsOf: url)
        
        parser?.delegate = self
        parser?.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        if attributeDict["id"]?.range(of: "SubContent_nameRow") != nil {
            isInName = true
        }
        if attributeDict["class"] == "value" {
            print(attributeDict)
        }
        if let id = attributeDict["class"] {
            print(elementName + " : " + id)
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        //        if elementName == "div" && isInName {
        //            isInName = false
        //        }
        //print(qName)
    }
}
