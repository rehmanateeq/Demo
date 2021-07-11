//
//  SeasconCollectionCell.swift
//  DemoApp
//
//  Created by Ateeq on 7/10/21.
//

import UIKit

class SeasconCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var dividerView: UIView!
    
    var isSeasonSelected: Bool = false{
        didSet{
            bottomView.isHidden = !isSeasonSelected
        }
    }
    
}
