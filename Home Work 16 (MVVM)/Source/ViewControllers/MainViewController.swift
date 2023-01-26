//
//  ViewController.swift
//  Home Work 16 (MVVM)
//
//  Created by Daniil Davidovich on 23.01.23.
//

import UIKit

class MainViewController: UIViewController {
    
    let viewModel = ViewModel()

    //MARK: - Outlets
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        // MARK: Cells
        collection.register(PetsGroupsCell.self, forCellWithReuseIdentifier: PetsGroupsCell.identifier)
        collection.register(PetsProfileCell.self, forCellWithReuseIdentifier: PetsProfileCell.identifier)
        collection.register(TextFieldCell.self, forCellWithReuseIdentifier: TextFieldCell.identifier)
        
        collection.backgroundColor = .systemGray6
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarhy()
        setupLayout()
        observer()
    }
    
    //MARK: - Observer
    
    private func observer() {
        viewModel.model.bind { data in

            self.collectionView.reloadData()
            print("Коллекция обновилась")
        }
    }
    
    //MARK: - Setups
    
    private func setupView() {
        title = "Search for a Best friend!"
    }
    
    private func setupHierarhy() {
        view.addSubview(collectionView)
        setupNavigationItem()
    }
    
    //MARK: - Setup NavigationItem
    private func setupNavigationItem() {
        let barButtonMenu = UIMenu(title: "", children: [
            
            UIAction(title: NSLocalizedString("Dog", comment: ""), image: UIImage(named: "dogIcon"), handler: { [weak self] make in
                let cell = Model(image: "dogImage", title: "Dog", descriptionTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui sapien imperdiet semper",priceLabel: "100$", ageTitle: 2, sexTitle: "Male", colorTitle: "black")
                
                self?.viewModel.model.value[2].append(cell)
            }),
            
            UIAction(title: NSLocalizedString("Cat", comment: ""), image: UIImage(named: "catIcon"), handler: { [weak self]  make in
                    let cell = Model(image: "catImage", title: "Cat", descriptionTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui sapien imperdiet semper",priceLabel: "33$", ageTitle: 1, sexTitle: "Male", colorTitle: "Black")
                
                self?.viewModel.model.value[2].append(cell)
            }),
            
            UIAction(title: NSLocalizedString("Fish", comment: ""), image: UIImage(named: "fishIcon"), handler:{
                [weak self]  make in
                       let cell = Model(image: "fishImage", title: "Fish", descriptionTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui sapien imperdiet semper",priceLabel: "10$", ageTitle: 3, sexTitle: "Male", colorTitle: "black")
                
                   self?.viewModel.model.value[2].append(cell)
            }),
            
            UIAction(title: NSLocalizedString("Bird", comment: ""), image: UIImage(named: "birdIcon"), handler:{ [weak self]  make in
                let cell = Model(image: "birdImage", title: "Bird", descriptionTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui sapien imperdiet semper",priceLabel: "12$", ageTitle: 1, sexTitle: "Male", colorTitle: "Multy")
                
            self?.viewModel.model.value[2].append(cell)
            })
        ])
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "add", image: UIImage(systemName: "plus"), primaryAction: nil, menu: barButtonMenu)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    //MARK: - Layout setup
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            
            switch sectionIndex {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 1),
                                                       heightDimension: .fractionalWidth(0.15))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 1)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 0, bottom: 30, trailing: 0)
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                return layoutSection
                
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 4),
                                                       heightDimension: .fractionalWidth(0.32))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 1)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 15)
                
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                return layoutSection
                
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 20, trailing: 15)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .absolute(177))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [layoutItem])
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
           
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 0,
                                                                      bottom: 20,
                                                                      trailing: 0)
                return layoutSection
            }
        }
    }
}


//MARK: - Extension

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.model.value[section].count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.model.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: TextFieldCell.identifier, for: indexPath) as? TextFieldCell
            return item ?? UICollectionViewCell()
        case 1:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: PetsGroupsCell.identifier, for: indexPath) as? PetsGroupsCell
            item?.configuration(model: viewModel.model.value[indexPath.section][indexPath.row])
            return item ?? UICollectionViewCell()
        default:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: PetsProfileCell.identifier, for: indexPath) as? PetsProfileCell
            item?.configuration(model: viewModel.model.value[indexPath.section][indexPath.row])
            return item ?? UICollectionViewCell()
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextFieldCell.identifier, for: indexPath) as? TextFieldCell
        cell?.textField.becomeFirstResponder()
        
        switch indexPath.section {
        case 2:
            let datailVC = DetailViewController()
            datailVC.cell = viewModel.model.value[indexPath.section][indexPath.row]
            navigationController?.pushViewController(datailVC, animated: true)
          
        default:
            break
        }
    }
}
