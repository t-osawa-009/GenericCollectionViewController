//
//  GenericCollectionViewController.swift
//  GenericCollectionViewController
//
//  Created by Takuya Ohsawa on 2019/01/29.
//  Copyright © 2019 Takuya Ohsawa. All rights reserved.
//

import Foundation
import UIKit

class GenericCollectionViewController<T, Cell: UICollectionViewCell>: UICollectionViewController {
    // MARK: - internal
    var items: [T]
    var configure: (Cell, T) -> Void
    var selectHandler: (T) -> Void

    // MARK: - initializer
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(collectionViewLayout: UICollectionViewLayout, items: [T], configure: @escaping (Cell, T) -> Void, selectHandler: @escaping (T) -> Void) {
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
