//
//  MainViewController.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 10/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var languages:[Language] = [];
    
    @IBOutlet weak var lastViewed: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activ: UIActivityIndicatorView!
    @IBOutlet weak var lastViewedTitle: UILabel!
    @IBOutlet weak var lastViewedLanguage: UILabel!
    @IBOutlet weak var lastViewedTopic: UILabel!
    @IBOutlet weak var lastViewedTool: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self;
        collectionView.dataSource = self;
        CoreDataManager.sharedInstance.insertLastSeen(0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        RequestAPI.fetchLanguages { (resp) in
            let langID = CoreDataManager.sharedInstance.getLanguages()
                .filter({ !$0.isDone })
                .map({ $0.id_lang })
            
            self.languages = resp.filter({ langID.contains(Int16($0.id ?? 0))})
            DispatchQueue.main.async {
                self.activ.stopAnimating()
                self.collectionView.reloadData()
            }
        }
        
        let lastViewedId: Int16 = CoreDataManager.sharedInstance.getLastSeen()[0].lastSeen
        
        for i in languages {
            if (i.topics != nil){
                for j in i.topics! {
                    if (j.tools != nil){
                        for l in j.tools!{
                            if (l.content != nil){
                                for m in l.content!{
                                    if (m.id ?? 0 == lastViewedId){
                                        lastViewedLanguage.text = i.language
                                        lastViewedTitle.text = m.title
                                        lastViewedTopic.text = j.name
                                        lastViewedTool.text = l.name
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return languages.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as? MainCollectionViewCell {
            
            let row = indexPath.row
            let lang:Language = self.languages[row];
            cell.setLangCell(language: lang.language!, topics: lang.topics!.count, color: lang.color!)
            cell.layer.borderColor = UIColor(red: 0.88, green: 0.88, blue: 0.88, alpha: 1.0).cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 5
            return cell;
            
        } else {
            print("i")
            return MainCollectionViewCell()
        }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? LanguageViewController {
            let item = collectionView.indexPathsForSelectedItems
            dest.lang = languages[item![0].row];
        }
    }
}

