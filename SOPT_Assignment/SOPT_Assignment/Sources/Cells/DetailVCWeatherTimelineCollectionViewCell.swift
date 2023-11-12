//
//  WeatherTimelineCollectionViewCell.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/10/23.
//

import UIKit
import SnapKit
import Then

final class DetailVCWeatherTimelineCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String = "DetailVCWeatherTimelineCollectionViewCell"
    
    private let weatherStateStackView = UIStackView()
    private let timeLabel = UILabel()
    private let weatherIcon = UIImageView()
    private let temperatureLabel = UILabel()
    
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
        weatherStateStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 14
        }
        
        timeLabel.do {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 17),
                text: "Now"
            )
        }
        
        weatherIcon.do {
            $0.image = .cloudBolt
        }
        
        temperatureLabel.do {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 22),
                text: "21°"
            )
        }
    }
    
    private func setLayout() {
        weatherStateStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    private func setHierarchy() {
        self.addSubViews(weatherStateStackView)
        
        weatherStateStackView.addArrangedSubViews(
            timeLabel, weatherIcon, temperatureLabel
        )
    }
}

extension DetailVCWeatherTimelineCollectionViewCell {
    func bindData(data: WeatherState) {
        self.timeLabel.text = data.timeText
        self.weatherIcon.image = UIImage(named: data.weatherimageName)
        self.temperatureLabel.text = "\(data.temperature)°"
    }
}
