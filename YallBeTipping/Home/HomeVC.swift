import UIKit

class HomeVC: UIViewController {
    var data: [MenuItem] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupTableView()
    }

    func fetchData() {
        data = API.shared.fetchData()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func didTapCartButton(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(
            name: ConfirmVC.id,
            bundle: nil
        )
        
        let items: [MenuItem] = getMenuItems()
        
        let vc = sb.instantiateViewController(identifier: ConfirmVC.id) { coder in
            let confirmVC = ConfirmVC(coder: coder, items: items)
            return confirmVC
        }
        
        pushVC(vc)
    }
    
    func getMenuItems() -> [MenuItem] {
        return data.filter { item in
            return item.count > 0
        }
    }
} 

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: HomeTableCell.id,
            for: indexPath
        ) as! HomeTableCell
        
        let i = indexPath.row
        let item = data[i]
        
        cell.configure(item: item, indexPath: indexPath)
        cell.delegate = self
        
        return cell
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.row].count += 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}

extension HomeVC: HomeTableCellDelegate {
    func didAdd(at indexPath: IndexPath) {
        data[indexPath.row].count += 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }

    func didMinus(at indexPath: IndexPath) {
        data[indexPath.row].count -= 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}