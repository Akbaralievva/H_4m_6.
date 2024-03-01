//
//  MakerView.swift
//  Home_4month_6_UICollectionView
//
//  Created by A LINA on 1/3/24.
//

import UIKit

class MakerView {
    
    func makerLabel(text: String = "",
                    font: UIFont = UIFont.systemFont(ofSize: 15),
                    textColor: UIColor = .black,
                    backgroundColor: UIColor = .clear,
                    translatesAutoresizingMaskIntoConstraints: Bool = false) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.backgroundColor = backgroundColor
        label.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return label
    }
    
}



