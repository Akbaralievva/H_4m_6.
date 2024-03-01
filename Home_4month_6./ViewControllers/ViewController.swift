
//  ViewController.swift
//  Home_4month_6_UICollectionView
//
//  Created by A LINA on 29/2/24.
//



import UIKit

class ViewController: UIViewController, UICollectionViewDataSource  {
    
    var items: [Item] = []
    
    private lazy var backBtn: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "back")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleLbl = MakerView().makerLabel(text: "Recipe Categories", font: UIFont.systemFont(ofSize: 20, weight: .bold), textColor: .black)
    
    
    private lazy var searchBtn: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "search")
        button.setImage(image, for: .normal)
        button.addTarget(self, action:#selector(searchBtnTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 20, height: 110)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 10
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
        
        let productItem = UIBarButtonItem(customView: searchBtn)
        self.navigationItem.rightBarButtonItem = productItem
       
        
        setUp()
        itemsData()
    }
    
    private func itemsData(){
        
        items = [Item(image: "salad", title: "Salad", descriptionTitle: "16,278 recipes"),
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
    
    private func setUp(){
        
        view.addSubview(backBtn)
        view.addSubview(titleLbl)
        view.addSubview(searchBtn)
        view.addSubview(collectionView)
        
        
        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backBtn.widthAnchor.constraint(equalToConstant: 20),
            backBtn.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            titleLbl.leadingAnchor.constraint(equalTo: backBtn.leadingAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            searchBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            searchBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchBtn.widthAnchor.constraint(equalToConstant: 20),
            searchBtn.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    collectionView.dataSource = self
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        items.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        guard indexPath.row < items.count else {
            return UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
       
        cell.layer.cornerRadius = 18
        cell.configureItems(with: items[indexPath.row])
        
        return cell
    }
        
      
    
    @objc func searchBtnTapped() {
        print("tappeeeeeedddddededededgjnfgksdg")
        let vc = CategoriesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

