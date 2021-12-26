//
//  SpacecraftsViewModel.swift
//  ISROApp
//
//  Created by Rushikesh Lambe on 26/12/2021.
//

protocol SpacecraftsViewModelDelegate: AnyObject {
    func onSucees()
    func onFailure(error: Error)
}

class SpacecraftsViewModel {
    
    private(set) var itemViewModels = [SpacecraftItemViewModel]()
    private let service: SpacecraftsServiceProtocol!
    weak var delegate: SpacecraftsViewModelDelegate?
    
    init(service: SpacecraftsServiceProtocol) {
        self.service = service
    }
    
    func getSpacecrafts() {
        service.getSpacecrafts { result in
            switch result {
            case .success(let response):
                self.itemViewModels =  response.map{ SpacecraftItemViewModel(spacecraft: $0)}
                self.delegate?.onSucees()
            case .failure(let error):
                self.delegate?.onFailure(error: error)
            }
        }
    }
}
