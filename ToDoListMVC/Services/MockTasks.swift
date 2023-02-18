//
//  File.swift
//  ToDoListMVC
//
//  Created by Антон Заричный on 14.02.2023.
//

/// Проткол ITaskRepository для MockTasks
protocol ITaskRepository {
	func getTasks() -> [Task]
}
/// Класс MockTasks
class MockTasks: ITaskRepository {
	/// Наполнение моковыми данными
	func getTasks() -> [Task] {
		[RegularTask(title: "RegularTask1", isCompleted: true),
		 RegularTask(title: "RegularTask2", isCompleted: false),
		 RegularTask(title: "RegularTask3", isCompleted: true),
		 ImportantTask(title: "ImportantTask1", isCompleted: true, priority: .medium),
		 ImportantTask(title: "ImportantTask2", isCompleted: false, priority: .high)]
	}
}
