import UIKit

protocol HomeTableCellDelegate: AnyObject {
    func didAdd(at indexPath: IndexPath)
    func didMinus(at indexPath: IndexPath)
}

class HomeTableCell: UITableViewCell {
    static let id = "HomeTableCell"
    
    weak var delegate: HomeTableCellDelegate?
    private var indexPath: IndexPath?
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var img: UIImageView!
    
    @IBOutlet private weak var orderStackView: UIStackView!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        img.layer.cornerRadius = 12
        plusButton.layer.cornerRadius = plusButton.frame.height / 2
        minusButton.layer.cornerRadius = minusButton.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(item: MenuItem, indexPath: IndexPath) {
        self.indexPath = indexPath
        nameLabel.text = item.name
        priceLabel.text = item.price.toCurrency()
        img.image = UIImage(named: item.img)
        countLabel.text = "\(item.count)"
        
        if item.count > 0 {
            orderStackView.isHidden = false
        } else {
            orderStackView.isHidden = true
        }
    }
    
    @IBAction private func didTapPlusButton() {
        guard let indexPath else { return }
        delegate?.didAdd(at: indexPath)
    }
    
    @IBAction private func didTapMinusButton() {
        guard let indexPath else { return }
        delegate?.didMinus(at: indexPath)
    }
}
