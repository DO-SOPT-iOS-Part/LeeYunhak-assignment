//
//  DetailVCToolBarView.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/10/23.
//

import UIKit
import SnapKit
import Then

final class DetailVCToolBarView: UIView {
    
    let backMenuButton = UIButton()
    private let mapButton = UIButton()
    private let indexStackView = UIStackView()
    private let currentButton = UIButton()
    private let nextButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        self.do {
            $0.addTopBorder(with: UIColor(white: 1, alpha: 0.3), andWidth: 0.4)
            $0.backgroundColor = UIColor(hexCode: "#2A3040")
        }
        
        indexStackView.setupStyle {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 4
        }
        
        mapButton.setupStyle {
            $0.setImage(.map, for: .normal)
        }
        
        backMenuButton.setupStyle {
            $0.setImage(.listBullet, for: .normal)
        }
        
        currentButton.setupStyle {
            $0.setImage(.paperPlane, for: .normal)
        }
        
        nextButton.setupStyle {
            $0.setImage(.dot, for: .normal)
        }
    }
    
    private func setupLayout() {
        self.addSubViews(
            mapButton, indexStackView, backMenuButton
        )
        
        indexStackView.addArrangedSubViews(
            currentButton, nextButton
        )
        
        mapButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.top.equalToSuperview().inset(4)
        }
        
        backMenuButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(9)
            $0.top.equalToSuperview().inset(4)
        }
        
        indexStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.centerX.equalToSuperview()
        }
    }
}
