//
//  Constants.swift
//  DemoApp
//
//  Created by Ateeq on 7/10/21.
//

import Foundation


let BASE_URL = ""

struct Cells {
    
    static let string = Cells()
    
    let MediaHeaderCell = "MediaHeaderCell"
    let MediaDetailsCell = "MediaDetailsCell"
    let SeasonCell = "SeasonCell"
    let SeasconCollectionCell = "SeasconCollectionCell"
    let MediaCell = "MediaCell"
}


enum CellType : Int{
    case headerCell = 0
    case detailCell = 1
    case selectionCell = 2
}


struct URLs{
    
    static let string = URLs()
    
    let mediaDetails = "https://api.themoviedb.org/3/tv/76479/season/2?api_key=3d0cda4466f269e793e9283f6ce0b75e"
}
