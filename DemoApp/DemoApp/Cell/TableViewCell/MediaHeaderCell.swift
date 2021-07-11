//
//  MediaHeaderCell.swift
//  DemoApp
//
//  Created by Ateeq on 7/10/21.
//

import UIKit

class MediaHeaderCell: UITableViewCell {

    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblSeason: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    
    
    var model : MediaModel?{
        didSet{
            
            lblTitle.text = model?.name ?? ""
            
            if let year = model?.airDate?.split(separator: "-").first{
                lblYear.text = String(year)
            }
            
            lblSeason.text = "\(model?.seasonNumber ?? 0) Seasons"
            
        }
    }
}
