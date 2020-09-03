//
//  DBModel.swift
//  DbCrud_01
//
//  Created by 김승희 on 2020/09/03.
//  Copyright © 2020 김승희. All rights reserved.
//

import Foundation

class DBModel: NSObject{
    
    var scode: String?
    var sname: String?
    var sdept: String?
    var sphone: String?
    
    
    func inti(scode:String, sname:String, sdept:String, sphone:String) {
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
    }
    
    
}
