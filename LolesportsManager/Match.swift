//
//  Match.swift
//  LolesportsManager
//
//  Created by Taylor Caldwell on 7/2/15.
//  Copyright (c) 2015 Rithms. All rights reserved.
//

import Foundation

struct Match {
    
    var dateTime: NSDate?
    var winnerId: String?
    var matchId: String?
    var url: String?
    var maxGames: String?
    var isLive: Bool?
    var isFinished: String?
    var liveStreams: Bool?
    var polldaddyId: String?
    var name: String?
    var firstTeam: String?
    var secondTeam: String?
    var firstTeamLogo: String?
    var secondTeamLogo: String?
    
    init(dictionary: AnyObject) {
        
        let date = dictionary[LolEsportsClient.JSONKeys.DateTime] as? String
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mmZ"
        dateTime = formatter.dateFromString(date!)
        winnerId = dictionary[LolEsportsClient.JSONKeys.WinnerId] as? String
        matchId = dictionary[LolEsportsClient.JSONKeys.MatchId] as? String
        url = dictionary[LolEsportsClient.JSONKeys.URL] as? String
        maxGames = dictionary[LolEsportsClient.JSONKeys.MaxGames] as? String
        isLive = dictionary[LolEsportsClient.JSONKeys.IsLive] as? Bool
        isFinished = dictionary[LolEsportsClient.JSONKeys.IsFinished] as? String
        liveStreams = dictionary[LolEsportsClient.JSONKeys.LiveStreams] as? Bool
        polldaddyId = dictionary[LolEsportsClient.JSONKeys.PolldaddyId] as? String
        name = dictionary[LolEsportsClient.JSONKeys.Name] as? String
        if let contestants = dictionary[LolEsportsClient.JSONKeys.Contestants] as? [String : AnyObject] {
            if let firstTeam = contestants[LolEsportsClient.JSONKeys.BlueTeam] as? [String : AnyObject] {
                self.firstTeam = firstTeam[LolEsportsClient.JSONKeys.Name] as? String
                self.firstTeamLogo = firstTeam[LolEsportsClient.JSONKeys.LogoURL] as? String
            }
            if let secondTeam = contestants[LolEsportsClient.JSONKeys.RedTeam] as? [String : AnyObject] {
                self.secondTeam = secondTeam[LolEsportsClient.JSONKeys.Name] as? String
                self.secondTeamLogo = secondTeam[LolEsportsClient.JSONKeys.LogoURL] as? String
            }
        }
        
    }
    
    static func matchesFromResults(results: [String: AnyObject]) -> [Match] {
        
        var matches = [Match]()
        
        for (key, value) in results {
            matches.append(Match(dictionary: value))
        }
        
        return matches
    }
    
}