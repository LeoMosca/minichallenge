//
//  CompletedViewController.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 24/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class CompletedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var languages:[Language] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activ: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        RequestAPI.fetchLanguages { (resp) in
            let langID = CoreDataManager.sharedInstance.getLanguages()
                .filter({ $0.isDone })
                .map({ $0.id_lang })
            
            self.languages = resp.filter({ langID.contains(Int16($0.id ?? 0))})
            DispatchQueue.main.async {
                self.activ.stopAnimating()
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
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
