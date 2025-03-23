import UIKit

extension [MenuItem] {
    func calculateTotal(with tip: TipOptions) -> Double {
        let total: Double = self.reduce(0) { partialResult, item in
            let itemTotal: Double = Double(item.count) * item.price
            return partialResult + itemTotal
        }
        return total * tip.rawValue
    }
}

extension Double {
    func toCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        let value = NSNumber(value: self)
        let str = formatter.string(from: value)
        return str ?? "N/A"
    }
}

extension UIViewController {
    func pushVC(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
}
