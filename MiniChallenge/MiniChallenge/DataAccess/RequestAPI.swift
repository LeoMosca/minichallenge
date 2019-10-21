//
//  APIRequest.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//
import UIKit

class RequestAPI {
    static func fetchLanguages(_ callback: @escaping ([Language]) -> ()){
        let url = URL(string: "https://e726869f.ngrok.io/challenge")
        URLSession.shared.dataTask(with: url!) {(data, response, error ) in
            guard error == nil else {
                print("Erro ao consultar API")
                return
            }
                  
            guard let content = data else {
                print("Sem Dados")
                return
            }
                
            guard let resp = (try? JSONDecoder().decode([Language].self, from: content)) else {
                print("Not containing JSON")
                return
            }
                
            callback(resp)
        }.resume()
    }
    
    static func fetchImage(_ path: String, _ imageview: UIImageView){
        guard let url = URL(string: path) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                DispatchQueue.main.async() {
                    imageview.image = UIImage(data: data)
                }
            }
        }
        
        task.resume()
    }
}
