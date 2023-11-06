//
//  UILabel.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 10/26/23.
//

import UIKit

extension UILabel {
    func setBasic (font: UIFont! = .systemFont(ofSize: 10), text: String? = "Test", textColor: UIColor! = .white) {
        self.font = font
        self.text = text
        self.textColor = textColor
    }
    func setupStyle (_ todo: (UILabel) -> ()) {
        todo(self)
    }
}
