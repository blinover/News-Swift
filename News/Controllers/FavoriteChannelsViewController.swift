//
//  FavoriteChannelsViewController.swift
//  News
//
//  Created by Danil Blinov on 27.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import UIKit

class FavoriteChannelsViewController: TableViewController {

    @IBOutlet weak var newsFeedButton: UIBarButtonItem!
    private var sources = [Source]() {
        didSet {
            newsFeedButton.isEnabled = sources.count == 0 ? false : true
        }
    }
    
    override func setupViewController() {
        super.setupViewController()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createStructure()
    }
    
    override func createStructure() {
        super.createStructure()
        sources = RealmManager.shared.fetchFavoriteSources()
        
        var sourcesModels = [SourceCellModel]()
        for source in sources {
            let sourceModel = SourceCellModel(source: source)
            
            sourceModel.onClickFavorite = {[unowned self] (model: SourceCellModel, source: Source) -> Void in
                self.showConfirmationAlert(with: "Delete channel?", subtitle: "Do you want to delete \(source.name) channel?", confirmation: {
                    RealmManager.shared.delete(source)
                    self.createStructure()
                }, cancelation: {
                    self.createStructure()
                })
            }
            sourcesModels.append(sourceModel)
        }
        tableViewStructureDelegates.sectionsRowsArray = [sourcesModels]
        tableView.reloadData()
    }
    
    
    @IBAction func showFavoritesNews(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: Constatns.Storyboards.Main, bundle: Bundle.main)
        let newsViewController = storyboard.instantiateViewController(withIdentifier: Constatns.Controllers.NewsFeedViewController) as! NewsFeedViewController
        newsViewController.sourcesIDs = createSourcesIds()
        
        self.navigationController?.show(newsViewController, sender: self)
    }
    
    private func createSourcesIds() -> [String] {
        var sourcesIds = [String]()
        for source in sources {
            sourcesIds.append(source.id)
        }
        return sourcesIds
    }
}
