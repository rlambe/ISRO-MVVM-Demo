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
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getCategories()
    }
    
    // MARK: Private Methods
    
    private func setupUI() {
        title = type(of: self).screenTitle
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func getCategories() {
        categories = CategoryService().getCategories()
        tableView.reloadData()
    }
}

// Extenstion added to implement 'TableViewDelegate & TableViewDataSource' methods.
extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: self).homeCellIdentifier, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = categories[indexPath.row].name
        return cell
    }
    
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
