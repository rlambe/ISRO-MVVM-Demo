//
//  SpacecraftsService.swift
//  ISROApp
//
//  Created by Rushikesh Lambe on 26/12/2021.
//

import Foundation
protocol SpacecraftsServiceProtocol {
    func getSpacecrafts(completion: @escaping (Result<[Spacecraft], Error>)-> Void)
}

class SpacecraftsService: SpacecraftsServiceProtocol {
    func getSpacecrafts(completion: @escaping (Result<[Spacecraft], Error>) -> Void) {
        let url = URL(string: "https://isro.vercel.app/api/spacecrafts")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                if let decodedResponse = try? JSONDecoder().decode(SpaceCraftResponse.self, from: data) {
                    completion(.success(decodedResponse.spacecrafts))
                } else {
                    completion(.failure(NSError(domain: "Unknown", code: 0, userInfo: nil)))
                }
            }
        }.resume()
    }
}
