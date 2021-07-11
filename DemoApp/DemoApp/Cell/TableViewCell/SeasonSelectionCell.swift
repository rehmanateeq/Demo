//
//  SeasonCell.swift
//  DemoApp
//
//  Created by Ateeq on 7/10/21.
//

import UIKit

class SeasonSelectionCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var previousSelectedIndex : IndexPath = IndexPath(row: 0, section: 0)
    var numberofRows = 0
    
    func setupCollectionView(rows : Int){
        
        numberofRows = rows
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: Cells.string.SeasconCollectionCell, bundle: Bundle.main), forCellWithReuseIdentifier: Cells.string.SeasconCollectionCell)
                
    }
    
}

extension SeasonSelectionCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return numberofRows
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 90)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell : SeasconCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.string.SeasconCollectionCell, for: indexPath) as? SeasconCollectionCell else{return UICollectionViewCell()}
        
        if previousSelectedIndex == indexPath {
            cell.isSeasonSelected = true
        }
        cell.lblTitle.text = "Season \(indexPath.row + 1)"
        
        if indexPath.row == numberofRows - 1 {
            cell.dividerView.isHidden = true
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell : SeasconCollectionCell  = collectionView.cellForItem(at: indexPath) as? SeasconCollectionCell else{return}
        
        cell.isSeasonSelected = true

        if previousSelectedIndex == indexPath {return}
        
        guard let previousCell : SeasconCollectionCell  = collectionView.cellForItem(at: previousSelectedIndex) as? SeasconCollectionCell else{return}
        
        previousCell.isSeasonSelected = false
        previousSelectedIndex = indexPath
        
        
    }
    
    
    
}
