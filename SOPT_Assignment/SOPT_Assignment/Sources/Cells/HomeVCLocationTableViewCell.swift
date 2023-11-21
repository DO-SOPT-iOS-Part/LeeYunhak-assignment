//
//  LocationTableViewCell.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/7/23.
//

import UIKit
import SnapKit
import Then

final class HomeVCLocationTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier: String = "HomeVCLocationTableViewCell"
    
    private let backgroundImageView = UIImageView()
    private let titleLabel = UILabel()
    private let locationLabel = UILabel()
    private let weatherLabel = UILabel()
    private let tempuratureLabel = UILabel()
    private let tempuratureHighLabel = UILabel()
    private let tempuratureLowLabel = UILabel()
    
    
    // MARK: - Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - @Functions
    // 전체 세팅
    private func setUI() {
        setStyle()
        setHierarchy()
        setLayout()
    }

    // UI 세팅
    private func setStyle() {
        self.do {
            $0.backgroundColor = .clear
            $0.selectionStyle = .none
        }
        
        self.contentView.do {
            $0.layer.cornerRadius = 16
        }
        
        backgroundImageView.do {
            $0.image = UIImage(named: "placeListBackground")
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
    private func setLayout() {
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
    
    private func setHierarchy() {
        self.contentView.addSubViews(backgroundImageView)
        
        self.backgroundImageView.addSubViews(
            titleLabel, locationLabel, weatherLabel, tempuratureLabel, tempuratureHighLabel, tempuratureLowLabel
        )
    }
    
    // Cell 간격 조정
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 16, right: 20))
    }
}

extension HomeVCLocationTableViewCell {
    func bindData(data: LocationListData) {
        self.titleLabel.text = data.titleText
        self.locationLabel.text = data.locationText
        self.weatherLabel.text = data.weatherText
        self.tempuratureLabel.text = data.tempuratureText
        self.tempuratureHighLabel.text = data.tempuratureHighText
        self.tempuratureLowLabel.text = data.tempuratureLowText
    }
}
