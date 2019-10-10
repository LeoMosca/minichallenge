//
//  MainViewController.swift
//  MiniChallenge
//
//  Created by Aluno Mack on 10/10/19.
//  Copyright © 2019 Leo Mosca. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var lastViewed: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lastViewed.layer.cornerRadius = 10;
    }
}
