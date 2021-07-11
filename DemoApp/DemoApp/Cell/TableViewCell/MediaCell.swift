//
//  MediCell.swift
//  DemoApp
//
//  Created by Ateeq on 7/10/21.
//

import UIKit
import SDWebImage

class MediaCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgEpisode: UIImageView!
    
    var model : Episode?{
        didSet{
            lblTitle.text = model?.name ?? ""
            imgEpisode.sd_setImage(with: URL(string: "https://picsum.photos/seed/picsum/200/300"), placeholderImage: UIImage(named: "fifa20Full"))
        }
    }
}
