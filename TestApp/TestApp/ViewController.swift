//
//  ViewController.swift
//  TestApp
//
//  Created by raiyan sharif on 27/3/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fontSizeSliderView: CustomSlider!
    
    @IBOutlet weak var textFieldView: UITextField!
    
    @IBOutlet weak var colorCollectionView: UICollectionView!
    @IBOutlet weak var fontCollectionView: UICollectionView!
    
    
    var colorItems: [ColorModel] = [
            ColorModel(color: .white, isPrimium: false),
            ColorModel(color: .black, isPrimium: false),
            ColorModel(color: UIColor(hex: "54AC87", alpha: 1), isPrimium: true),
            ColorModel(color: UIColor(hex: "DE7840", alpha: 1), isPrimium: false),
            ColorModel(color: UIColor(hex: "D9B775", alpha: 1), isPrimium: false),
            ColorModel(color: UIColor(hex: "8B69D3", alpha: 1), isPrimium: true),
            ColorModel(color: UIColor(hex: "113247", alpha: 1), isPrimium: false)
        ]
    
    var fontItem: [FontModel] = [
        FontModel(text: "Default", isPrimium: false),
        FontModel(text: "Inter", isPrimium: true),
        FontModel(text: "Roboto", isPrimium: false),
        FontModel(text: "Iora", isPrimium: false),
        FontModel(text: "Montserrat", isPrimium: true),
        FontModel(text: "Item", isPrimium: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        uiSetup()
        setupCollectionView(colorCollectionView, cellIdentifier: "ColorCollectionViewCell", scrollDirection: .horizontal)
        setupCollectionView(fontCollectionView, cellIdentifier: "FontCollectionViewCell", scrollDirection: .vertical)
            
    }
    
    func setupCollectionView(_ collectionView: UICollectionView, cellIdentifier: String, scrollDirection: UICollectionView.ScrollDirection) {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = (collectionView == fontCollectionView) ? CGSize(width: 110, height: 35) : CGSize(width: 50, height: 50)
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            layout.scrollDirection = scrollDirection
            collectionView.collectionViewLayout = layout
            collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    


    func uiSetup() {
        textFieldView.layer.borderWidth = 1
        textFieldView.layer.borderColor = UIColor(hex: "9CC4FA", alpha: 1).toCGColor()
        textFieldView.layer.cornerRadius = 5
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == colorCollectionView {
            return colorItems.count
        } else if (collectionView == fontCollectionView) {
            return fontItem.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == colorCollectionView) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCollectionViewCell", for: indexPath) as! ColorCollectionViewCell
            let color = colorItems[indexPath.item].color
            let isPrimium = colorItems[indexPath.item].isPrimium
            cell.configure(with: color, isPremium: isPrimium)
            return cell
        } else if(collectionView == fontCollectionView) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FontCollectionViewCell", for: indexPath) as! FontCollectionViewCell
            
            cell.configure(with: fontItem[indexPath.item].text, isPremium: fontItem[indexPath.item].isPrimium)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

