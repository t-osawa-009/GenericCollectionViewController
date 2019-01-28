//
//  CollectionViewCell.swift
//  GenericCollectionViewController
//
//  Created by Takuya Ohsawa on 2019/01/29.
//  Copyright © 2019 Takuya Ohsawa. All rights reserved.
//

import Foundation
import UIKit

final class CollectionViewCell: UICollectionViewCell {
    lazy var textLabel: UILabel = {
        let textLabel = UILabel(frame: .zero)
        return textLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        contentView.addSubview(textLabel)
        
        let constraints: [NSLayoutConstraint] = [
            contentView.leftAnchor.constraint(equalTo: textLabel.leftAnchor, constant: 0),
            contentView.topAnchor.constraint(equalTo: textLabel.topAnchor, constant: 0),
            contentView.rightAnchor.constraint(equalTo: textLabel.rightAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 0),
            ]
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.frame = contentView.bounds
    }
}
