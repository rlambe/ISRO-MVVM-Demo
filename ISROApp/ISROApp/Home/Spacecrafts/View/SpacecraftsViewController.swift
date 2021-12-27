//
//  SpacecraftsViewController.swift
//  ISROApp
//
//  Created by Rushikesh Lambe on 26/12/2021.
//

import UIKit

// SpacecraftsViewController is designed to show all ISRO's spacecrafts.
class SpacecraftsViewController: UIViewController {

    // MARK: - Constants
    private static let screenTitle = "Spacecrafts"
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableview: UITableView!
    
    // MARK: - Variables
    
    private var spacecraftViewModel: SpacecraftsViewModel
    private var genericTableViewDataSource: GenericTableViewDataSource<SpacecraftTableViewCell, SpacecraftItemViewModel>!
    
    // MARK: - Initializer
    
    init?(coder: NSCoder, spacecraftViewModel: SpacecraftsViewModel) {
        self.spacecraftViewModel = spacecraftViewModel
        super.init(coder: coder)
        self.spacecraftViewModel.delegate = self
        self.spacecraftViewModel.getSpacecrafts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private Methods
    
    private func setupUI() {
        title = type(of: self).screenTitle

        tableview.estimatedRowHeight = 44
        tableview.rowHeight = UITableView.automaticDimension
    }
    
    private func setupTabelViewDataSource() {
        genericTableViewDataSource = GenericTableViewDataSource(cellIdentifier: "\(SpacecraftTableViewCell.self)",
                                                                items: spacecraftViewModel.itemViewModels,
                                                                configureCell: { (cell, item)  in
            cell.bind(viewModel: item)
        })
        
        self.tableview.dataSource = self.genericTableViewDataSource
        self.tableview.reloadData()
    }

}

// Extension added to implement 'SpacecraftsViewModelDelegate' methods.
extension SpacecraftsViewController: SpacecraftsViewModelDelegate {
    func onSucees() {
        setupTabelViewDataSource()
    }
    
    func onFailure(error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
}
