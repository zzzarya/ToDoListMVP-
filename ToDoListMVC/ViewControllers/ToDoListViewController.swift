//
//  todoListViewController.swift
//  ToDoListMVC
//
//  Created by Антон Заричный on 12.02.2023.
//

import UIKit
/// Проткол IToDoListView
protocol IToDoListView: AnyObject{
	func render(viewData: ViewData)
}
/// Проткол IToDoListViewController
protocol IToDoListViewController: AnyObject {
	func updateTable() 
}

final class ToDoListViewController: UITableViewController {
	private var presenter: IToDoListPresenter!
	private var viewData = ViewData()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter = ToDoListPresenter(view: self, viewData: viewData)
		presenter.setup()
		render(viewData: viewData)
	}
}
// MARK: - Extensions
extension ToDoListViewController {
	override func numberOfSections(in tableView: UITableView) -> Int {
		viewData.numberOfSections ?? 0
		//presenter.setNumberOfSections()
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		presenter.setTitleForHeaderInSection(section: section)
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		presenter.setNumberOfRowsInSection(section: section)
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
		cell.delegate = self
		
		let task = presenter.getTasksForIndex(indexPath: indexPath)
		
		cell.configure(with: task, cellIndex: indexPath.row)
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

extension ToDoListViewController: IToDoListViewController {
	/// Обновление таблицы
	func updateTable() {
		tableView.reloadData()
	}
}

extension ToDoListViewController: IToDoListView {
	func render(viewData: ViewData) {
		
	}
}
