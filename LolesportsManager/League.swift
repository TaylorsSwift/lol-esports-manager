//
//  League.swift
//  LolesportsManager
//
//  Created by Taylor Caldwell on 7/1/15.
//  Copyright (c) 2015 Rithms. All rights reserved.
//

import Foundation
import UIKit

struct League {
    
    var id: String?
    var label: String?
    var color: String?
    var leagueImage: String?
    var tournamentId: String?
    var seriesId: String?
    var shortName: String?
    var url: String?
    
    init(dictionary: [String : AnyObject]) {
        
        id = dictionary[LolEsportsClient.JSONKeys.Id] as? String
        label = dictionary[LolEsportsClient.JSONKeys.Label] as? String
        color = dictionary[LolEsportsClient.JSONKeys.Color] as? String
        leagueImage = dictionary[LolEsportsClient.JSONKeys.LeagueImage] as? String
        tournamentId = dictionary[LolEsportsClient.JSONKeys.TournamentId] as? String
        seriesId = dictionary[LolEsportsClient.JSONKeys.SeriesId] as? String
        shortName = dictionary[LolEsportsClient.JSONKeys.ShortName] as? String
        url = dictionary[LolEsportsClient.JSONKeys.URL] as? String
        
    }
    
    static func leaguesFromResults(results: [[String: AnyObject]]) -> [League] {
        
        var leagues = [League]()
        
        for result in results {
            leagues.append(League(dictionary: result))
        }
        
        return leagues
    }
}