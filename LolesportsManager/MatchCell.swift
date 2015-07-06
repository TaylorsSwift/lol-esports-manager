//
//  MatchCell.swift
//  LolesportsManager
//
//  Created by Taylor Caldwell on 7/5/15.
//  Copyright (c) 2015 Rithms. All rights reserved.
//

import Foundation

class MatchCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var firstTeamImage: UIImageView!
    @IBOutlet weak var secondTeamImage: UIImageView!
    @IBOutlet weak var firstTeamName: UILabel!
    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var button: UIButton!
    var match: Match?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        firstTeamImage.layer.cornerRadius = firstTeamImage.frame.size.height / 2;
        firstTeamImage.layer.masksToBounds = true;
        firstTeamImage.layer.borderWidth = 0;
        secondTeamImage.layer.cornerRadius = secondTeamImage.frame.size.height / 2;
        secondTeamImage.layer.masksToBounds = true;
        secondTeamImage.layer.borderWidth = 0;
    }
    
    @IBAction func addItem() { // persist a representation of match in NSUserDefaults
        
        var todoDictionary = NSUserDefaults.standardUserDefaults().dictionaryForKey("MATCH") ?? Dictionary() // if match hasn't been set in user defaults, initialize todoDictionary to an empty dictionary using nil-coalescing operator (??)
        
        todoDictionary[self.match!.matchId!] = ["matchId": self.match!.matchId!, "name": self.match!.name!, "dateTime": self.match!.dateTime!] // store NSData representation of match in dictionary with matchId as key
        NSUserDefaults.standardUserDefaults().setObject(todoDictionary, forKey: "MATCH") // save/overwrite todo item list
        
        // create a corresponding local notification
        var notification = UILocalNotification()
        notification.alertBody = "The match \"\(self.match!.name!)\" is starting!" // text that will be displayed in the notification
        notification.alertAction = "open" // text that is displayed after "slide to..." on the lock screen - defaults to "slide to view"
        notification.fireDate = NSDate(timeIntervalSinceNow: 30)//self.match?.dateTime // match date (when notification will be fired)
        notification.soundName = UILocalNotificationDefaultSoundName // play default sound
        notification.userInfo = ["matchId": self.match!.matchId!,] // assign a unique identifier to the notification so that we can retrieve it later
        notification.category = "MATCH_CATEGORY"
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        button.hidden = true
    }
}