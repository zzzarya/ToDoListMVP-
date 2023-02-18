//
//  SortedTaskManager.swift
//  ToDoListMVC
//
//  Created by Антон Заричный on 17.02.2023.
//
/// Класс для сортировки Tasks
final class SortedTaskManager: ITaskManager {
	let taskManager: ITaskManager
	
	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
	/// Все задачи после сортировки
	func allTasks() -> [Task] {
		sorted(tasks: taskManager.allTasks())
	}
	/// Выполненные задачи после сортировки
	func doneTasks() -> [Task] {
		sorted(tasks: taskManager.doneTasks())
	}
	/// Невыполненные задачи после сортировки
	func undoneTasks() -> [Task] {
		sorted(tasks: taskManager.undoneTasks())
	}
	/// Добавление задачи в список задач
	func addTask(task: Task) {
		taskManager.addTask(task: task)
	}
	/// Добавление задач в список задач
	func addTasks(tasks: [Task]) {
		taskManager.addTasks(tasks: tasks)
	}
	
	private func sorted(tasks: [Task]) -> [Task] {
		tasks.sorted{
			if let task0 = $0 as? ImportantTask, let task1 = $1 as? ImportantTask {
				return task0.priority.rawValue > task1.priority.rawValue
			}
			
			if $0 is ImportantTask, $1 is RegularTask {
				return true
			}
			
			if $0 is RegularTask, $1 is ImportantTask {
				return false
			}
			
			return true
		}
	}
}
