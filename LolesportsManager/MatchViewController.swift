//
//  MatchViewController.swift
//  LolesportsManager
//
//  Created by Taylor Caldwell on 7/4/15.
//  Copyright (c) 2015 Rithms. All rights reserved.
//

import Foundation

class MatchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var matches: [Match] = [Match]()
    var tournamentId: String?
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        if let tournyId = self.tournamentId {
            LolEsportsClient.sharedInstance().getMatches(self.tournamentId!) { result, error in
                if let data = result {
                    self.matches = sorted(data, {$0.dateTime!.compare($1.dateTime!) == NSComparisonResult.OrderedAscending})
                    dispatch_async(dispatch_get_main_queue()) {
                        self.tableView.reloadData()
                    }
                } else {
                    println(error)
                }
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "MatchCellIdentifier"
        let match = matches[indexPath.row]
        var cell = self.tableView.dequeueReusableCellWithIdentifier(cellId) as! MatchCell
        let firstTeamImage = NSURL(string: match.firstTeamLogo!)
        let secondTeamImage = NSURL(string: match.secondTeamLogo!)
        cell.firstTeamImage.sd_setImageWithURL(firstTeamImage, placeholderImage: UIImage(named: "placeholder"))
        cell.secondTeamImage.sd_setImageWithURL(secondTeamImage, placeholderImage: UIImage(named: "placeholder"))
        cell.firstTeamName.text = match.firstTeam!
        cell.secondTeamName.text = match.secondTeam!
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.NoStyle
        formatter.timeStyle = .ShortStyle
        cell.timeLabel.text = formatter.stringFromDate(match.dateTime!) + " MDT"
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.timeStyle = .NoStyle
        cell.dateLabel.text = formatter.stringFromDate(match.dateTime!)
        cell.match = match
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.matches.count
    }
    
    
}