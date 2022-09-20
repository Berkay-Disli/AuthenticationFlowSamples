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
    @Published var newsSelection: ScrollableNews = .new1
    
    @Published var altImageSelection: SlideshowImages = .slide2
    @Published var altNewsSelection: ScrollableNews = .new2

    
    func selectCategory(category: Categories) {
        selectedCategory = category
    }
}


enum SlideshowImages: String, CaseIterable {
    case slide1, slide2, slide3
}

enum ScrollableNews: String, CaseIterable {
    case new1, new2, new3
    
    var title: String {
        switch self {
        case .new1:
            return "Pence's comments are encouraging, says Jan. 6 panel lawmaker"
        case .new2:
            return "UnitedHealth, Amazon among bidders for Signify Health, reports say"
        case .new3:
            return "Rep. Adam Schiff says he was 'encouraged to hear' that Pence might testify"
        }
    }
    
    var publisher: String {
        switch self {
        case .new1:
            return "Reuters"
        case .new2:
            return "Business Insider"
        case .new3:
            return "Audacy"
        }
    }
    
    var country: String {
        switch self {
        case .new1:
            return "UK"
        case .new2:
            return "UK"
        case .new3:
            return "US"
        }
    }
}
