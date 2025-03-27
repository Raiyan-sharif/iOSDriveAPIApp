//
//  ColorCollectionViewCell.swift
//  TestApp
//
//  Created by raiyan sharif on 28/3/25.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
            
        colorView.layer.cornerRadius = 5
        colorImageView.layer.cornerRadius = 10
            
        colorView.clipsToBounds = true
    }
        
    func configure(with color: UIColor, isPremium: Bool) {
        colorView.backgroundColor = color
        colorImageView.isHidden = !isPremium
        
    }

}
