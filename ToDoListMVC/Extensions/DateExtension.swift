//
//  DateExtension.swift
//  ToDoListMVC
//
//  Created by Антон Заричный on 15.02.2023.
//

import Foundation

extension Date {
	/// Сравнение даты с дедлайном
	func isOverdue(_ deadlineDate: Date?) -> Bool {
		let calendar = Calendar.current
		
		let dlDateComponents = calendar.dateComponents([.day, .month, .year], from: deadlineDate ?? Date())
		let dateComponents = calendar.dateComponents([.day, .month, .year], from: Date())
		
		return calendar.date(from: dateComponents)! > calendar.date(from: dlDateComponents)!
	}
}
