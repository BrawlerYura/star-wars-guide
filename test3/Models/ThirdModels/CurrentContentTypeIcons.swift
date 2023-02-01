//
//  CurrentContentTypeIcons.swift
//  test3
//
//  Created by Admin on 01.02.2023.
//

import Foundation

var contentType  = ""


func selectChoosedContentType (choosedContentType: String) {
    contentType = choosedContentType
}



func loadContentToCollectionView(contentIconsPeoples: Peoples) {
    defaultPeoples = contentIconsPeoples
    defaultPeople = contentIconsPeoples.results ?? defaultPeople
}

func loadContentToCollectionView(contentIconsFilms: Films) {
    
}
