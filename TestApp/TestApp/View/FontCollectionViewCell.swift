//
//  FontCollectionViewCell.swift
//  TestApp
//
//  Created by raiyan sharif on 28/3/25.
//

import UIKit

class FontCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var fontView: UIView!
    @IBOutlet weak var fontName: UILabel!
    @IBOutlet weak var fontIsPremiumImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        fontView.layer.borderWidth = 1
        fontView.layer.borderColor = UIColor(hex: "9CC4FA", alpha: 1).toCGColor()
        fontView.layer.cornerRadius = 5
        fontIsPremiumImageView.layer.cornerRadius = 10
    }
    
    func configure(with text: String, isPremium: Bool) {
        fontName.text = text
        fontIsPremiumImageView.isHidden = !isPremium
        
    }
    

}
