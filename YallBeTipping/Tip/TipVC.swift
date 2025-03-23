import UIKit

class TipVC: UIViewController {
    static let id = "TipVC"
    
    lazy var barButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "Submit",
            style: .plain,
            target: self,
            action: #selector(didTapBarButton)
        )
        return button
    }()
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var smallTipButton: UIButton!
    @IBOutlet weak var mediumTipButton: UIButton!
    @IBOutlet weak var largeTipButton: UIButton!
    
    @IBOutlet weak var skipButton: UIButton!
    lazy var tipSelections: [UIButton] = [
        smallTipButton,
        mediumTipButton,
        largeTipButton,
        skipButton
    ]
    
    var tipAmount: TipOptions = .small
    
    let items: [MenuItem]
    
    init(coder: NSCoder, items: [MenuItem]) {
        self.items = items
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = barButton
        skipButton.layer.cornerRadius = 15
        stackView.arrangedSubviews.forEach { button in
            button.layer.cornerRadius = 20
        }
        smallTipButton.isSelected = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        let orientation = UIDevice.current.orientation
        
        if orientation.isPortrait {
            stackView.axis = .vertical
        } else {
            stackView.axis = .horizontal
        }
    }
    
    @objc func didTapBarButton() {
        let sb = UIStoryboard(
            name: ReceiptVC.id,
            bundle: nil
        )
        
        let vc = sb.instantiateViewController(
            identifier: ReceiptVC.id
        ) { [unowned self] coder in
            let receiptVC = ReceiptVC(
                coder: coder,
                items: items,
                tip: tipAmount
            )
            return receiptVC
        }
        pushVC(vc)
    }
    
    func deselectButtons() {
        tipSelections.forEach { button in
            button.isSelected = false
        }
    }
    
    @IBAction func didTapSmallTip() {
        deselectButtons()
        smallTipButton.isSelected = true
        tipAmount = .small
    }
    
    @IBAction func didTapMediumTip() {
        deselectButtons()
        mediumTipButton.isSelected = true
        tipAmount = .medium
    }
    
    @IBAction func didTapLargeTip() {
        deselectButtons()
        largeTipButton.isSelected = true
        tipAmount = .large
    }
    
    @IBAction func didTapSkip() {
        deselectButtons()
        skipButton.isSelected = true
        tipAmount = .none
    }
}
