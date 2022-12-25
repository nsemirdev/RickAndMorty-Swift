//
//  CharacterItemCell.swift
//  RickAndMorty-Swift
//
//  Created by Emir Alkal on 26.12.2022.
//

import UIKit
import SnapKit
import SDWebImage

class CharacterItemCell: UICollectionViewCell {
    
    var character: Character? {
        didSet {
            let imageUrl = character!.image
            DispatchQueue.main.async {
                self.imageView.sd_setImage(with: URL(string: imageUrl))
                self.nameLabel.text = self.character!.name
            }
        }
    }

    var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "1")!)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .brown
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 17, weight: .thin)
        lbl.textColor = .white
        lbl.text = "Morty"
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    private func configure() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = 8
        
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(snp.leadingMargin)
            make.top.equalTo(snp.topMargin)
            make.trailing.equalTo(snp.trailingMargin)
            make.height.equalTo(imageView.snp.width)
        }
        
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.leading)
            make.trailing.equalTo(imageView.snp.trailing)
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.bottom.equalTo(snp.bottom).offset(-2)
        }
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
