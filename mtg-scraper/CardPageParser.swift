//
//  CardPageParser.swift
//  mtg-scraper
//
//  Created by Joseph Smith on 7/12/18.
//  Copyright © 2018 Robotic Snail Software. All rights reserved.
//

import Foundation
import SwiftSoup

class CardPageParser{
    
    var isInName = false
    
    func parseCardPage(url: URL){
        let s = try? String(contentsOf: url)
   
        do {
            let doc: Document = try SwiftSoup.parse(s!)
            let srcs: Elements = try doc.select("div")
            for element: Element in srcs.array() {
                if try! element.attr("id") == "ctl00_ctl00_ctl00_MainContent_SubContent_SubContent_nameRow" {
                    //print("found it")
                    let name = try element.children().select("div").select("[class='value']").text()
                    //print(name.array()[0])
                    print(name)
                }
                
            }
            // do something with srcsStringArray
        } catch Exception.Error(_, let message) {
            print(message)
        } catch {
            print("error")
        }
    }
    
}
