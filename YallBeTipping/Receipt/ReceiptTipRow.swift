import UIKit

class ReceiptTipRow: UITableViewCell {
    
    static let id = "ReceiptTipRow"
    
    @IBOutlet weak var tipLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(tip: TipOptions) {
        tipLabel.text = tip.toString()
    }
}
