import UIKit

class ReceiptItemRow: UITableViewCell {
    static let id = "ReceiptItemRow"

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(item: MenuItem) {
        nameLabel.text = item.name
        countLabel.text = "\(item.count)"
        
        let count: Double = Double(item.count)
        let total = item.price * count
        priceLabel.text = total.toCurrency()
    }
}
