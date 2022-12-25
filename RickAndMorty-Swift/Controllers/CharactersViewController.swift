//
//  ViewController.swift
//  RickAndMorty-Swift
//
//  Created by Emir Alkal on 26.12.2022.
//

import UIKit
import SnapKit

class CharactersViewController: UIViewController {
    
    var characterArray = [Character]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    var viewModel = CharactersViewModel()
    
    // MARK: - UI Elements
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = .init(width: 110, height: 160)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemTeal
        return collectionView
    }()
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        viewModel.delegate = self
        viewModel.fetchCharactersRequest()
    }

    fileprivate func setupNavigationBar() {
        navigationItem.title = "Characters"
    }
    
    fileprivate func setupView() {
        view.backgroundColor = .systemTeal
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(CharacterItemCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leadingMargin.equalTo(view.snp_leadingMargin)
            make.trailingMargin.equalTo(view.snp_trailingMargin)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

// MARK: - CollectionView Configuration

extension CharactersViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characterArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == characterArray.count - 1 {
            viewModel.fetchCharactersRequest()
        }
        
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CharacterItemCell
        item.character = characterArray[indexPath.row]
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.character = characterArray[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension CharactersViewController: CharactersViewModelDelegate {
    func fetchDidSuccess(_ vm: CharactersViewModel, fetchResultWithCharacters: CharacterCollection) {
        self.characterArray += fetchResultWithCharacters.results
    }
    
    func fetchFailWithError(_ vm: CharactersViewModel, errorMessage: String) {
        print(errorMessage)
    }
}
