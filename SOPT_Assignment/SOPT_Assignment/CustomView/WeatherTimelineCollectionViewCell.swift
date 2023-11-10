//
//  WeatherTimelineCollectionViewCell.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/10/23.
//

import UIKit
import SnapKit
import Then

final class WeatherTimelineCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String = "WeatherTimelineCollectionViewCell"
    
    private let weatherStateStackView = UIStackView()
    private let timeLabel = UILabel()
    private let weatherIcon = UIImageView()
    private let temperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        weatherStateStackView.setupStyle {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 14
        }
        
        timeLabel.setupStyle {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 17),
                text: "Now"
            )
        }
        
        weatherIcon.setupStyle {
            $0.image = .cloudBolt
        }
        
        temperatureLabel.setupStyle {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 22),
                text: "21°"
            )
        }
        
    }
    
    private func setupLayout() {
        self.addSubViews(weatherStateStackView)
        
        weatherStateStackView.addArrangedSubViews(
            timeLabel, weatherIcon, temperatureLabel
        )
        
        weatherStateStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
        }

    }
    
    func bindData(data: WeatherState) {
        self.timeLabel.text = data.timeText
        self.weatherIcon.image = UIImage(named: data.weatherimageName)
        self.temperatureLabel.text = "\(data.temperature)°"
    }
}
