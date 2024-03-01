//
//  CategoriesViewController.swift
//  Home_4month_6.
//
//  Created by A LINA on 29/2/24.
//



import UIKit

class CategoriesViewController: UIViewController, UICollectionViewDataSource  {
    
    var products: [Item] = []
    
    private lazy var backBtn: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "back")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleLbl = MakerView().makerLabel(text: "Salad", font: UIFont.systemFont(ofSize: 22, weight: .bold), textColor: .black)
    
    
    private lazy var searchBtn: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "search")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let horizontal_collectionView: UICollectionView = {
        let cv = UICollectionViewFlowLayout()
        cv.itemSize = CGSize(width: 350, height: 150)
        cv.minimumLineSpacing = 15
        cv.minimumInteritemSpacing = 15
        cv.scrollDirection = .horizontal
        cv.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 25)
        
        let cvc = UICollectionView(frame: .zero, collectionViewLayout: cv)
        cvc.translatesAutoresizingMaskIntoConstraints = false
        cvc.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cvc
    }()
    
    
    private lazy var textLbl = MakerView().makerLabel(text: "Sort by", font: UIFont.systemFont(ofSize: 22, weight: .bold), textColor: .black)
    
    
    private lazy var text2_Lbl = MakerView().makerLabel(text: "Most Popular", font: UIFont.systemFont(ofSize: 16, weight: .bold), textColor: .systemRed)
    
    
    
    
    private lazy var downUpBtn: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "down_up")
        button.setImage(image, for: .normal)
        button.setImage(image, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    private let vertical_collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 20, height: 120)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.layer.cornerRadius = 18
        collectionView.layer.masksToBounds = true
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        productsData()
        top_setUp()
        bottom_setUp()
    }
    
    private func productsData(){
        products = [Item(image: "salad", title: "Salad", descriptionTitle: "16,278 recipes"),
                    Item(image: "pizza", title: "Pizza", descriptionTitle: "14,385 recipes"),
                    Item(image: "beef", title: "Beef", descriptionTitle: "12,849 recipes"),
                    Item(image: "chicken", title: "Chicken", descriptionTitle: "18,237 recipes"),
                    Item(image: "sushi", title: "Sushi", descriptionTitle: "10,683 recipes"),
                    Item(image: "rice", title: "Rice", descriptionTitle: "16,843 recipes"),
                    Item(image: "seafood", title: "Seafood", descriptionTitle: "13,585 recipes"),
                    Item(image: "soup", title: "Soup", descriptionTitle: "11,384 recipes"),
                    Item(image: "besh", title: "National Food", descriptionTitle: "11,384 recipes"),
                    Item(image: "burger", title: "Burger", descriptionTitle: "11,384 recipes"),
                    Item(image: "dessert", title: "Cake", descriptionTitle: "17,488 recipes"),
                    Item(image: "drink", title: "Beverages", descriptionTitle: "13,852 recipes")
                    
        ]
    }
    
    private func top_setUp(){
        
        
        view.addSubview(backBtn)
        view.addSubview(titleLbl)
        view.addSubview(searchBtn)
        view.addSubview(horizontal_collectionView)
        
        
        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backBtn.widthAnchor.constraint(equalToConstant: 20),
            backBtn.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            titleLbl.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            searchBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            searchBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchBtn.widthAnchor.constraint(equalToConstant: 20),
            searchBtn.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        
        
        NSLayoutConstraint.activate([
            horizontal_collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            horizontal_collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            horizontal_collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            horizontal_collectionView.widthAnchor.constraint(equalToConstant: 350),
            horizontal_collectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
        horizontal_collectionView.dataSource = self
    }
    
    
    private func bottom_setUp(){
        
        view.addSubview(textLbl)
        view.addSubview(downUpBtn)
        view.addSubview(text2_Lbl)
        view.addSubview(vertical_collectionView)
        
        
        NSLayoutConstraint.activate([
            textLbl.topAnchor.constraint(equalTo: horizontal_collectionView.topAnchor, constant: 170),
            textLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        
        
        NSLayoutConstraint.activate([
            downUpBtn.topAnchor.constraint(equalTo: horizontal_collectionView.topAnchor, constant: 170),
            downUpBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            downUpBtn.heightAnchor.constraint(equalToConstant: 20),
            downUpBtn.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            text2_Lbl.topAnchor.constraint(equalTo: horizontal_collectionView.topAnchor, constant: 175),
            text2_Lbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            
        ])
        
        NSLayoutConstraint.activate([
            vertical_collectionView.topAnchor.constraint(equalTo: textLbl.topAnchor, constant: 50),
            vertical_collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            vertical_collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            vertical_collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        vertical_collectionView.dataSource = self
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        products.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if vertical_collectionView == horizontal_collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
            cell.configureProducts(with: products[indexPath.row])
            return cell
        } else {
            guard indexPath.row < products.count else {
                return UICollectionViewCell()
            }
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
            cell.configureProducts(with: products[indexPath.row])
            return cell
        }
    }
    
    
}

