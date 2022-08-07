//
//  CustomCellVC.swift
//  CompositionCollectionView
//
//  Created by 안지훈 on 8/6/22.
//

import Foundation
import UIKit

class CustomCell : UICollectionViewCell{
    
    @IBOutlet weak var cellImage: UIImageView!
    
    var imageName = "" {
        didSet{
            print("CustomCell - imageName / didset \(imageName)")
            self.cellImage.image = UIImage(systemName: imageName)
            self.cellImage.tintColor = .white
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromnib called ")
        self.contentView.backgroundColor = .clear

        
    }
    
    
}
