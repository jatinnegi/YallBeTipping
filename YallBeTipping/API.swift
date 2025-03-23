import Foundation

class API {
    static let shared = API()
    private init() {
        
    }
    
    func fetchData() -> [MenuItem] {
        return [
            MenuItem(name: "Burger", price: 335, img: "burger"),
            MenuItem(name: "Chow Mein", price: 125, img: "chowMein"),
            MenuItem(name: "Dumplings", price: 180, img: "dumplings"),
            MenuItem(name: "Fried Chicken", price: 220, img: "friedChicken"),
            MenuItem(name: "Pizza", price: 380, img: "pizza"),
            MenuItem(name: "Spaghetti", price: 435, img: "spaghetti"),
            MenuItem(name: "Steak", price: 880, img: "steak"),
            MenuItem(name: "Sushi", price: 1250.50, img: "sushi"),
        ]
    }
}
