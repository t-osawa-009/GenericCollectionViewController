//
//  GenericCollectionViewController.swift
//  GenericCollectionViewController
//
//  Created by Takuya Ohsawa on 2019/01/29.
//  Copyright © 2019 Takuya Ohsawa. All rights reserved.
//

import Foundation
import UIKit

class GenericCollectionViewController<Item, Cell: UICollectionViewCell>: UICollectionViewController {
    // MARK: - internal
    var items: [Item]
    var configure: (Cell, Item) -> Void
    var selectHandler: (Item) -> Void

    // MARK: - initializer
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(collectionViewLayout: UICollectionViewLayout, items: [Item], configure: @escaping (Cell, Item) -> Void, selectHandler: @escaping (Item) -> Void) {
        self.items = items
        self.configure = configure
        self.selectHandler = selectHandler
        super.init(collectionViewLayout: collectionViewLayout)
        self.collectionView.register(Cell.self, forCellWithReuseIdentifier: String(describing: Cell.self))
    }
    
    // MARK: - DataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: Cell.self), for: indexPath) as! Cell
        let item = items[indexPath.item]
        configure(cell, item)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let item = items[indexPath.item]
        selectHandler(item)
    }
    
}
