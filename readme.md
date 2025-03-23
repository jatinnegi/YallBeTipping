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

The following are the 4 topics that were covered in this app:

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
