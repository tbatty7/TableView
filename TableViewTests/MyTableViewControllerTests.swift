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
    
    func test_cellForRowAt_withRow0_shouldSetCellLabelToOne() {
        let viewController = setUpViewController()
        
        let cell = cellForRow(in: viewController.tableView, row: 0)
        XCTAssertEqual(cell?.textLabel?.text, "One")
    }

    func test_cellForRowAt_withRow1_shouldSetCellLabelToTwo() {
        let viewController = setUpViewController()
        
        let cell = cellForRow(in: viewController.tableView, row: 1)
        XCTAssertEqual(cell?.textLabel?.text, "Two")
    }
    
    func test_cellForRowAt_withRow2_shouldSetCellLabelToThree() {
        let viewController = setUpViewController()
        
        let cell = cellForRow(in: viewController.tableView, row: 2)
        XCTAssertEqual(cell?.textLabel?.text, "Three")
    }
    
    private func numberOfRows(in tableView: UITableView, section: Int = 0) -> Int? {
        tableView.dataSource?.tableView(tableView, numberOfRowsInSection: section)
    }
    
    fileprivate func cellForRow(in tableView: UITableView, row: Int, section: Int = 0) -> UITableViewCell? {
        return tableView.dataSource?.tableView(tableView, cellForRowAt: IndexPath(row: row, section: section))
    }
    
    private func setUpViewController() -> MyTableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: MyTableViewController = storyboard.instantiateViewController(identifier: String(describing: MyTableViewController.self))
        viewController.loadViewIfNeeded()
        
        return viewController
    }
}
