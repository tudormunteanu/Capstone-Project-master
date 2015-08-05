//
//  EditProfileViewController.swift
//  K9-Chemistry
//
//  Created by Shaun Chua on 1/8/15.
//  Copyright (c) 2015 Shaun Chua. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var profile: Profile?
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.nameField.delegate = self
        self.phoneField.delegate = self
        
        if let profile = self.profile {
            if let name = profile.name {
                self.nameField.text = name
            }
            if let phone = profile.phone {
                self.phoneField.text = phone
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 5
        }
        return 3
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println("generate cell for \(indexPath)")
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        if indexPath.section == 0 {
            
            if indexPath.row == 0 {
                let nameField = UITextField(frame: CGRect(x: 0, y: 8, width: 100, height: 30))
                nameField.placeholder = "Name"
                cell.contentView.addSubview(nameField)
            } else if indexPath.row == 1 {
                let usernameField = UITextField(frame: CGRect(x: 0, y: 8, width: 100, height: 30))
                usernameField.placeholder = "Username"
                cell.contentView.addSubview(usernameField)
            } else if indexPath.row == 2 {
                let websiteField = UITextField(frame: CGRect(x: 0, y: 8, width: 100, height: 30))
                websiteField.placeholder = "Website"
                cell.contentView.addSubview(websiteField)
            } else if indexPath.row == 3 {
                let aboutMeField = UITextField(frame: CGRect(x: 0, y: 8, width: 100, height: 30))
                aboutMeField.placeholder = "About Me"
                cell.contentView.addSubview(aboutMeField)
            }
        } else {
            if indexPath.row == 0 {
                let emailField = UITextField(frame: CGRect(x: 0, y: 8, width: 100, height: 30))
                emailField.placeholder = "Email"
                cell.contentView.addSubview(emailField)
            } else if indexPath.row == 1 {
                let phoneField = UITextField(frame: CGRect(x: 0, y: 8, width: 100, height: 30))
                phoneField.placeholder = "Phone"
                cell.contentView.addSubview(phoneField)
            } else if indexPath.row == 2 {
                let genderField = UITextField(frame: CGRect(x: 0, y: 8, width: 100, height: 30))
                genderField.placeholder = "Gender"
                cell.contentView.addSubview(genderField)
            }
            
        }
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section) {
        case 1: return "PRIVATE INFORMATION"
            break
        default: return ""
            break
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField == self.nameField {
            self.contact?.name = textField.text
        } else if textField == self.phoneField {
            self.contact?.phone = textField.text
        }
    }

}
