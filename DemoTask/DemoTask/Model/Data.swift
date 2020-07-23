//
//  Data.swift
//  DemoTask
//
//  Created by Sawka Ostap on 17.07.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


struct NetworkingManager {
    static func fetchData(completion: @escaping (([MainDrinks.Drink]) -> Void)) {
            guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Beer") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let drinksResult = try! JSONDecoder().decode(MainDrinks.self, from: data)
            completion(drinksResult.drinks)
        }.resume()
    }
}

class ContentViewModel: ObservableObject {
    @Published var drinks: [MainDrinks.Drink] = []
    
    func fetchDrink() {
        NetworkingManager.fetchData { (drinks) in
            DispatchQueue.main.async {
                self.drinks = drinks
            }
        }
    }
}


class ImageLoader: ObservableObject {
    @Published var downloadedData: Data?
    
    func downloadImage(url: String) {
        guard let imageUrl = URL(string: url) else { return }
        URLSession.shared.dataTask(with: imageUrl) { (data, _, error) in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
}




