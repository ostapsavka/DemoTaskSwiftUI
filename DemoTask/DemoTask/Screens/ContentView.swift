//
//  ContentView.swift
//  DemoTask
//
//  Created by Sawka Ostap on 17.07.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.drinks) { i in
                HStack{
                URLImage(with: i.strDrinkThumb)
                Text(i.strDrink)
                }
            }.onAppear {
                self.viewModel.fetchDrink()
                }
            .navigationBarTitle(Text("Drinks"))
        }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
