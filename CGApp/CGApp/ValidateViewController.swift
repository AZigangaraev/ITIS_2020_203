//
//  ValidateViewController.swift
//  EvelinaCG
//
//  Created by Эвелина on 23.03.2021.
//

import Foundation
enum Validation: Error {
    case emptyField
    case incorrectNumber
    case notNumber
}

class ValidateViewController {
    func checkTheField(stringNumber: String) -> Result<Int, Validation> {
        if stringNumber.isEmpty {
            return .failure(Validation.emptyField) // Если поле пустое, то возвращаем ошибку
        }
        if let number = Int(stringNumber) {
            if number > 0 && number <= 100 { // Диапазон возможных значений
                return .success(number)
            } else {
                return .failure(Validation.incorrectNumber) // Если введено некорректное число, то возвращаем ошибку
            }
        } else {
            return .failure(Validation.notNumber) // Если введено не число, то возвращаем ошибку
        }
    }
}


