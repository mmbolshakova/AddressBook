//
//  ViewController.swift
//  AdressBook
//
//  Created by OUT-Bolshakova-MM on 27.04.2020.
//  Copyright © 2020 OUT-Bolshakova-MM. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    var contacts: [UserContact] = []
    var selectedUser: UserContact? = nil

    var users = UserSetup()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cellXib")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func unwindFromUserInfoVC(unwindSegue: UIStoryboardSegue) {
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        if let userContacts = segue.destination as? AddUserVC {
            userContacts.newContacts = users.contacts
        } else {
            return
        }
    }
}

extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = users.contacts[indexPath.row]
        let dest = storyboard?.instantiateViewController(withIdentifier: "UserInfo") as! UserInfoVC
        dest.userInfo = selectedUser
        navigationController?.pushViewController(dest, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            users.contacts.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return users.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellXib", for: indexPath) as? TableViewCell
        
        if (users.contacts[indexPath.row].photo == nil) {
            cell?.photoXib.image = UIImage(systemName: "person.fill")
        } else {
            cell?.photoXib.image = UIImage(named: users.contacts[indexPath.row].photo!) }
        cell?.nameXib.text = users.contacts[indexPath.row].name
        return cell!
    }
}
