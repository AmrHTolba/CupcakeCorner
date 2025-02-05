//
//  Validation-Textfield.swift
//  CupcakeCorner
//
//  Created by Amr El-Fiqi on 05/02/2025.
//

import Foundation
import SwiftUI

enum ValidationType {
    case name, city, streetAddress, zipCode
    
    var regex: String {
        switch self{
        case .name, .city:
            return "^(?!\\s*$)[A-Za-z\\s]{2,10}$"
        case .streetAddress:
            return "^(?!\\s*$)[A-Za-z0-9\\s]{5,100}$"
        case .zipCode:
            return "^[0-9]{4,10}$"
        }
    }
        
    var errorMessage: String {
        switch self {
            case .name: return "Invalid name. Only letters and spaces allowed."
            case .city: return "Invalid city name. Only letters and spaces allowed."
            case .streetAddress: return "Invalid street address. Min 5 characters."
            case .zipCode: return "Invalid zip code. Only numbers allowed."
        }
    }
}

extension TextField {
    func validate(_ text: Binding<String>, type: ValidationType) -> some View {
        self.overlay(
            VStack {
                if !text.wrappedValue.isEmpty && !text.wrappedValue.matches(type.regex){
                    Text(type.errorMessage)
                        .foregroundColor(.red)
                        .font(.system(size: 7))
                }
            },alignment: .bottomTrailing
        )
        
    }
}

extension String {
    func matches(_ regex: String) -> Bool {
        guard !self.isEmpty else { return false }
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
}
