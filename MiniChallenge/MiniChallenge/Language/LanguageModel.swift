//
//  LanguageModel.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

class Language:Codable {
    var language: String?;
    var logo: String?;
    var color: String?;
    var description: String?;
    var topics: [Topic]?;
}
