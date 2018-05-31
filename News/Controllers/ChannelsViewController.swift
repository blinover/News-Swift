//
//  ChannelsViewController.swift
//  News
//
//  Created by Danil Blinov on 27.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import UIKit
import SVProgressHUD

class ChannelsViewController: TableViewController {

    private var sources = [Source]()
    
    override func setupViewController() {
        super.setupViewController()
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createStructure()
    }

    override func createStructure() {
        super.createStructure()
        var sourcesModels = [SourceCellModel]()
        
        for source in sources {
            let sourceModel = SourceCellModel(source: source)
            
            sourceModel.onClickFavorite = {[unowned self](model: SourceCellModel, source: Source) -> Void in    
                model.isFavorite = !model.isFavorite
                self.handleClickOnSource(source)
            }
            sourcesModels.append(sourceModel)
        }
        tableViewStructureDelegates.sectionsRowsArray = [sourcesModels]
        tableView.reloadData()
    }
    
    private func loadData() {
        SVProgressHUD.show()
        
        sources = RealmManager.shared.fetchCachedSources()
        if sources.count > 0 {
            SVProgressHUD.dismiss()
        }
        
        NetworkService.getSources { [unowned self] (result) in
            SVProgressHUD.dismiss()
            switch result {
            case .success(let sources):
                self.sources = sources
                self.createStructure()
                RealmManager.shared.updateCachedSource(sources)
            case .failure(let error):
                self.showAlert(title: "ERROR", subtitle: error.localizedDescription, confirmation: nil)
            }
        }
        
        createStructure()
    }
    
    private func handleClickOnSource(_ source: Source) {
        let sourceData = RealmManager.shared.isSourceInFavorites(source)
        if sourceData.favorite {
            RealmManager.shared.delete(sourceData.source!)
        } else {
            let newSource = Source(source: source)
            newSource.isFavorite = true
            RealmManager.shared.add(newSource)
        }
    }
}
