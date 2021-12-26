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

        tableview.dataSource = self
        tableview.estimatedRowHeight = 44
        tableview.rowHeight = UITableView.automaticDimension
    }

}

// Extension is added to implement 'UITableViewDataSource' methods.
extension SpacecraftsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        spacecraftViewModel.itemViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(SpacecraftTableViewCell.self)",
                                                       for: indexPath) as? SpacecraftTableViewCell
        else {
            return UITableViewCell()
        }
        let itemViewModel = spacecraftViewModel.itemViewModels[indexPath.row]
        cell.bind(viewModel: itemViewModel)
        return cell
    }
    
}

// Extension added to implement 'SpacecraftsViewModelDelegate' methods.
extension SpacecraftsViewController: SpacecraftsViewModelDelegate {
    func onSucees() {
        tableview.reloadData()
    }
    
    func onFailure(error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
}
