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
    private let emptyView = UILabel()
    
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
        summaryStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 4
        }
        
        locationLabel.do {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Regular", size: 36),
                text: "의정부시"
            )
        }
        
        temperatureLabel.do {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Thin", size: 102),
                text: "21°"
            )
        }
        
        weatherLabel.do {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Regular", size: 24),
                text: "흐림"
            )
        }
        
        temperatureRangeLabel.do {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Medium", size: 20),
                text: "최고:29°  최저:15°"
            )
        }
    }
    
    private func setLayout() {
        summaryStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
 
        emptyView.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalToSuperview()
        }
    }
    
    private func setHierarchy() {
        self.addSubViews(summaryStackView)
        
        summaryStackView.addArrangedSubViews(
            locationLabel, temperatureLabel, weatherLabel, temperatureRangeLabel, emptyView
        )
    }
}

extension DetailVCSummaryStackView {
    func bindData(data: LocationListData?) {
        guard let locationdata = data else { return }
    
        self.locationLabel.text = locationdata.titleText
        self.temperatureLabel.text = locationdata.tempuratureText
        self.weatherLabel.text = locationdata.weatherText
        self.temperatureRangeLabel.text = "\(locationdata.tempuratureHighText ?? "error")  \(locationdata.tempuratureLowText ?? "error")"
    }
}
