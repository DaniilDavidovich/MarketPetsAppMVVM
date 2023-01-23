//
//  CellCollectionViewCell.swift
//  Home Work 16 (MVVM)
//
//  Created by Daniil Davidovich on 23.01.23.
//

import UIKit

class PetsGroupsCell: UICollectionViewCell {
    
    static var identifier = "CollectionView"
    
    //MARK: - Outlets
    
    private lazy var viewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageview = UIImageView()
        let image = UIImage(named: "catIcon")
        imageview.image = image
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "All"
        label.textColor = .black
        return label
    }()
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupHierarhy()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
    
    //MARK: - Setups
    private func setupView() {
        backgroundColor = .systemBlue
    }
    
    private func setupHierarhy() {
        addSubview(viewContainer)
        viewContainer.addSubview(imageView)
        addSubview(title)
       
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([

            viewContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewContainer.heightAnchor.constraint(equalToConstant: 83),
            viewContainer.widthAnchor.constraint(equalToConstant: 83),
            
            imageView.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor),
            
            title.topAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: 40),
            title.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
        
        ])
    }
    
}
