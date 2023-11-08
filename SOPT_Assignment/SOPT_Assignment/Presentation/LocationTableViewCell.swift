//
//  LocationTableViewCell.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/7/23.
//

import UIKit
import SnapKit
import Then

final class LocationTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier: String = "LocationTableViewCell"
    
    private let backgroundImageView = UIImageView()
    private let cellBackgroundView = UIView()
    private let titleLabel = UILabel()
    private let locationLabel = UILabel()
    private let weatherLabel = UILabel()
    private let tempuratureLabel = UILabel()
    private let tempuratureHighLabel = UILabel()
    private let tempuratureLowLabel = UILabel()
    
    
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
            $0.selectedBackgroundView = cellBackgroundView
        }
        
        self.contentView.do {
            $0.layer.cornerRadius = 16
        }
        
        backgroundImageView.do {
            $0.image = UIImage(named: "placeListBackground")
        }
        
        cellBackgroundView.do {
            $0.backgroundColor = .clear
        }
        
        titleLabel.do {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Bold", size: 24),
                text: "나의 위치"
            )
        }
        
        locationLabel.do {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 17),
                text: "의정부시"
            )
        }
        
        weatherLabel.do {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 16),
                text: "흐림"
            )
        }
        
        tempuratureLabel.do {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Light", size: 52),
                text: "21°"
            )
        }        
        
        tempuratureHighLabel.do {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 15),
                text: "최고:29°"
            )
        }
        
        tempuratureLowLabel.do {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 15),
                text: "최저:15°"
            )
        }
        

    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        self.contentView.addSubViews(backgroundImageView)
        self.backgroundImageView.addSubViews(
            titleLabel, locationLabel, weatherLabel, tempuratureLabel, tempuratureHighLabel, tempuratureLowLabel
        ) 
          
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
       
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(10)
        }
        
        locationLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
        }
        
        weatherLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        tempuratureLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(4)
        }
        
        tempuratureLowLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        tempuratureHighLabel.snp.makeConstraints {
            $0.trailing.equalTo(tempuratureLowLabel.snp.leading).offset(-6)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        
    }
    
    // Cell 간격 조정
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0))
    }
    
    // 데이터 바인딩.
    func bindData(data: LocationListData) {
        self.titleLabel.text = data.titleText
        self.locationLabel.text = data.locationText
        self.weatherLabel.text = data.weatherText
        self.tempuratureLabel.text = data.tempuratureText
        self.tempuratureHighLabel.text = data.tempuratureHighText
        self.tempuratureLowLabel.text = data.tempuratureLowText
        
    }
}
