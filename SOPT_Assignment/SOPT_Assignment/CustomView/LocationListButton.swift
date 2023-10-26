//
//  placeListButton.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 10/26/23.
//

import UIKit
import SnapKit

final class LocationListButton: UIView {
    var titleText: String? = "나의 위치"
    var locationText: String? = "의정부시"
    var weatherText: String? = "흐림"
    var tempuratureText: String? = "21°"
    var tempuratureHighText: String? = "최고:29°"
    var tempuratureLowText: String? = "최저:15°"

    @objc private func tab() {
        print("button tapped")
    }
    
    lazy var detailButton = UIButton()
    
    lazy var titleLabel = UILabel()
    lazy var locationLabel = UILabel()
    lazy var weatherLabel = UILabel()
    lazy var tempuratureLabel = UILabel()
    lazy var tempuratureHighLabel = UILabel()
    lazy var tempuratureLowLabel = UILabel()
    
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
        detailButton.setBackgroundImage(UIImage(named: "placeListBackground"), for: .normal)
        //detailButton.addTarget(self, action: #selector(tab), for: .touchUpInside)
        
        titleLabel.setupStyle {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Bold", size: 24),
                text: titleText
            )
        }
        
        locationLabel.setupStyle {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 17),
                text: locationText
            )
        }
        
        weatherLabel.setupStyle {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 16),
                text: weatherText
            )
        }
        
        tempuratureLabel.setupStyle {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Light", size: 52),
                text: tempuratureText
            )
        }
        
        tempuratureLowLabel.setupStyle {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 15),
                text: tempuratureLowText
            )
        }
        
        tempuratureHighLabel.setupStyle {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 15),
                text: tempuratureHighText
            )
        }
        
    }
    
    func setupLayout() {
        self.addSubViews(detailButton)
        
        detailButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        detailButton.addSubViews(
            titleLabel, locationLabel, weatherLabel, tempuratureLabel, tempuratureHighLabel, tempuratureLowLabel
        )
        
        titleLabel.snp.makeConstraints {
            $0.width.equalTo(94)
            $0.height.equalTo(32)
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(10)
        }
        locationLabel.snp.makeConstraints {
            $0.width.equalTo(63)
            $0.height.equalTo(20)
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
        }
        
        weatherLabel.snp.makeConstraints {
            $0.width.equalTo(30)
            $0.height.equalTo(20)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(10)
        }
        tempuratureLabel.snp.makeConstraints {
            //$0.width.equalTo(70)
            $0.height.equalTo(60)
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(4)
        }
        tempuratureLowLabel.snp.makeConstraints {
            //$0.width.equalTo(57)
            $0.height.equalTo(20)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(10)
        }
        tempuratureHighLabel.snp.makeConstraints {
            //$0.width.equalTo(60)
            $0.height.equalTo(20)
            $0.trailing.equalTo(tempuratureLowLabel.snp.leading).offset(-6)
            $0.bottom.equalToSuperview().inset(10)
        }
        
    }
}
