//
//  CrawlModel.swift
//  Kanna_04
//
//  Created by 김승희 on 2020/09/01.
//  Copyright © 2020 김승희. All rights reserved.
//

import Foundation
import Kanna

protocol CrawlModelProtocol: class {
    func itemDownloaded(items: NSArray, itemsAddress: NSArray)
}

class CrawlModel: NSObject{
    var delegate: CrawlModelProtocol!
    
    func dataCrawling(year: String){
        let mainURL = "https://www.rottentomatoes.com/top/bestofrt/?year=\(year)"
        let locations = NSMutableArray()
        let locationsAddress = NSMutableArray()
        
        guard let main = URL(string: mainURL) else{
            print("Error \(mainURL) doesnt't seem to be a valid URL.")
            return
        }
        do{
            let htmlData = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: htmlData, encoding: .utf8)
            
            var count = 0
            for title in doc.xpath("//*[@id='top_movies_main']/div/table/tr/td/a"){
                let tempAddress = "https://www.rottentomatoes.com\(String(title["href"]!))"
                print(count, ":", title.text!.trimmingCharacters(in: .whitespacesAndNewlines))
                count += 1
            let countStr = String(format: "%3d", count)
                let tempStr = "\(countStr) : \(String(title.text!.trimmingCharacters(in: .whitespacesAndNewlines)))"
                locations.add(tempStr)
                locationsAddress.add(tempAddress)
            }

        }catch let error{
            print("Error: \(error)")
        }
        
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations, itemsAddress: locationsAddress)
        })
    }
    
}
