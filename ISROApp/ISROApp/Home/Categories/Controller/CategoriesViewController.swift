//
//  CategoriesViewController.swift
//  ISROApp
//
//  Created by Rushikesh Lambe on 26/12/2021.
//

import UIKit

// This controller is designed for showing ISRO's Services.
class CategoriesViewController: UIViewController {

    // MARK: Constants
    
    private static let screenTitle = "ISRO Services"
    private static let homeCellIdentifier = "HomeTableViewCell"
    
    // MARK: Variables
    
    private var categories: [Category]!
    private var genericTableViewDataSource: GenericTableViewDataSource<UITableViewCell, Category>!
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = type(of: self).screenTitle
        getCategories()
    }
    
    // MARK: Private Methods
    
    private func getCategories() {
        categories = CategoryService().getCategories()
        setupDataSource()
    }
    
    private func setupDataSource() {
        genericTableViewDataSource = GenericTableViewDataSource(cellIdentifier: type(of: self).homeCellIdentifier,
                                                                items: categories,
                                                                configureCell: { (cell, item) in
            cell.textLabel?.text = item.name
        })
        
        self.tableView.delegate = self
        self.tableView.dataSource = self.genericTableViewDataSource
        self.tableView.reloadData()
    }
}

// Extenstion added to implement 'TableViewDataSource' methods.
extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let spacecraftViewModel = SpacecraftsViewModel(service: SpacecraftsService())
            guard let viewController = self.storyboard?.instantiateViewController(identifier: "\(SpacecraftsViewController.self)",
                                                                                  creator: { coder in
                return SpacecraftsViewController(coder: coder, spacecraftViewModel: spacecraftViewModel)
            }) else {
                fatalError("SpacecraftsViewController not found!!!")
            }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
