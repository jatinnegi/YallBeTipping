import UIKit

class ConfirmVC: UIViewController {
    
    static let id = "ConfirmVC"
    
    lazy var barButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "Submit",
            style: .plain,
            target: self,
            action: #selector(didTapBarButton)
        )
        return button
    }()
    
    var items: [MenuItem]
    
    @IBOutlet weak var tableView: UITableView!
    
    init(coder: NSCoder, items: [MenuItem]) {
        self.items = items
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Confirm"
        setupTableView()
        navigationItem.rightBarButtonItem = barButton
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            UINib(
                nibName: ConfirmCell.id,
                bundle: nil
            ),
            forCellReuseIdentifier: ConfirmCell.id
        )
    }
    
    @objc func didTapBarButton() {
        let sb = UIStoryboard(
            name: TipVC.id,
            bundle: nil
        )
        
        let vc = sb.instantiateViewController(identifier: TipVC.id) { [unowned self] coder in
            let tipVC = TipVC(coder: coder, items: items)
            return tipVC
        }
        pushVC(vc)
    }
}

extension ConfirmVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConfirmCell.id, for: indexPath) as! ConfirmCell
        
        let idx = indexPath.row
        let item: MenuItem = items[idx]
        
        cell.configure(item: item, indexPath: indexPath)
        cell.delegate = self
        
        return cell
    }
}

extension ConfirmVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}

extension ConfirmVC: ConfirmCellDelegate {
    func didAdd(at indexPath: IndexPath) {
        items[indexPath.row].count += 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func didMinus(at indexPath: IndexPath) {
        items[indexPath.row].count -= 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}
