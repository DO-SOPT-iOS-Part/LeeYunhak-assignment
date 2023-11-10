//
//  DetailVCWeatherForecastTableViewCell.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/10/23.
//

import UIKit
import SnapKit
import Then

final class DetailVCWeatherForecastTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier: String = "DetailVCWeatherForecastTableViewCell"
    
    private let dayLabel = UILabel()
    private let stackView = UIStackView()
    private let weatherImage = UIImageView()
    private let percentageLabel = UILabel()
    private let temperatureLowLabel = UILabel()
    private let temperatureLineGraphImage = UIImageView()
    private let temperatureHighLabel = UILabel()
    
    // MARK: - Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - @Functions
    // 전체 세팅
    private func setup() {
        setupUI()
        setupLayout()
    }
    
    // UI 세팅
    private func setupUI() {
        self.do {
            $0.backgroundColor = .clear
        }
        
        dayLabel.do {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 22),
                text: "오늘"
            )
        }
        stackView.do {
            $0.axis = .vertical
            $0.spacing = 0.85
            $0.alignment = .center
        }
        percentageLabel.do {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 15),
                text: "의정부시"
            )
        }
        
        weatherImage.do {
            $0.image = .cloudDrizzleMini
        }
        
        percentageLabel.do {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Semibold", size: 16),
                text: "60%"
            )
            $0.textColor = UIColor(hexCode: "#81CFFA")
        }
        
        temperatureLowLabel.do {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 22),
                text: "15°"
            )
            $0.textColor = UIColor(white: 1, alpha: 0.3)
        }
        
        temperatureLineGraphImage.do {
            $0.image = .temperatureLineGraph1
        }
        
        temperatureHighLabel.do {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 22),
                text: "29°"
            )
        }
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        self.contentView.addSubViews(dayLabel, stackView, temperatureLowLabel, temperatureLineGraphImage, temperatureHighLabel)
        
        stackView.addArrangedSubViews(weatherImage, percentageLabel)
        
        dayLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(16)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(dayLabel.snp.leading)
            $0.trailing.equalTo(temperatureLowLabel.snp.trailing)
            $0.centerY.equalToSuperview()
            
        }
        
        
        temperatureLowLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview().inset(172)
        }
        
        temperatureLineGraphImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.trailing.equalToSuperview().inset(56)
        }
        
        temperatureHighLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview().inset(17)
        }
        
        
    }
    
    // 데이터 바인딩.
    func bindData(data: WeatherForecastData) {
        self.dayLabel.text = data.dayText.rawValue
        self.weatherImage.image = data.weatherImage
        self.percentageLabel.text = data.percentageText
        self.temperatureLowLabel.text = "\(data.tempuratureLowNumber)°"
        self.temperatureLowLabel.text = "\(data.tempuratureHighNumber)°"
        self.temperatureLineGraphImage.image = data.temperatureLineGraphImage
    }
}
