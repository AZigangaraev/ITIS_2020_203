//
//  ViewControllerViewModel.swift
//  TreeForce
//
//  Created by Albert Ahmadiev on 19.03.2021.
//

import Foundation

enum ValidateError: Error {
	case emptyField
	case notCorrectNumber
	case notNumber
}

class ViewControllerModel {
	func check(stringNumber: String) -> Result<Int, ValidateError> {
		if stringNumber.isEmpty { return .failure(ValidateError.emptyField) }

		if let number = Int(stringNumber) {
			if number > 0 && number < 101 {
				return .success(number)
			} else {
				return .failure(ValidateError.notCorrectNumber)
			}
		} else {
			return .failure(ValidateError.notNumber)
		}
	}
}
