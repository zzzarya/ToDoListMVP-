//
//  IToDoListView.swift
//  ToDoListMVC
//
//  Created by Антон Заричный on 18.02.2023.
//

import Foundation

/// Протокол IToDoListPresenter для презентера ToDoListPresenter
protocol IToDoListPresenter {
	init(view: IToDoListView, viewData: ViewData)
	
	func setup()
	func getTasksForIndex(indexPath: IndexPath) -> Task
	func setNumberOfSections() -> Int
	func setTitleForHeaderInSection(section: Int) -> String
	func setNumberOfRowsInSection(section: Int) -> Int
}

/// Презентер - ToDoListPresenter
class ToDoListPresenter: IToDoListPresenter {
	private unowned let view: IToDoListView
	private var viewData: ViewData
	
	private var taskManager: ITaskManager!
	private var sectionForTaskManager: ISectionForTaskManagerAdapter!
	
	required init(view: IToDoListView, viewData: ViewData) {
		self.view = view
		self.viewData = viewData
	}
	/// Наполнение TaskManager
	func setup() {
		taskManager = SortedTaskManager(taskManager: TaskManager())
		let mockTasks: ITaskRepository = MockTasks()
		taskManager.addTasks(tasks: mockTasks.getTasks())
		
		sectionForTaskManager = SectionForTaskManagerAdapter(taskManager: taskManager)
	}
	/// Выбор Task
	func getTasksForIndex(indexPath: IndexPath) -> Task {
		sectionForTaskManager.getTasksForSection(section: indexPath.section)[indexPath.row]
	}
	/// Количество секций
	func setNumberOfSections() -> Int {
		sectionForTaskManager.getSectionTitles().count
	}
	/// Заголовки для секций
	func setTitleForHeaderInSection(section: Int) -> String {
		sectionForTaskManager.getSectionTitles()[section]
	}
	/// Количество строк в секции
	func setNumberOfRowsInSection(section: Int) -> Int {
		sectionForTaskManager.getTasksForSection(section: section).count
	}
}
