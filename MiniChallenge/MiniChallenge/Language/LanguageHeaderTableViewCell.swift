//
//  LanguageHeaderTableViewCell.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class LanguageHeaderTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    var lang:Language = Language()
    var currentView:LanguageViewController?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var topics: UILabel!
    @IBOutlet weak var items: UILabel!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var favorite: UIImageView!

    @IBOutlet weak var favbutton: UIButton!
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
        return lang.dailyreading?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dailycell", for: indexPath) as? LanguageDailyCollectionViewCell {
            let row = indexPath.row;
            let read = lang.dailyreading?[row] ?? DailyReading();
            cell.setCell(read.origin, read.title, read.author, read.rating, read.url)
            
            return cell;
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.row
        let url = lang.dailyreading?[row].url
        print("selecionou o " + (url ?? "nada") )
        
        if (url != nil){
            guard let url = URL(string: url ?? "") else {
                return
            }
            
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
    }

    @IBAction func addLanguage(_ sender: Any) {
        CoreDataManager.sharedInstance.insertLanguage(lang.id ?? 0, false, topics: [])
        let alert = UIAlertController(title: "Sucesso!", message: "A linguagem \(lang.language ?? "") foi adicionada. Você já pode começar a estudar.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok, entendi", style: .default, handler: { (_) in
            self.currentView?.navigationController?.popToRootViewController(animated: true)
        }))
        
        currentView?.showAlert(alert)
        
    }
}
