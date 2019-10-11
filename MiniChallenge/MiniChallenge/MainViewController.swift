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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self;
        collectionView.dataSource = self;
    }
    
    override func viewDidAppear(_ animated: Bool) {
        RequestAPI.fetchLanguages { (resp) in
            self.languages = resp
            DispatchQueue.main.async {
                self.collectionView.reloadData()
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
            cell.setLangCell(language: lang.language!, topics: lang.topics!.count)
            cell.layer.borderColor = UIColor(red: 0.88, green: 0.88, blue: 0.88, alpha: 1.0).cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 5
            return cell;
            
        } else {
            print("i")
            return MainCollectionViewCell()
        }
    }
}
