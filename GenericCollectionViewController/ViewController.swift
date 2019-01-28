//
//  ViewController.swift
//  GenericCollectionViewController
//
//  Created by Takuya Ohsawa on 2019/01/29.
//  Copyright © 2019 Takuya Ohsawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        let vc = GenericCollectionViewController<String, CollectionViewCell>(collectionViewLayout: collectionViewLayout, items: ["hoge", "hoge2", "hoge3\nhoge3"], configure: { (cell, item) in
            cell.textLabel.text = item
            cell.textLabel.numberOfLines = 0
        }) { (item) in
            
        }
        vc.collectionView.backgroundColor = .white
        navigationController?.pushViewController(vc, animated: true)
    }
}

