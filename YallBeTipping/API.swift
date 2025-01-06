//
//  API.swift
//  YallBeTipping
//
//  Created by Jatin Negi on 03/01/25.
//

import Foundation

class API {
    static let shared = API()
    private init() {}
    
    func fetchData() -> [MenuItem] {
        return [
            MenuItem(name: "Burger", price: 320, img: "burger"),
            MenuItem(name: "Chow mein", price: 250, img: "chowMein"),
            MenuItem(name: "Dumplings", price: 200, img: "dumplings"),
            MenuItem(name: "Fried chicken", price: 400, img: "friedChicken"),
            MenuItem(name: "Pizza", price: 350, img: "pizza"),
            MenuItem(name: "Spaghetti", price: 550, img: "spaghetti"),
            MenuItem(name: "Steak", price: 750, img: "steak"),
            MenuItem(name: "Sushi", price: 1050, img: "sushi"),
        ]
    }
}
