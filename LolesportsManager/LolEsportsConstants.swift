//
//  LolEsportsConstants.swift
//  LolesportsManager
//
//  Created by Taylor Caldwell on 7/1/15.
//  Copyright (c) 2015 Rithms. All rights reserved.
//

import Foundation

extension LolEsportsClient {
    
    // MARK: - Constants
    struct Constants {
        
        // MARK: Base URL
        static let BaseURL: String = "http://na.lolesports.com:80/api/"
        
        static let All: String = "all"
        
    }
    
    // MARK: - Methods
    struct Methods {
        
        // MARK: League
        static let League: String = "league.json"
        
        // MARK: Schedule
        static let Schedule: String = "schedule.json"
        
        // MARK: Misc
        static let Series: String = "series.json"
        static let Standings: String = "standings.json"
        
    }
    
    // MARK: - Parameters
    struct Parameters {
        
        // MARK: League
        static let Method: String = "parameters[method]"
        static let Published: String = "parameters[published]"
        
        // MARK: Schedule
        static let TournamentId: String = "tournamentId"
        static let TeamId: String = "teamId"
        static let IncludeFinished: String = "includeFinished"
        static let IncludeFuture: String = "includeFuture"
        static let IncludeLive: String = "includeLive"
        
    }
    
    // MARK: - JSON Keys
    struct JSONKeys {
        
        // MARK: League
        static let Leagues: String = "leagues"
        static let Id: String = "id"
        static let Label: String = "label"
        static let Color: String = "color"
        static let LeagueImage: String = "leagueImage"
        static let TournamentId: String = "defaultTournamentId"
        static let SeriesId: String = "defaultSeriesId"
        static let ShortName: String = "shortName"
        
        // MARK: Schedule
        static let DateTime: String = "dateTime"
        static let WinnerId: String = "winnerId"
        static let MatchId: String = "matchId"
        static let MaxGames: String = "maxGames"
        static let IsLive: String = "isLive"
        static let IsFinished: String = "isFinished"
        static let LiveStreams: String = "liveStreams"
        static let PolldaddyId: String = "polldaddyId"
        static let Name: String = "name"
        static let Contestants: String = "contestants"
        static let RedTeam: String = "red"
        static let BlueTeam: String = "blue"
        static let LogoURL: String = "logoURL"
        
        // MARK: Shared
        static let URL: String = "url"
        
    }
    
}