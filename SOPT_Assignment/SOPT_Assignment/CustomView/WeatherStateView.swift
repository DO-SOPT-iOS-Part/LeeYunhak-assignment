//
//  wetherTimeLineView.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 10/26/23.
//

import UIKit
import SnapKit

final class WeatherStateView: UIView {
    
    var timeText: String? = "Now"
    var weatherimageName: String = "cloud.moon"
    var temperature: Int = 21
    
    lazy var weatherStateStackView = UIStackView()
    lazy var timeLabel = UILabel()
    lazy var weatherIcon = UIImageView()
    lazy var temperatureLabel = UILabel()
    
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
        
        weatherStateStackView.setupStyle {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 14
        }
        
        timeLabel.setupStyle {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 17),
                text: timeText
            )
        }
        
        weatherIcon.setupStyle {
            $0.image = UIImage(named: weatherimageName)
        }
        
        temperatureLabel.setupStyle {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 22),
                text: "\(temperature)°"
            )
        }
        
    }
    
    func setupLayout() {
        self.addSubViews(weatherStateStackView)
        
        weatherStateStackView.addArrangedSubViews(
            timeLabel, weatherIcon, temperatureLabel
        )
        
        weatherStateStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
        }

    }
}
