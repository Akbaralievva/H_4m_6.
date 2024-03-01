
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 20, height: 120)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.layer.cornerRadius = 35
        collectionView.layer.masksToBounds = true
        collectionView.backgroundColor = .darkGray
        return collectionView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
       // collectionView.dataSource = self
        
       // collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
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
            titleLbl.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            searchBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            searchBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchBtn.widthAnchor.constraint(equalToConstant: 20),
            searchBtn.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
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
        cell.layer.cornerRadius = 35
        cell.configure(with: items[indexPath.row])
        
        return cell
    }
        
      
    
//    @objc func secondTapped(_ sender: UIButton) {
//        print(123)
//        let vc = SecondViewController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
    
}

