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
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setUI() {
        setStyle()
        setHierarchy()
        setLayout()
    }
    private func setStyle() {
        self.do {
            $0.addTopBorder(with: UIColor(white: 1, alpha: 0.3), andWidth: 0.4)
            $0.backgroundColor = UIColor(hexCode: "#2A3040")
        }
        
        indexStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 4
        }
        
        mapButton.do {
            $0.setImage(.map, for: .normal)
        }
        
        backMenuButton.do {
            $0.setImage(.listBullet, for: .normal)
        }
        
        currentButton.do {
            $0.setImage(.paperPlane, for: .normal)
        }
        
        nextButton.do {
            $0.setImage(.dot, for: .normal)
        }
    }
    
    private func setLayout() {
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
    private func setHierarchy() {
        self.addSubViews(
            mapButton, indexStackView, backMenuButton
        )
        indexStackView.addArrangedSubViews(
            currentButton, nextButton
        )
    }
}
