//
//  InsertModel.swift
//  DbCrud_01
//
//  Created by 김승희 on 2020/09/03.
//  Copyright © 2020 김승희. All rights reserved.
//

import Foundation

class InsertModel: NSObject{
    
    var urlPath = "http://localhost:8080/Test/studentInsert_ios.jsp"
    
    func insertItems(code: String, name:String, dept:String, phone:String) -> Bool {
        var result: Bool = true
        let urlAdd = "?code=\(code)&name=\(name)&dept=\(dept)&phone=\(phone)"
        urlPath += urlAdd
        //한글 url encoding -> 한글이 %글자로 바뀌어서 쓰여진다.
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil {
                print("Failed to insert data")
                result = false
            } else {
                print("Data is inserted")
                result = true
            }
        }
        
        task.resume()
        return result
    }
    
}
