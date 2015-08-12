//
//  FifthViewController.swift
//  K9-Chemistry
//
//  Created by Shaun Chua on 20/7/15.
//  Copyright (c) 2015 Shaun Chua. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    
    var shon3005 = Profile(name: "Shaun Chua", phone: "(347) 302-0851", username: "shon3005", gender: "Male", email: "shaun.chua@nyu.edu", aboutMe: "LOL", website: "hello.me")
    
    let nameLabel = UILabel(frame: CGRect(x: 8, y: 200, width: 100, height: 30))
    //let usernameLabel = UILabel(x:, y:, width:, height:)
    let websiteLabel = UILabel(frame: CGRect(x: 8, y: 250, width: 100, height: 30))
    let aboutMeLabel = UILabel(frame: CGRect(x: 8, y: 300, width: 100, height: 30))
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        println(self.shon3005)
        println(self.shon3005.name)
        nameLabel.text = shon3005.name
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(nameLabel)
        //let name = shon3005.name
        //nameLabel.text = name
        
        view.addSubview(websiteLabel)
        //let website = shon3005.website
        //websiteLabel.text = website
        
        view.addSubview(aboutMeLabel)
        //let aboutMe = shon3005.aboutMe
        //aboutMeLabel.text = aboutMe
        
        //if let profile1 = self.profile1 {
            
            //if let name = profile1.name {
                //nameLabel.text = name
            //}
            //if let website = profile1.website {
                //websiteLabel.text = website
            //}
            //if let aboutMe = profile1.aboutMe {
                //aboutMeLabel.text = aboutMe
            //}
        
        let name = shon3005.name
        nameLabel.text = name
        let website = shon3005.website
        websiteLabel.text = website
        let aboutMe = shon3005.aboutMe
        aboutMeLabel.text = aboutMe
        
    }
    
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //func loadView() {
        
    //}
    
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell)!
        //let profile = self.profile[indexPath.row]
        var destination = segue.destinationViewController as! EditProfileViewController
        destination.profile = shon3005
    }
    
    //func textFieldDidEndEditing(textLabel: UILabel) {
        //if textLabel == self.nameLabel {
            //self.profile1?.name = textLabel.text
        //} else if textLabel == self.websiteLabel {
            //self.profile1?.website == textLabel.text
        //} else if textLabel == self.aboutMeLabel {
            //self.profile1?.aboutMe == textLabel.text
        //}
    //}
    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

//    }
    
}