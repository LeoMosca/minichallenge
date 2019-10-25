//
//  TopicModel.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

class Topic: Codable {
    var id: Int?
    var name: String?
    var description: String?
    var tools: [Tool]?
}

class TopicColors {
    static var colors:[String: String] = [
        "Package Manager": "#DD7D29",
        "Web Frameworks": "#C6C62E",
        "Database Connection": "#98C62E",
        "Testing": "#6CD287",
        "Logger": "#2EC6BE",
        "API Clients": "#42C8F9",
        "Caching": "#429AF9",
        "Template Engines": "#636BFB",
        "Mail Handler": "#9F5BFF",
        "Task Schedule": "#E17EEE",
        "Real Time Communication": "#EE7E96",
        "Object Mapping": "#E379BE"
    ]
}
