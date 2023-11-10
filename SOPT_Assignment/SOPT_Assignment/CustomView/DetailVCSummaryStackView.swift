//
//  DetailVCSummaryStackView.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/10/23.
//

import UIKit
import SnapKit
import Then

final class DetailVCSummaryStackView: UIView {
    
    private let summaryStackView = UIStackView()
    private let locationLabel = UILabel()
    private let temperatureLabel = UILabel()
    private let weatherLabel = UILabel()
    private let temperatureRangeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStyle()
        setupLayout()
    }
    
    func setupStyle() {
        summaryStackView.setupStyle {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 4
        }
        
        locationLabel.setupStyle {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Regular", size: 36),
                text: "의정부시"
            )
        }
        
        temperatureLabel.setupStyle {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Thin", size: 102),
                text: "21°"
            )
        }
        
        weatherLabel.setupStyle {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Regular", size: 24),
                text: "흐림"
            )
        }
        
        temperatureRangeLabel.setupStyle {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Medium", size: 20),
                text: "최고:29°  최저:15°"
            )
        }
    }
    
    func setupLayout() {
        self.addSubViews(summaryStackView)
        
        summaryStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        summaryStackView.addArrangedSubViews(
            locationLabel, temperatureLabel, weatherLabel, temperatureRangeLabel
        )
        
        
    }
}
