//
//  LanguageModel.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

class Language:Codable {
    var id: Int?;
    var language: String?;
    var color: String?;
    var description: String?;
    var topics: [Topic]?;
    var dailyreading: [DailyReading]?;
}

class DailyReading: Codable {
    var origin: String?
    var title: String?
    var author: String?
    var rating: Double?
    var url: String?
}
