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
            var n = try doc.select("[id='ctl00_ctl00_ctl00_MainContent_SubContent_SubContent_nameRow']").first()?.children().select("[class='value']").text()
            print(n!)
            var cmc = try doc.select("[id='ctl00_ctl00_ctl00_MainContent_SubContent_SubContent_cmcRow']").first()?.children().select("[class='value']").text()
            print(cmc!)
            var types = try doc.select("[id='ctl00_ctl00_ctl00_MainContent_SubContent_SubContent_typeRow']").first()?.children().select("[class='value']").text()
            print(types!)
            // do something with srcsStringArray
        } catch Exception.Error(_, let message) {
            print(message)
        } catch {
            print("error")
        }
    }
    
}
