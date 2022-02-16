@testable import TableView
import XCTest

final class MyTableViewControllerTests: XCTestCase {

    func test_tableViewDelegates_shouldBeConnected() throws {
        let viewController = setUpViewController()
        
        XCTAssertNotNil(viewController.tableView.dataSource, "DataSource")
        XCTAssertIdentical(viewController.tableView.dataSource.self, viewController.self, "DataSource same")
        XCTAssertTrue(viewController.tableView.dataSource.self === viewController.self, "DataSource same 2")

        XCTAssertNotNil(viewController.tableView.delegate, "Delegate")
        XCTAssertIdentical(viewController.tableView.delegate.self, viewController.self, "Delegate same)")
    }
    
    func test_numberOfRows_shouldBeCountOfItemsInModel() {
        let viewController = setUpViewController()
        viewController.model = ["One", "Two", "Three", "Four"]
        viewController.loadViewIfNeeded()
        
        XCTAssertEqual(numberOfRows(in: viewController.tableView), viewController.model.count)
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
    
    func test_didSelectRow_withRow1() {
        let viewController = setUpViewController()
        
        didSelectRow(in: viewController.tableView, row: 1)
        
        #warning("Should assert something here")
    }
    
    private func numberOfRows(in tableView: UITableView, section: Int = 0) -> Int? {
        tableView.dataSource?.tableView(tableView, numberOfRowsInSection: section)
    }
    
    private func cellForRow(in tableView: UITableView, row: Int, section: Int = 0) -> UITableViewCell? {
        return tableView.dataSource?.tableView(tableView, cellForRowAt: IndexPath(row: row, section: section))
    }
    
    private func didSelectRow(in tableView: UITableView, row: Int, section: Int = 0) {
        tableView.delegate?.tableView?(tableView, didSelectRowAt: IndexPath(row: row, section: section))
    }
    
    private func setUpViewController() -> MyTableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: MyTableViewController = storyboard.instantiateViewController(identifier: String(describing: MyTableViewController.self))
        viewController.loadViewIfNeeded()
        
        return viewController
    }
}
