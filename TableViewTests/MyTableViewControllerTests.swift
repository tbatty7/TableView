@testable import TableView
import XCTest

final class MyTableViewControllerTests: XCTestCase {

    func test_tableViewDelegates_shouldBeConnected() throws {
        let viewController = setUpViewController()
        
        XCTAssertNotNil(viewController.tableView.dataSource, "DataSource")
        XCTAssertNotNil(viewController.tableView.delegate, "Delegate")
    }
    
    func test_numberOfRows_shouldBeThree() {
        let viewController = setUpViewController()
        
        XCTAssertEqual(numberOfRows(in: viewController.tableView), 3)
    }
    
    private func numberOfRows(in tableView: UITableView, section: Int = 0) -> Int? {
        tableView.dataSource?.tableView(tableView, numberOfRowsInSection: section)
    }
    
    private func setUpViewController() -> MyTableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: MyTableViewController = storyboard.instantiateViewController(identifier: String(describing: MyTableViewController.self))
        viewController.loadViewIfNeeded()
        
        return viewController
    }
}
