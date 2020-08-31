//
//  Students.swift
//  SQLite
//
//  Created by 김승희 on 2020/08/31.
//  Copyright © 2020 김승희. All rights reserved.
//

import Foundation

class Students{
    
    var id: Int
    var name: String?
    // Optional ? -> Null Acceptable
    var dept: String?
    var phone: String?
    
    init(id: Int, name: String?, dept: String?, phone: String?) {
        self.id = id
        self.name = name
        self.dept = dept
        self.phone = phone
    }
}
