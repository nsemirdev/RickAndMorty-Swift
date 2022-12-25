//
//  DetailViewController.swift
//  RickAndMorty-Swift
//
//  Created by Emir Alkal on 26.12.2022.
//

import UIKit
import SDWebImage
import SnapKit

class DetailViewController: UIViewController {
    var character: Character?
    
    // MARK: - UI Elements
    lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.sd_setImage(with: URL(string: character?.image ?? ""))
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .systemTeal
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        configureView()
    }
    

    fileprivate func configureView() {
        view.addSubview(characterImageView)
        
        characterImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leadingMargin)
            make.trailing.equalTo(view.snp.trailingMargin)
            make.height.equalTo(characterImageView.snp.width)
        }
    }

}
