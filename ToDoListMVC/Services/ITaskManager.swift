//
//  ITaskManager.swift
//  ToDoListMVC
//
//  Created by Антон Заричный on 17.02.2023.
//

/// Проткол ITaskManager
protocol ITaskManager {
	func allTasks() -> [Task]
	func doneTasks() -> [Task]
	func undoneTasks() -> [Task]
	func addTask(task: Task)
	func addTasks(tasks: [Task])
}

extension TaskManager: ITaskManager { }

extension ImportantTask.taskPriority: CustomStringConvertible {
	/// UI Отображение приоритета Task
	var description: String {
		switch self {
		case .low:
			return "!"
		case .medium:
			return "!!"
		case .high:
			return "!!!"
		}
	}
	
	
}
