//
//  ChannelsViewController.swift
//  News
//
//  Created by Danil Blinov on 27.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import UIKit

class ChannelsViewController: TableViewController {

    var sources = [Source]()
    
    override func setupViewController() {
        super.setupViewController()
        
        NetworkingManager.shared.getSources { [unowned self] (result) in
            switch result {
            case .success(let sources):
                self.sources = sources
                self.createStructure()
                
            case .failure(let error):
                print(error)
            }
        }
    }

    override func createStructure() {
        super.createStructure()
        var sourcesModels = [SourceCellModel]()
        for source in sources {
            let sourceModel = SourceCellModel(source: source)
            sourcesModels.append(sourceModel)
            
            sourceModel.onClickFavorite = {(source: Source) -> Void in
                if RealmManager.shared.isSourceInFavorites(source) {
                    RealmManager.shared.delete(source)
                } else {
                    RealmManager.shared.add(source)
                }
            }
        }
        tableViewStructureDelegates.sectionsRowsArray = [sourcesModels]
        tableView.reloadData()
    }

}
