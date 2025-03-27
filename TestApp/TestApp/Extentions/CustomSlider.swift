//
//  CustomSlider.swift
//  TestApp
//
//  Created by raiyan sharif on 28/3/25.
//

import UIKit

class CustomSlider: UISlider {

    override func trackRect(forBounds bounds: CGRect) -> CGRect {
            // Customize track thickness
            let customHeight: CGFloat = 15
            return CGRect(x: bounds.origin.x,
                          y: bounds.midY - customHeight / 2,
                          width: bounds.width,
                          height: customHeight)
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            setupCustomAppearance()
            

        }
        
        private func setupCustomAppearance() {
            // Customize track colors
            minimumTrackTintColor = UIColor(hex: "9CC4FA", alpha: 1)
            maximumTrackTintColor = .white
            layer.borderWidth = 1
            layer.borderColor = UIColor(hex: "9CC4FA", alpha: 1).toCGColor()
            layer.cornerRadius = 7.5
            

            
            
            // Customize thumb image
            let thumbSize: CGFloat = 15
            let thumbImage = UIImage.circle(diameter: thumbSize, color: .white, borderWidth: 1, borderColor: UIColor(hex: "9CC4FA", alpha: 1))
            setThumbImage(thumbImage, for: .normal)
            setThumbImage(thumbImage, for: .highlighted)
        }
}





extension UIImage {
    static func circle(diameter: CGFloat, color: UIColor, borderWidth: CGFloat = 1, borderColor: UIColor = UIColor(hex: "9CC4FA")) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: diameter, height: diameter))
        return renderer.image { context in
            let rect = CGRect(x: 0, y: 0, width: diameter, height: diameter)
            
            // Draw the border circle
            borderColor.setFill()
            context.cgContext.fillEllipse(in: rect)
            
            // Draw the inner circle
            let insetRect = rect.insetBy(dx: borderWidth, dy: borderWidth)
            color.setFill()
            context.cgContext.fillEllipse(in: insetRect)
        }
    }
    

}

