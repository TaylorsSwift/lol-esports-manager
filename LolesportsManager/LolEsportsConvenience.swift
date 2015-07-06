//
//  LolEsportsConvenience.swift
//  LolesportsManager
//
//  Created by Taylor Caldwell on 7/1/15.
//  Copyright (c) 2015 Rithms. All rights reserved.
//

import Foundation

// MARK - Convenience Resource Methods

extension LolEsportsClient {
    
    // MARK: Get Leagues
    func getLeagues(completionHandler: (leagues: [League]?, error: NSError?) -> Void) {
    
        let parameters = [Parameters.Method : Constants.All]
        
        taskGET(Methods.League, parameters: parameters) { json, error in
            
            if let downloadError = error {
                completionHandler(leagues: nil, error: error)
            } else {
                let leagueJSON = json.valueForKey(LolEsportsClient.JSONKeys.Leagues) as? [[String : AnyObject]]
                let leagues = League.leaguesFromResults(leagueJSON!)
                completionHandler(leagues: leagues, error: nil)
            }
        }
    }
    
    func getMatches(tournamentId: String, completionHandler: (matches: [Match]?, error: NSError?) -> Void) {
        
        let parameters: [String : AnyObject!] = [
            Parameters.TournamentId : tournamentId.toInt(),
            Parameters.IncludeFinished : false
        ]
        
        taskGET(Methods.Schedule, parameters: parameters) { json, error in
            
            if let downloadError = error {
                completionHandler(matches: nil, error: error)
            } else {
                let matches = Match.matchesFromResults(json as! [String : AnyObject])
                completionHandler(matches: matches, error: nil)
            }
            
        }
    }
    
}