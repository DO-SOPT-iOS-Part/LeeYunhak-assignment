//
//  DetailViewController.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 10/26/23.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var backgroundImageView = UIImageView()
    private lazy var summaryStackView = UIStackView()
    private lazy var locationLabel = UILabel()
    private lazy var temperatureLabel = UILabel()
    private lazy var weatherLabel = UILabel()
    private lazy var temperatureRangeLabel = UILabel()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        setupLayout()
    }
    
    // MARK: - @IBAction Properties
    
    // MARK: - @Functions
    // UI 세팅 작업
    private func setupStyle() {
        backgroundImageView.setupStyle {
            $0.image = .mainBackground
            $0.contentMode = .scaleAspectFill
        }
        
        summaryStackView.setupStyle {
            $0.axis = .vertical
            $0.alignment = .center
        }
        
        locationLabel.setupStyle {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Regular", size: 36),
                text: "의정부시"
            )
        }
        
        temperatureLabel.setupStyle {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Thin", size: 102),
                text: "21°"
            )
        }
        
        weatherLabel.setupStyle {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Regular", size: 24),
                text: "흐림"
            )
        }
        
        temperatureRangeLabel.setupStyle {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Medium", size: 20),
                text: "최고:29°  최저:15°"
            )
        }
        
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        view.addSubViews(backgroundImageView, summaryStackView)
        summaryStackView.addArrangedSubviews(locationLabel, temperatureLabel, weatherLabel, temperatureRangeLabel)
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        summaryStackView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(34)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
        }
        temperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(42)
        }
        weatherLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(154)
        }
        temperatureRangeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(188)
        }
        
    }
    
}

// MARK: - Extensions

