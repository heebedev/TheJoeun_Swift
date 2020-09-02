//
//  CrowlModel.swift
//  CovidMap
//
//  Created by 김승희 on 2020/09/02.
//  Copyright © 2020 김승희. All rights reserved.
//

import Foundation
import Kanna

protocol CrawlModelProtocol: class {
    func itemDownloaded(names: NSArray, totals: NSArray, pluses: NSArray, checkDate:String)
}

class CrawlModel: NSObject{
    var delegate: CrawlModelProtocol!
    
    func dataCrawling(){
        let mainURL = "http://ncov.mohw.go.kr"
        let names = NSMutableArray()
        let totalNum = NSMutableArray()
        let plusNum = NSMutableArray()
        var date = ""
        
        guard let main = URL(string: mainURL) else{
            print("Error \(mainURL) doesnt't seem to be a valid URL.")
            return
        }
        do{
            let htmlData = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: htmlData, encoding: .utf8)
            var count = 1
            
            //date :/html/body/div/div[5]/div[2]/div/div[1]/div[2]/div/div[2]/h2/a/span[1]
            
            for cc in doc.xpath("/html/body/div/div[5]/div[2]/div/div[1]/div[2]/div/div[2]/h2/a/span[1]") {
                let tempStr = cc.text!.replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").trimmingCharacters(in: .whitespacesAndNewlines)
                date = tempStr
            }
            
            //지역 : //*[@id="main_maplayout"]/button[1]/span[1]
            for title in doc.xpath("//*[@id='main_maplayout']/button/span"){
                let tempStr = title.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                switch count {
                    case 2:
                        totalNum.add(String(tempStr))
                        count += 1
                        break
                    case 3:
                        plusNum.add(String(tempStr))
                        count = 1
                        break
                    default:
                        names.add(String(tempStr))
                        count += 1
                        break
                }
            }
            
        } catch let error{
            print("Error: \(error)")
        }
        
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(names: names, totals: totalNum, pluses: plusNum, checkDate: date)
        })
    }
    
}

