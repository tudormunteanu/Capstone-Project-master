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
    
    let nameField = UITextField(frame: CGRect(x: 0, y: 8, width: 100, height: 30))
    let usernameField = UITextField(frame: CGRect(x: 0, y: 8, width: 100, height: 30))
    let websiteField = UITextField(frame: CGRect(x: 0, y: 8, width: 100, height: 30))
    let aboutMeField = UITextField(frame: CGRect(x: 0, y: 8, width: 100, height: 30))
    let emailField = UITextField(frame: CGRect(x: 0, y: 8, width: 100, height: 30))
    let phoneField = UITextField(frame: CGRect(x: 0, y: 8, width: 100, height: 30))
    let genderField = UITextField(frame: CGRect(x: 0, y: 8, width: 100, height: 30))
    
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        println(self.profile)
        println(self.profile?.name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let profile = self.profile {
            if let name = profile.name {
                nameField.text = name
            }
            if let username = profile.username {
                usernameField.text = username
            }
            if let website = profile.website {
                websiteField.text = website
            }
            if let aboutMe = profile.aboutMe {
                aboutMeField.text = aboutMe
            }
            if let email = profile.email {
                emailField.text = email
            }
            if let phone = profile.phone {
                phoneField.text = phone
            }
            if let gender = profile.gender {
                genderField.text = gender
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
                nameField.placeholder = "Name"
                cell.contentView.addSubview(nameField)
                nameField.delegate = self
            } else if indexPath.row == 1 {
                usernameField.placeholder = "Username"
                cell.contentView.addSubview(usernameField)
                usernameField.delegate = self
            } else if indexPath.row == 2 {
                websiteField.placeholder = "Website"
                cell.contentView.addSubview(websiteField)
                websiteField.delegate = self
            } else if indexPath.row == 3 {
                aboutMeField.placeholder = "About Me"
                cell.contentView.addSubview(aboutMeField)
                aboutMeField.delegate = self
            }
        } else {
            if indexPath.row == 0 {
                emailField.placeholder = "Email"
                cell.contentView.addSubview(emailField)
                emailField.delegate = self
            } else if indexPath.row == 1 {
                phoneField.placeholder = "Phone"
                cell.contentView.addSubview(phoneField)
                phoneField.delegate = self
            } else if indexPath.row == 2 {
                genderField.placeholder = "Gender"
                cell.contentView.addSubview(genderField)
                genderField.delegate = self
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
            self.profile?.name = textField.text
        } else if textField == self.phoneField {
            self.profile?.phone = textField.text
        } else if textField == self.usernameField {
            self.profile?.username = textField.text
        } else if textField == self.websiteField {
            self.profile?.website == textField.text
        } else if textField == self.aboutMeField {
            self.profile?.aboutMe == textField.text
        } else if textField == self.emailField {
            self.profile?.email == textField.text
        } else {
            self.profile?.gender == textField.text
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell)!
        //let profile = self.profile[indexPath.row]
        var destination = segue.destinationViewController as! FifthViewController
        destination.profile1 = profile
    }

}
