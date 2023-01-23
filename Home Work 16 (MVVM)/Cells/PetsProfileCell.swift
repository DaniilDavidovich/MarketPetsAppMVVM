//
//  PetsProfile.swift
//  Home Work 16 (MVVM)
//
//  Created by Daniil Davidovich on 23.01.23.
//

import UIKit

class PetsProfileCell: UICollectionViewCell {
    
    static var identifier = "PetsProfileCell"
    
    
    //MARK: - Outlets
    
    private lazy var viewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 45
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageview = UIImageView()
        let image = UIImage(named: "dogImage")
        imageview.image = image
        imageview.contentMode = .scaleAspectFit
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "All"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private lazy var buttonLike: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.8000000119, green: 0.8000000119, blue: 0.8000000119, alpha: 1)
        button.addTarget(self, action: #selector(likeTouch), for: .touchUpInside)
        button.layer.cornerRadius = 25
        return button
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem ipsum dolor sit amet, "
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1$"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var iconCart: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "cart")
        imageView.image = image
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var buttonAdd: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var iconHeart: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "heart.fill")
        imageView.image = image
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var iconReting: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "stars")
        imageView.image = image
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarhy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
    
    //MARK: - Setups
    
    private func setupHierarhy() {
        addSubview(viewContainer)
        viewContainer.addSubview(imageView)
        viewContainer.addSubview(buttonLike)
        viewContainer.addSubview(title)
        viewContainer.addSubview(priceLabel)
        viewContainer.addSubview(descriptionLabel)
        viewContainer.addSubview(iconCart)
        viewContainer.addSubview(buttonAdd)
        viewContainer.addSubview(iconHeart)
        viewContainer.addSubview(iconReting)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([

            viewContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            viewContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewContainer.heightAnchor.constraint(equalToConstant: 142),
            viewContainer.widthAnchor.constraint(equalToConstant: 363),
            
            imageView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: viewContainer.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 142),
            imageView.widthAnchor.constraint(equalToConstant: 142),
            
            buttonLike.heightAnchor.constraint(equalToConstant: 50),
            buttonLike.widthAnchor.constraint(equalToConstant: 50),
            buttonLike.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -5),
            buttonLike.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            title.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            
            descriptionLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            
            priceLabel.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -10),
            priceLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            
            iconCart.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            iconCart.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -65),
            iconCart.widthAnchor.constraint(equalToConstant: 20),
            iconCart.heightAnchor.constraint(equalToConstant: 20),
            
            buttonAdd.centerYAnchor.constraint(equalTo: iconCart.centerYAnchor),
            buttonAdd.leadingAnchor.constraint(equalTo: iconCart.trailingAnchor, constant: 10),
            
            iconHeart.centerXAnchor.constraint(equalTo: buttonLike.centerXAnchor),
            iconHeart.centerYAnchor.constraint(equalTo: buttonLike.centerYAnchor),
            iconHeart.heightAnchor.constraint(equalToConstant: 27),
            iconHeart.widthAnchor.constraint(equalToConstant: 30),
            
            iconReting.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            iconReting.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            iconReting.heightAnchor.constraint(equalToConstant: 20),
            iconReting.widthAnchor.constraint(equalToConstant: 80)
        
        ])
    }
    
    //MARK: - Action
    
    @objc func likeTouch() {
        if buttonLike.backgroundColor == #colorLiteral(red: 0.8000000119, green: 0.8000000119, blue: 0.8000000119, alpha: 1) {
            buttonLike.backgroundColor = .red
        } else {
            buttonLike.backgroundColor = #colorLiteral(red: 0.8000000119, green: 0.8000000119, blue: 0.8000000119, alpha: 1)
        }
    }
    
    // ловит нажатия перед didSelectItemAt
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {

        guard isUserInteractionEnabled else { return nil }

        guard !isHidden else { return nil }

        guard alpha >= 0.01 else { return nil }

        guard self.point(inside: point, with: event) else { return nil }


        // add one of these blocks for each button in our collection view cell we want to actually work
        if self.buttonLike.point(inside: convert(point, to: buttonLike), with: event) {
            return self.buttonLike
        }

        return super.hitTest(point, with: event)
    }
    
}
