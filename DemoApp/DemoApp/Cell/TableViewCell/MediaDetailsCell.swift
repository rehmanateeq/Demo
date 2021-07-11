//
//  MediaDetailsCell.swift
//  DemoApp
//
//  Created by Ateeq on 7/10/21.
//

import UIKit

class MediaDetailsCell: UITableViewCell {

    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnReadMore: UIButton!
    
    var didTapMore : (()->())?
    
    var model : MediaModel?{
        didSet{
            lblDescription.text = model?.overview ?? ""
        }
    }
    
    @IBAction func didTapReadMore(_ sender: Any) {
        
        lblDescription.numberOfLines = 0
        btnReadMore.isHidden = true
        didTapMore?()
        
    }
    
    
}
