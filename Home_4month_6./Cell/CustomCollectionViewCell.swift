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
        imageView.layer.cornerRadius = 18
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleText = MakerView().makerLabel(text: "", font: UIFont.systemFont(ofSize: 20, weight: .bold), textColor: .white)
    
    private lazy var descriptionLbl = MakerView().makerLabel(text: "", font: UIFont.systemFont(ofSize: 15, weight: .regular), textColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureItems()
    }
    
    private func configureItems(){
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        contentView.addSubview(titleText)
        NSLayoutConstraint.activate([
            titleText.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 60),
            titleText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
            
        ])
        
        contentView.addSubview(descriptionLbl)
        NSLayoutConstraint.activate([
            descriptionLbl.topAnchor.constraint(equalTo: titleText.topAnchor,constant: 25),
            descriptionLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            descriptionLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
            
        ])
        
        
    }
    
    func configureItems(with items: Item) {
        imageView.image = UIImage(named: items.image)
        titleText.text = items.title
        descriptionLbl.text = items.descriptionTitle
    }
    
    func configureProducts(with products: Item) {
        imageView.image = UIImage(named: products.image)
        titleText.text = products.title
        descriptionLbl.text = products.descriptionTitle
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

