//
//  AddUserVCViewController.swift
//  AdressBook
//
//  Created by OUT-Bolshakova-MM on 28.04.2020.
//  Copyright © 2020 OUT-Bolshakova-MM. All rights reserved.
//

import UIKit

class AddUserVC: UIViewController {

    var user: UserContact?
    var nameSave: String? = nil
    var mobileSave: String? = nil
    var homeSave: String? = nil
    var emailSave: String? = nil
    var newContacts: [UserContact] = []
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var honePhone: UITextField!
    @IBOutlet weak var mobile: UITextField!
    @IBOutlet weak var name: UITextField!
    
    @IBAction func done(_ sender: Any) {
        if nameSave != nil && mobileSave != nil && homeSave != nil && emailSave != nil {
            user = UserContact(name: nameSave!, mobile: mobileSave!, homeTel: homeSave!, email: emailSave!, photo: nil)
            newContacts.insert(user!, at: 0)
            self.performSegue(withIdentifier: "reloadData", sender: nil)
        } else {
            return
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        if let userContact = segue.destination as? MainVC {
            userContact.users.contacts = newContacts
        } else {
            return
        }
    }
    
    @IBAction func nameEntered(_ sender: UITextField) {
        nameSave = String(name.text!)
    }
    
    @IBAction func mobileEntered(_ sender: Any) {
        mobileSave = String(mobile.text!)
    }
    
    @IBAction func homePhoneEntered(_ sender: Any) {
        homeSave = String(honePhone.text!)
    }
    
    @IBAction func emailEntered(_ sender: Any) {
        emailSave = String(email.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

