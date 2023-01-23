//
//  PetsProfile.swift
//  Home Work 16 (MVVM)
//
//  Created by Daniil Davidovich on 23.01.23.
//

import UIKit

class PetsProfileCell: UICollectionViewCell {
    
    static var identifier = "PetsProfileCell"
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
}
