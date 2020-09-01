//
//  UserInfo.swift
//  addressBook
//
//  Created by 김승희 on 2020/09/01.
//  Copyright © 2020 김승희. All rights reserved.
//

import Foundation

class UserInfo {
    
    var useq: Int
    var name: String?
    var phone: String?
    var email: String?
    var address: String?
    var relation: String?
    
    init(useq: Int, name: String?, phone: String?, email: String?, address: String?, relation:String?) {
        self.useq = useq
        self.name = name
        self.phone = phone
        self.email = email
        self.address = address
        self.relation = relation
    }
    
}
