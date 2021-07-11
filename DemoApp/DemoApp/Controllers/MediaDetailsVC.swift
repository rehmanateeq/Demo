//
//  MediaDetailsVC.swift
//  DemoApp
//
//  Created by Ateeq on 7/10/21.
//

import UIKit

class MediaDetailsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = MediaViewModel()
    
    var model : MediaModel?{
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        viewModel.responseCallBack = { [weak self] model in
            self?.model = model
        }
        
        viewModel.loadMediaApi()
    }
    
    
    private func setupTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: Cells.string.MediaHeaderCell, bundle: Bundle.main), forCellReuseIdentifier: Cells.string.MediaHeaderCell)
        
        tableView.register(UINib(nibName: Cells.string.MediaDetailsCell, bundle: Bundle.main), forCellReuseIdentifier: Cells.string.MediaDetailsCell)
        
        tableView.register(UINib(nibName: Cells.string.SeasonCell, bundle: Bundle.main), forCellReuseIdentifier: Cells.string.SeasonCell)
        
        
        tableView.register(UINib(nibName: Cells.string.MediaCell, bundle: Bundle.main), forCellReuseIdentifier: Cells.string.MediaCell)
        
    }
    
}


extension MediaDetailsVC : UITableViewDelegate , UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        numberofSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRows(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0{
            switch indexPath.row {
            case CellType.headerCell.rawValue:
                return 400
            case CellType.detailCell.rawValue:
                return UITableView.automaticDimension
            case CellType.selectionCell.rawValue:
                return 150
            default:
                return UITableView.automaticDimension
            }
        }else{
            return 150
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            switch indexPath.row {
            
            case CellType.headerCell.rawValue:
                return getHeaderCell(indexPath: indexPath)
                
            case CellType.detailCell.rawValue:
                return getMediaDetailCell(indexPath: indexPath)
                
            case CellType.selectionCell.rawValue:
                return getSeasonSelectionCell(indexPath : indexPath)
                
            default:
                return UITableViewCell()
            }
        }else{
            return getMediaCell(indexPath : indexPath)
        }
        
        
        
    }
    
}


extension MediaDetailsVC{
    
    private func numberofSections()-> Int{
        model == nil ? 0 : 2
    }
    
    private func numberOfRows(section : Int )-> Int{
        
        guard let newModel = model else{return 0}
        
        switch section {
        case 0:
            return 3
        case 1:
            return newModel.episodes?.count ?? 0
        default:
            return 0
        }
        
    }
    
    private func getHeaderCell(indexPath : IndexPath)-> UITableViewCell{
        
        guard let cell : MediaHeaderCell = tableView.dequeueReusableCell(withIdentifier: Cells.string.MediaHeaderCell, for: indexPath) as? MediaHeaderCell else{return UITableViewCell()}
        
        if let newModel = model{
            cell.model = newModel
        }
        cell.selectionStyle = .none
        return cell
        
    }
    
    private func getMediaDetailCell(indexPath : IndexPath)-> UITableViewCell{
        
        guard let cell : MediaDetailsCell = tableView.dequeueReusableCell(withIdentifier: Cells.string.MediaDetailsCell, for: indexPath) as? MediaDetailsCell else{return UITableViewCell()}
        
        
        if let newModel = model{
            cell.model = newModel
        }
        
        cell.didTapMore = { [weak self] in
            self?.tableView.beginUpdates()
            self?.tableView.endUpdates()
            
        }
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    private func getSeasonSelectionCell(indexPath : IndexPath)-> UITableViewCell{
        
        guard let cell : SeasonSelectionCell = tableView.dequeueReusableCell(withIdentifier: Cells.string.SeasonCell, for: indexPath ) as? SeasonSelectionCell else{return UITableViewCell()}
        
        cell.selectionStyle = .none
        cell.setupCollectionView(rows: model?.seasonNumber ?? 0)
        
        return cell
        
    }
    
    private func getMediaCell(indexPath : IndexPath)-> UITableViewCell{
        
        guard let cell : MediaCell = tableView.dequeueReusableCell(withIdentifier: Cells.string.MediaCell, for: indexPath ) as? MediaCell else{return UITableViewCell()}
        
        
        if let episode : Episode = model?.episodes?[indexPath.row]{
            cell.model = episode
        }
        

        
        return cell
        
    }
    
}
