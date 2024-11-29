//
//  NSMutableAttributedString+Color.swift
//  Digio
//
//  Created by Matheus Campos on 29/11/24.
//
import UIKit

extension NSMutableAttributedString {
    /// Change color for the given substring.
    /// - Parameters:
    ///   - textToFind: Substring to change color.
    ///   - color: Color for the substring.
    func setColorForText(textToFind: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
}

extension UILabel {
    /// Set UILabel text with multicolor attributed text.
    /// The substrings found in the text to show in the UILabel will show in the given colors.
    /// - Parameters:
    ///   - text: Text to show in the UILabel.
    ///   - textColors: List of tuple with substrings and it's colors [(String, UIColor)].
    func setColoredLabel(text: String, textColors: [(String, UIColor)]) {
        var string: NSMutableAttributedString = NSMutableAttributedString(string: text)
        for color in textColors {
            string.setColorForText(textToFind: color.0, withColor: color.1)
        }
        self.attributedText = string
    }
}
