//
//  contentIcons.swift
//  test3
//
//  Created by Admin on 31.01.2023.
//

import Foundation

struct ContentIcons {
    var images: String
    var titles: String
}

extension ContentIcons {
    static var icons = [
        ContentIcons(images: "Characters", titles: "Characters"),
        ContentIcons(images: "Films", titles: "Films"),
        ContentIcons(images: "Species", titles: "Species"),
        ContentIcons(images: "Starships", titles: "Starships"),
        ContentIcons(images: "Vehicles", titles: "Vehicles"),
        ContentIcons(images: "Planets", titles: "Planets"),
    ]
}
