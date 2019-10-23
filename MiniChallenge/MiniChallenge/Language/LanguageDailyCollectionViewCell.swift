//
//  LanguageDailyCollectionViewCell.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 21/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class LanguageDailyCollectionViewCell: UICollectionViewCell {
    var url = URL(string: "")
    
    @IBOutlet weak var origin: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    public func setCell(_ origin: String?, _ title: String?, _ author: String?, _ rating: Double?, _ url: String?){
        self.origin.text = origin?.uppercased()
        self.title.text = title?.uppercased()
        self.author.text = author
        self.rating.text = String(round(1000 * (rating ?? 1.0) / 1000))
        self.setURL(url ?? "");
    }
    
    private func setURL(_ path: String) {
        self.url = URL(string: path);
    }
    
}
