//
//  UserInfoVC.swift
//  AdressBook
//
//  Created by OUT-Bolshakova-MM on 27.04.2020.
//  Copyright © 2020 OUT-Bolshakova-MM. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mobile: UILabel!
    @IBOutlet weak var home: UILabel!
    @IBOutlet weak var email: UILabel!

    var userInfo: UserContact?
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = userInfo?.name
        mobile.text = userInfo?.mobile
        home.text = userInfo?.homeTelephon
        email.text = userInfo?.email
        image.image = userInfo?.photo != nil ? UIImage(named: userInfo?.photo! ?? "person.fill") : UIImage(systemName: "person.fill")
    }
    

}
