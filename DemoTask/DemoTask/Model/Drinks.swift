//
//  Drinks.swift
//  DemoTask
//
//  Created by Sawka Ostap on 17.07.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct MainDrinks: Decodable {
    let drinks: [Drink]
    struct Drink: Decodable & Identifiable {
        let strDrink: String
        let strDrinkThumb: String
        let id: String
        
        enum CodingKeys: String, CodingKey {
            case strDrink
            case strDrinkThumb
            case id = "idDrink"
            
        }
    }
}


