//
//  MediaHeaderCell.swift
//  DemoApp
//
//  Created by Ateeq on 7/10/21.
//

import UIKit
import SDWebImage

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
                        
            showImage.sd_setImage(with: URL(string: "https://i.picsum.photos/id/1019/5472/3648.jpg?hmac=2mFzeV1mPbDvR0WmuOWSiW61mf9DDEVPDL0RVvg1HPs"), placeholderImage: UIImage(named: "fifa20Full"))

            
        }
    }
}
