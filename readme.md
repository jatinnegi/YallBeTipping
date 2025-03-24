# YallBeTipping

This app contains 4 `UIViewController`s embedded inside a `NavigationController`:

1. **Home View Controller:**
    * This is the app's main entry point.
    * Elements used are `UITableView`, `UITableViewCell`, `UILabel` and `UIButton`.
2. **Confirm View Controller:**
    * This is the second UI Controller in the app.
    * Elements used are `UITableView`, `UITableViewCell`, `UILabel` and `UIButton`
3. **Tip View Controller:**
    * This is the third UI Controller in the app.
    * This `UIControllerView` consists only `UIButton`
4. **Receipt View Controller:**
    * This is the last UI Controller in the app
    * Elements used are `UITableView`, `UITableViewCell` and `UILabel`

<table>
  <tr>
    <td width="25%">
      <p align="center"><strong>Home VC</strong></p>
    </td>
    <td width="25%">
      <p align="center"><strong>Confirm VC</strong></p>
    </td>
    <td width="25%">
      <p align="center"><strong>Tip VC</strong></p>
    </td>
    <td width="25%">
      <p align="center"><strong>Receipt VC</strong></p>
    </td>
  </tr>
  <tr>
    <td width="25%">
        <img src="https://raw.githubusercontent.com/jatinnegi/YallBeTipping/refs/heads/main/assets/home-view-img.png" alt="Placeholder 1" width="100%">
    </td>
    <td width="25%">
        <img src="https://raw.githubusercontent.com/jatinnegi/YallBeTipping/refs/heads/main/assets/confirm-view-img.png" alt="Placeholder 2" width="100%">
    </td>
    <td width="25%">
        <img src="https://raw.githubusercontent.com/jatinnegi/YallBeTipping/refs/heads/main/assets/tip-view-img.png" alt="Placeholder 3" width="100%">
    </td>
    <td width="25%">
        <img src="https://raw.githubusercontent.com/jatinnegi/YallBeTipping/refs/heads/main/assets/receipt-view-img.png" alt="Placeholder 4" width="100%">
    </td>
  </tr>
</table>

The 3 main topics that were covered in this app:

1. **`UINavigationController`**
    1. Embed the main entry point of the app inside the `UINavigationController`.
    <img src="https://raw.githubusercontent.com/jatinnegi/YallBeTipping/refs/heads/main/assets/home-vc-entry-point.png" alt="storyboard" width="100%">

    2. Programmatically navigate to other view controllers using `UIBarButtonItem` element.
    
        ```swift
        // Following code programmatically pushes the control to the next view controller
            
        lazy var barButton: UIBarButtonItem = {
            let button = UIBarButtonItem(
                title: "Submit",
                style: .plain,
                target: self,
                action: #selector(didTapBarButton)
            )
            return button
        }()
        
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
        ```
2. **Protocols and Extensions**
    1. Extending a `UIViewController` as `UITableViewDataSource` and `UITableViewDelegate` using `extensions` and `protocol` in Swift. 
    
        ```swift
        extension HomeVC: UITableViewDataSource {
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return data.count
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableCell.id, for: indexPath) as! HomeTableCell
                
                let idx = indexPath.row
                let item: MenuItem = data[idx]
            
                cell.configure(item: item, indexPath: indexPath)
                cell.delegate = self
                
                return cell
            }
        }
        
        extension HomeVC: UITableViewDelegate {
            func tableView(_ tableView: UITableView,  heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 125
            }
            
            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                tableView.deselectRow(at: indexPath, animated: true)
                data[indexPath.row].count += 1
                tableView.reloadRows(at: [indexPath], with: .none)
            }
        }
        ```
    2. In Swift we can even extend native data-types or classes with the help of `extensions`
    
        ```swift
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
        ```

3. **XIB File**
    1. Create re-usable elements/components in Storyboard using `XIB` file.
    <img src="https://raw.githubusercontent.com/jatinnegi/YallBeTipping/refs/heads/main/assets/xib-file-img.png" alt="storyboard" width="100%">
    
    2. We can establish `IBOutlet` and `IBAction` connections from `XIB` file to any `UIElement` to make our element re-usable across the app.
    <img src="https://raw.githubusercontent.com/jatinnegi/YallBeTipping/refs/heads/main/assets/xib-file-code-img.png" alt="storyboard" width="100%">
