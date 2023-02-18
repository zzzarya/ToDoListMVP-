//
//  Tasks.swift
//  ToDoListMVC
//
//  Created by Антон Заричный on 14.02.2023.
//
import Foundation
/// Класс Task
class Task {
	/// Заголовок
	let title: String
	/// Готовность Task
	var isCompleted: Bool
	
	init(title: String, isCompleted: Bool) {
		self.title = title
		self.isCompleted = isCompleted
	}
}

/// Класс RegularTask
final class RegularTask: Task { }

/// Класс ImportantTask
final class ImportantTask: Task {
	enum taskPriority: Int {
		case low
		case medium
		case high
	}
	/// Крайняя дата выполнения Task
	var deadline: Date? {
		switch priority {
		case .low:
			return Calendar.current.date(byAdding: .day, value: 3, to: Date())
		case .medium:
			return Calendar.current.date(byAdding: .day, value: 2, to: Date())
		case .high:
			return Calendar.current.date(byAdding: .day, value: 1, to: Date())
		}
	}
	/// Приоритет Task
	var priority: taskPriority
	
	init(title: String, isCompleted: Bool, priority: taskPriority) {
		self.priority = priority
		super.init(title: title, isCompleted: isCompleted)
		
	}
}
