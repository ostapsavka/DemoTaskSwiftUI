//
//  URLImage.swift
//  DemoTask
//
//  Created by Sawka Ostap on 21.07.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import SwiftUI

struct URLImage: View {
    let url: String
    @ObservedObject var imageLoader = ImageLoader()
    
    
    init (with urlString: String) {
        self.url = urlString
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable().frame(width: 100, height: 100)
        } else {
            return Image(systemName: "photo").resizable().frame(width: 100, height: 100)
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(with: "https://bipbap.ru/wp-content/uploads/2017/10/0_8eb56_842bba74_XL-640x400.jpg")
    }
}
