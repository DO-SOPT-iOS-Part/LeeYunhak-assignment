//
//  DetailVCWeatherForecastHeaderView.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/10/23.
//
import UIKit
import SnapKit
import Then

final class DetailVCWeatherForecastHeader: UITableViewHeaderFooterView {
    
    static let identifier = "DetailVCWeatherForecastHeader"
    
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let imageView = UIImageView()


    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
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
        stackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 5
        }
        
        imageView.do {
            $0.image = .calendar
        }
        
        titleLabel.do {
            $0.setBasic(
                font: UIFont(name: "SFProDisplay-Medium", size: 15),
                text: "10일간의 일기예보", 
                textColor: UIColor(white: 1, alpha: 0.3)
            )
        }
    }
    
    private func setLayout() {
        stackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8)
            $0.verticalEdges.equalToSuperview()
        }
    }
    
    private func setHierarchy() {
        self.addSubViews(stackView)
        stackView.addArrangedSubViews(imageView, titleLabel)
    }
}
