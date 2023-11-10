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
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    private func setUI() {
        setupStyle()
        setupLayout()
        setCollectionViewConfig()
    }
    
    private func setupStyle() {
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
        
        collectionView.do {
            let flowLayout = UICollectionViewFlowLayout().then {
                $0.scrollDirection = .horizontal
            }
            $0.setCollectionViewLayout(flowLayout, animated: false)
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    private func setupLayout() {
        self.addSubViews(detailContentView)
        
        detailContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        detailContentView.addSubViews(
            descriptionText, dividerView, collectionView
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
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(dividerView).offset(14)
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview()
        }
        
      
    }
    
    private func setCollectionViewConfig() {
        self.collectionView.register(WeatherTimelineCollectionViewCell.self, forCellWithReuseIdentifier: WeatherTimelineCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}

extension DetailVCWeatherTimelineView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 44, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 22
    }
}

extension DetailVCWeatherTimelineView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return WeatherState.dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherTimelineCollectionViewCell.identifier, for: indexPath) as? WeatherTimelineCollectionViewCell else {return UICollectionViewCell()}
        
        item.bindData(data: WeatherState.dummyData[indexPath.row])
                
        return item
    }
}
