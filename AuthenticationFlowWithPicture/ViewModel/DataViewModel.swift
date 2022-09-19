//
//  DataViewModel.swift
//  AuthenticationFlowWithPicture
//
//  Created by Berkay Disli on 19.09.2022.
//

import Foundation

class DataViewModel: ObservableObject {
    @Published var selectedCategory: Categories = .top
    @Published var imageSelection: SlideshowImages = .slide1

    
    func selectCategory(category: Categories) {
        selectedCategory = category
    }
}


enum SlideshowImages: String, CaseIterable {
    case slide1, slide2, slide3
}
