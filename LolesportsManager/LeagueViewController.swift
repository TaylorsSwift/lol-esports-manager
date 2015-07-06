//
//  LeagueViewController.swift
//  LolesportsManager
//
//  Created by Taylor Caldwell on 7/3/15.
//  Copyright (c) 2015 Rithms. All rights reserved.
//

import Foundation
import UIKit

class LeagueViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var leagues: [League] = [League]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        var nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        
        LolEsportsClient.sharedInstance().getLeagues { leagues, error in
            if let leagues = leagues {
                self.leagues = leagues
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                }
            } else {
                println(error)
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "LeagueCellIdentifier"
        let league = leagues[indexPath.row]
        var cell = self.tableView.dequeueReusableCellWithIdentifier(cellId) as! UITableViewCell
        let url = NSURL(string: league.leagueImage!)
        cell.imageView!.sd_setImageWithURL(url, placeholderImage: UIImage(named: "placeholder"))
        cell.textLabel!.text = league.label
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let league = leagues[indexPath.row]
        
        if let tournyId = league.tournamentId {
            let controller = self.storyboard!.instantiateViewControllerWithIdentifier("MatchViewController") as! MatchViewController
            controller.tournamentId = tournyId
            controller.navigationItem.title = "\(league.label!) Matches"
            self.navigationController!.pushViewController(controller, animated: true)
        } else {
            let controller = self.storyboard!.instantiateViewControllerWithIdentifier("NoMatchFoundViewController") as! UIViewController
            controller.navigationItem.title = "\(league.label!) Matches"
            self.navigationController!.pushViewController(controller, animated: true)
        }
    }
    
}