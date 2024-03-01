//
//  CustomCollectionViewCell.swift
//  Home_4month_6_UICollectionView
//
//  Created by A LINA on 1/3/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
   private lazy var  imageView: UIImageView = {
        let imageView = UIImageView()
       imageView.layer.cornerRadius = 35
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
   
    private lazy var titleText: UILabel = {
        let title = UILabel()
        title.text = ""
        title.textColor = .white
        title.font = .systemFont(ofSize: 16, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
        
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        configureItems()
    }
    
    private func configureItems(){
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
           // imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 120)
        
        ])
        
        
        
        titleText.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleText)
        NSLayoutConstraint.activate([
            titleText.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15),
            titleText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -15),
            titleText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 15)
           // titleText.heightAnchor.constraint(equalToConstant: 100)
        
        ])
        
        
    }
    
    
    
    func configure(with items: Item) {
        imageView.image = UIImage(named: items.image)
        titleText.text = items.title
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
