//
//  JsonModel.swift
//  ImageCustomJson
//
//  Created by 김승희 on 2020/09/02.
//  Copyright © 2020 김승희. All rights reserved.
//

import Foundation

protocol JsonModelProtocol: class {
    func itemDownloaded(items: NSArray)
    

}

class JsonModel: NSObject{
    
    var delegate: JsonModelProtocol!
    let urlPath = "http://192.168.200.119:8080/Test/student.json"
    
    func downloadItems() {
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) {(data, response, error) in
            if error != nil {
                print("Failed to download data")
            } else {
                print("Data is downloaded")
                self.parseJson(data!)
            }
        }
        
        task.resume()
    }
    
    
    func parseJson(_ data: Data) {
        var jsonResult = NSArray()
        
        do {
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0..<jsonResult.count {
            jsonElement = jsonResult[i] as! NSDictionary
            
            let query = DBModel()
            
            if let scode = jsonElement["code"] as? String,
               let sname = jsonElement["name"] as? String,
               let sdept = jsonElement["dept"] as? String,
               let sphone = jsonElement["phone"] as? String {
                query.scode = scode
                query.sname = sname
                query.sdept = sdept
                query.sphone = sphone
            }
            locations.add(query)
        }
        
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
        })
        
    }
    

}

