//
//  TaskManager.swift
//  ToDoListMVC
//
//  Created by Антон Заричный on 12.02.2023.
//

/// Класс TaskManager
final class TaskManager {
	private var taskList: [Task] = []
	/// Добавление задачи в список задач
	func addTask(task: Task) {
		taskList.append(task)
	}
	/// Добавление задач в список задач
	func addTasks(tasks: [Task]) {
		taskList.append(contentsOf: tasks)
	}
	/// Удаление задачи из списка задач
	func deleteTask(task: Task) {
		taskList.removeAll { $0 === task }
	}
	/// Все задачи
	func allTasks() -> [Task] {
		taskList
	}
	/// Выполненные задачи
	func doneTasks() -> [Task] {
		taskList.filter { $0.isCompleted }
	}
	/// Невыполненные задачи
	func undoneTasks() -> [Task] {
		taskList.filter { !$0.isCompleted }
	}
}



