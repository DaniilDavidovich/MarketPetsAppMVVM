//
//  DetailViewController.swift
//  Home Work 16 (MVVM)
//
//  Created by Daniil Davidovich on 23.01.23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var cell: Model? {
        didSet {
            titleLabel.text = cell?.title
            descriptionLabel.text = cell?.descriptionTitle
            labelPriceData.text = cell?.priceLabel
            if let valueAge = cell?.ageTitle {
                labelAgeData.text = String(valueAge)
            }
            imageView.image = UIImage(named: cell?.image ?? "")
            labelSexData.text = cell?.sexTitle
            labelColorData.text = cell?.colorTitle
        }
    }
    
    //MARK: - Outlets
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var viewContatiner: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 40
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .systemGray2
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var labelPrice: UILabel = {
        let label = UILabel()
        label.text = "Price"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelAge: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelSex: UILabel = {
        let label = UILabel()
        label.text = "Sex"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelColor: UILabel = {
        let label = UILabel()
        label.text = "Color"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var stackInformationTitle: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    
    private lazy var labelPriceData: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelAgeData: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var labelSexData: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var labelColorData: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var iconStars: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "stars")
        return imageView
    }()
    
    private lazy var buttonForNavigation: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarhy()
        setupLayout()
    }
    
    //MARK: - Setups
    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.9568627477, blue: 0.9568627477, alpha: 1)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow"), style: .done, target: self, action: #selector(popView))
        
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "heart"), style: .done, target: self, action: #selector(addToFavorite))
        
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    private func setupHierarhy() {
        view.addSubview(imageView)
        view.addSubview(viewContatiner)
        viewContatiner.addSubview(titleLabel)
        viewContatiner.addSubview(descriptionLabel)
        viewContatiner.addSubview(stackInformationTitle)
        stackInformationTitle.addArrangedSubview(labelPrice)
        stackInformationTitle.addArrangedSubview(labelAge)
        stackInformationTitle.addArrangedSubview(labelSex)
        stackInformationTitle.addArrangedSubview(labelColor)
        viewContatiner.addSubview(labelPriceData)
        viewContatiner.addSubview(labelSexData)
        viewContatiner.addSubview(labelColorData)
        viewContatiner.addSubview(labelAgeData)
        viewContatiner.addSubview(iconStars)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 480),
            
            viewContatiner.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            viewContatiner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewContatiner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            viewContatiner.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 50),
            titleLabel.topAnchor.constraint(equalTo: viewContatiner.topAnchor, constant: 30),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 35),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: viewContatiner.trailingAnchor, constant: -20),
            
            stackInformationTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackInformationTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            stackInformationTitle.topAnchor.constraint(equalTo: viewContatiner.bottomAnchor, constant: 30),
                        
            labelPriceData.centerXAnchor.constraint(equalTo: labelPrice.centerXAnchor),
            labelPriceData.topAnchor.constraint(equalTo: labelPrice.bottomAnchor, constant: 20),
            labelPriceData.widthAnchor.constraint(equalToConstant: 60),
            labelPriceData.heightAnchor.constraint(equalToConstant: 30),
            
            labelAgeData.centerXAnchor.constraint(equalTo: labelAge.centerXAnchor),
            labelAgeData.topAnchor.constraint(equalTo: labelAge.bottomAnchor, constant: 20),
            labelAgeData.widthAnchor.constraint(equalToConstant: 60),
            labelAgeData.heightAnchor.constraint(equalToConstant: 30),
            
            labelSexData.centerXAnchor.constraint(equalTo: labelSex.centerXAnchor),
            labelSexData.topAnchor.constraint(equalTo: labelSex.bottomAnchor, constant: 20),
            labelSexData.widthAnchor.constraint(equalToConstant: 60),
            labelSexData.heightAnchor.constraint(equalToConstant: 30),
            
            labelColorData.centerXAnchor.constraint(equalTo: labelColor.centerXAnchor),
            labelColorData.topAnchor.constraint(equalTo: labelColor.bottomAnchor, constant: 20),
            labelColorData.widthAnchor.constraint(equalToConstant: 60),
            labelColorData.heightAnchor.constraint(equalToConstant: 30),
            
            iconStars.trailingAnchor.constraint(equalTo: viewContatiner.trailingAnchor, constant: -60),
            iconStars.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            iconStars.widthAnchor.constraint(equalToConstant: 80),
            iconStars.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    
    //MARK: - Actions
    @objc func popView() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func addToFavorite() {
        if navigationItem.rightBarButtonItem?.tintColor == .white {
            navigationItem.rightBarButtonItem?.tintColor = .red
        } else {
            navigationItem.rightBarButtonItem?.tintColor = .white
        }
    }
    
    func configuration(model: Model) {
        self.titleLabel.text = model.title
        self.descriptionLabel.text = model.descriptionTitle
    }
}
