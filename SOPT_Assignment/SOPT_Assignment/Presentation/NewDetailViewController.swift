//
//  NewDetailViewController.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/10/23.
//


import UIKit
import SnapKit
import Then

final class NewDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    
    private lazy var backgroundImageView = UIImageView()
    
    private lazy var pageScrollView = UIScrollView()
    private lazy var pageContentView = UIStackView()
    
    private lazy var summaryStackView = UIStackView()
    private lazy var locationLabel = UILabel()
    private lazy var temperatureLabel = UILabel()
    private lazy var weatherLabel = UILabel()
    private lazy var temperatureRangeLabel = UILabel()
    
    private lazy var detailContentView = UIView()
    private lazy var descriptionText = UILabel()
    private lazy var dividerView = UIView()
    private lazy var weatherTimelineScrollView = UIScrollView()
    private lazy var weatherTimelineContentView = UIStackView()
    private lazy var weatherStateViews: [WeatherStateView] = WeatherState.dummyData.map {
        return WeatherStateView(timeText: $0.timeText, weatherimageName: $0.weatherimageName, temperature: $0.temperature)
    }
    
    private let toolbarView = DetailVCToolBarView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        setupLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - @IBAction Properties
    @objc fileprivate func navigationpop() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - @Functions
    // UI 세팅 작업
    private func setupStyle() {
        backgroundImageView.setupStyle {
            $0.image = .mainBackground
            $0.contentMode = .scaleAspectFill
        }
        
        pageScrollView.setupStyle {
            $0.alwaysBounceVertical = true
            $0.showsVerticalScrollIndicator = false
        }
        
        pageContentView.setupStyle {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 44
        }
        
        summaryStackView.setupStyle {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 4
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
        detailContentView.backgroundColor = UIColor(white: 1, alpha: 0.03)
        detailContentView.layer.cornerRadius = 15
        detailContentView.layer.borderWidth = 0.5
        detailContentView.layer.borderColor = UIColor(white: 1, alpha: 0.25).cgColor
        
        descriptionText.setupStyle {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Regular", size: 18),
                text: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
            )
            $0.numberOfLines = 2
        }
        
        dividerView.addTopBorder(with: UIColor(white: 1, alpha: 0.5), andWidth: 0.2)
        
        weatherTimelineScrollView.setupStyle {
            $0.alwaysBounceHorizontal = true
            $0.showsHorizontalScrollIndicator = false
        }
        weatherTimelineContentView.setupStyle {
            $0.axis = .horizontal
            $0.spacing = 22
        }
        
        toolbarView.backMenuButton.do {
            $0.addTarget(self, action: #selector(navigationpop), for: .touchUpInside)
        }
        
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        view.addSubViews(
            backgroundImageView, pageScrollView, toolbarView
        )
        
        pageScrollView.addSubViews(pageContentView)
        pageContentView.addArrangedSubViews(summaryStackView, detailContentView)
        
        summaryStackView.addArrangedSubViews(
            locationLabel, temperatureLabel, weatherLabel, temperatureRangeLabel
        )
        
        detailContentView.addSubViews(
            descriptionText, dividerView, weatherTimelineScrollView
        )
        weatherTimelineScrollView.addSubViews(weatherTimelineContentView)
        weatherStateViews.forEach {
            weatherTimelineContentView.addArrangedSubview($0)
        }
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pageScrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(34)
            $0.bottom.equalTo(toolbarView)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        pageContentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        detailContentView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(212)
        }
        
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
        
        weatherTimelineContentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        toolbarView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(82)
        }
    }
    
}

// MARK: - Extensions

