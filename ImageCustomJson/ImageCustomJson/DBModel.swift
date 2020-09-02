//
//  DBModel.swift
//  ImageCustomJson
//
//  Created by 김승희 on 2020/09/02.
//  Copyright © 2020 김승희. All rights reserved.
//

import Foundation

class DBModel: NSObject{

    //Properties
    var scode: String?
    var sname: String?
    var sdept: String?
    var sphone: String?

    // Empty constructor
    override init() {
        
    }

    // Constructor with properties
    init(scode: String, sname: String, sdept: String, sphone: String) {
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
    }

}
