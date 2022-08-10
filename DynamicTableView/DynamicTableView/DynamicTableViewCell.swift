//
//  DynamicTableViewCell.swift
//  DynamicTableView
//
//  Created by 안지훈 on 8/10/22.
//

import UIKit
import Foundation


class DynamicTableViewCell : UITableViewCell{
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var content: UILabel!
    
    
    // 셀이 랜더링(그려질) 될 떄 호출되는 함수
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("awakeFromNib called()")
        
        // 이미지뷰의 반만큼 둥글게 그려진다. 
        imgView.layer.cornerRadius = imgView.frame.size.width / 2
        
        
    }
    
    
}
