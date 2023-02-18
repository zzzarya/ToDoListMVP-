//
//  TaskCellTableViewCell.swift
//  ToDoListMVC
//
//  Created by Антон Заричный on 12.02.2023.
//

import UIKit

/// Класс TaskCell
final class TaskCell: UITableViewCell {
	/// Делегат ToDoListViewController
	weak var delegate: IToDoListViewController?
	/// Task
	var task: Task!
	/// Конфигурация ячейки
	func configure(with task: Task, cellIndex: Int) {
		self.task = task
		/// Контент для настройки ячейки
		var content = defaultContentConfiguration()
		
		if let importantTask = task as? ImportantTask {
			content.text = "\(importantTask.priority) \(importantTask.title) \nDeadline: \(formatDeadline(with: importantTask.deadline))"
			
			if Date().isOverdue(importantTask.deadline) {
				content.textProperties.color = .systemPink
			}
		} else {
			content.text = task.title
		}
		
		contentConfiguration = content
		/// Кнопка для ячейки
		let checkButton = UIButton(type: .custom)
		checkButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
		checkButton.setImage(UIImage(systemName: task.isCompleted ? "checkmark.square" : "square"), for: .normal)
		checkButton.tag = cellIndex
		checkButton.addTarget(self, action: #selector(checkBoxPressed), for: .touchUpInside)
		
		accessoryView = checkButton
	}
	
	@objc private func checkBoxPressed(_ sender: UIButton) {
		task.isCompleted.toggle()
		self.delegate?.updateTable()
		sender.setImage(UIImage(systemName: task.isCompleted ? "checkmark.square" : "square"), for: .normal)
	}
	
	private func formatDeadline(with deadline: Date?) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .short
		dateFormatter.timeStyle = .none
		dateFormatter.locale = Locale(identifier: "ru_RU")
		
		return dateFormatter.string(from: deadline ?? Date())
	}
}

