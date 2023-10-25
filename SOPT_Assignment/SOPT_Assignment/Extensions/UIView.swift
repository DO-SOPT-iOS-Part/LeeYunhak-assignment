//
//  UIView.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 10/26/23.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}