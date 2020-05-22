//
//  User.swift
//  AdressBook
//
//  Created by OUT-Bolshakova-MM on 27.04.2020.
//  Copyright © 2020 OUT-Bolshakova-MM. All rights reserved.
//

import Foundation

struct UserContact {
    var name: String!
    var mobile: String!
    var homeTelephon: String!
    var email: String!
    var photo: String?
    
    init(name: String, mobile: String, homeTel: String, email: String, photo: String?) {
        self.name = name
        self.mobile = mobile
        self.homeTelephon = homeTel
        self.email = email
        self.photo = photo
    }
}

class UserSetup {
    
    var contacts = [UserContact]()
    init() {
        setup()
    }
    
    func setup() {
        let user1 = UserContact(name: "QWE", mobile: "123", homeTel: "321", email: "qwe@qwe", photo: nil)
        let user2 = UserContact(name: "QWrt", mobile: "12543", homeTel: "65321", email: "qytrwe@qwe", photo: "nord")
        let user3 = UserContact(name: "turt", mobile: "12543", homeTel: "65321", email: "qytrwe@qwe", photo: "logo")
        let user4 = UserContact(name: "Wfrt", mobile: "12543", homeTel: "65321", email: "qytrwe@qwe", photo: "nord")
        let user5 = UserContact(name: "POJfr", mobile: "12543", homeTel: "65321", email: "qytrwe@qwe", photo: "logo")
        contacts.append(user1)
        contacts.append(user2)
        contacts.append(user3)
        contacts.append(user4)
        contacts.append(user5)
    }
}
