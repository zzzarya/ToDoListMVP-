//
//  SectionForTaskManagerAdapter.swift
//  ToDoListMVC
//
//  Created by Антон Заричный on 17.02.2023.
//

/// Протокол ISectionForTaskManagerAdapter для класса SectionForTaskManagerAdapter
protocol ISectionForTaskManagerAdapter {
	func getSectionTitles() -> [String]
	func getTasksForSection(section sectionIndex: Int) -> [Task]
}
/// Класс SectionForTaskManagerAdapter
final class SectionForTaskManagerAdapter: ISectionForTaskManagerAdapter {
	private let taskManager: ITaskManager
	
	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
	/// Метод получения названий для секций
	func getSectionTitles() -> [String] {
		["Completed", "Uncompleted"]
	}
	/// Метод получения Tasks для секции
	func getTasksForSection(section sectionIndex: Int) -> [Task] {
		switch sectionIndex {
		case 1:
			return taskManager.undoneTasks()
		default:
			return taskManager.doneTasks()
		}
	}
}
