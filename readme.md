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

<style>
  .table-container {
    display: flex;
    justify-content: space-between;
  }
  .table-container td {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 23%;
  }
  .table-container img {
    height: 150px; /* Set a fixed height for images */
    width: auto;
  }
  .table-container p {
    height: 50px; /* Set a fixed height for paragraphs */
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0;
  }
</style>

<div class="table-container">
  <table>
    <tr>
      <td>
          <p align="center"><strong>Home VC</strong></p>
          <img src="https://raw.githubusercontent.com/jatinnegi/YallBeTipping/refs/heads/main/assets/home-view-img.png" alt="Placeholder 1" width="100%">
      </td>
      <td>
          <p align="center"><strong>Confirm VC</strong></p>
          <img src="https://raw.githubusercontent.com/jatinnegi/YallBeTipping/refs/heads/main/assets/confirm-view-img.png" alt="Placeholder 2" width="100%">
      </td>
      <td>
          <p align="center"><strong>Tip VC</strong></p>
          <img src="https://raw.githubusercontent.com/jatinnegi/YallBeTipping/refs/heads/main/assets/tip-view-img.png" alt="Placeholder 3" width="100%">
      </td>
      <td>
          <p align="center"><strong>Receipt VC</strong></p>
          <img src="https://raw.githubusercontent.com/jatinnegi/YallBeTipping/refs/heads/main/assets/receipt-view-img.png" alt="Placeholder 4" width="100%">
      </td>
    </tr>
  </table>
</div>
