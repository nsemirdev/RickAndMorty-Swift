//
//  ViewController.swift
//  RickAndMorty-Swift
//
//  Created by Emir Alkal on 26.12.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = .init(width: 110, height: 140)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemTeal
        return collectionView
    }()
    

    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
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
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leadingMargin.equalTo(view.snp_leadingMargin)
            make.trailingMargin.equalTo(view.snp_trailingMargin)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

// MARK: - CollectionView Configuration

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CharacterItemCell
        
        return item
    }
}
