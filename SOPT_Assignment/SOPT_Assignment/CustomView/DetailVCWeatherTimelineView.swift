//
//  DetailVC.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/10/23.
//

import UIKit
import SnapKit
import Then

final class DetailVCWeatherTimelineView: UIView {
    
    private let detailContentView = UIView()
    private let descriptionText = UILabel()
    private let dividerView = UIView()
    private let collectionView = UICollectionView()
    
    private let weatherTimelineScrollView = UIScrollView()
    private let weatherTimelineContentView = UIStackView()
    private let weatherStateViews: [WeatherStateView] = WeatherState.dummyData.map {
        return WeatherStateView(timeText: $0.timeText, weatherimageName: $0.weatherimageName, temperature: $0.temperature)
    }
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
        detailContentView.do {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.03)
            $0.layer.cornerRadius = 15
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor(white: 1, alpha: 0.25).cgColor
        }
        
        descriptionText.do {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Regular", size: 18),
                text: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
            )
            $0.numberOfLines = 2
        }
        dividerView.do {
            $0.addTopBorder(with: UIColor(white: 1, alpha: 0.5), andWidth: 0.2)
        }
        
        weatherTimelineScrollView.setupStyle {
            $0.alwaysBounceHorizontal = true
            $0.showsHorizontalScrollIndicator = false
        }
        weatherTimelineContentView.setupStyle {
            $0.axis = .horizontal
            $0.spacing = 22
        }
    }
    
    func setupLayout() {
        self.addSubViews(detailContentView)
        
        detailContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        detailContentView.addSubViews(
            descriptionText, dividerView, weatherTimelineScrollView
        )
        
        descriptionText.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.horizontalEdges.equalToSuperview().inset(15)
        }
        
        dividerView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(1)
            $0.top.equalTo(descriptionText.snp.bottom).offset(11)
            $0.height.equalTo(4)
            $0.leading.equalToSuperview().inset(14)
        }
        
        weatherTimelineScrollView.snp.makeConstraints {
            $0.top.equalTo(dividerView).offset(10)
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview()
        }
        
        weatherTimelineScrollView.addSubViews(weatherTimelineContentView)
        
        weatherTimelineContentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        weatherStateViews.forEach {
            weatherTimelineContentView.addArrangedSubview($0)
        }
    }
}

//extension DetailVCWeatherTimelineView: UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//    
//}
