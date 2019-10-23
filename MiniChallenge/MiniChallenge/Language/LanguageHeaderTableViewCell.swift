//
//  LanguageHeaderTableViewCell.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class LanguageHeaderTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    var articles:[DailyReading] = []
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var topics: UILabel!
    @IBOutlet weak var items: UILabel!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var favorite: UIImageView!
    
    @IBOutlet weak var favbutton: UIView!
    @IBOutlet weak var dailyreading: UICollectionView!
    
    public func setHeader(_ name: String, _ topics: Int, _ saw: Int?, _ items: Int, _ desc: String){
        self.name.text = name.uppercased();
        self.topics.text = String(topics) + " tópicos / " + String(saw ?? 0) + " vistos";
        self.items.text = String(items) + " materials";
        self.desc.text = String(desc);
        self.background.image = UIImage(named: (name + "BG") )
    }
    
    public func setFavoriteColor(_ hex: String?){
        self.favorite.image = self.favorite.image!.withRenderingMode(.alwaysTemplate)
        self.favorite.tintColor = UIColor(hex: hex ?? "#000000");
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        dailyreading.delegate = self;
        dailyreading.dataSource = self;
        
        favbutton.layer.cornerRadius = favbutton.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dailycell", for: indexPath) as? LanguageDailyCollectionViewCell {
            let row = indexPath.row;
            let read = articles[row];
            cell.setCell(read.origin, read.title, read.author, read.rating, read.url)
            
            return cell;
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.row
        print("selecionou o " + (articles[row].url ?? "nada") )
        
        if (articles[row].url != nil){
            guard let url = URL(string: articles[row].url ?? "") else {
                return
            }
            
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
    }

}
