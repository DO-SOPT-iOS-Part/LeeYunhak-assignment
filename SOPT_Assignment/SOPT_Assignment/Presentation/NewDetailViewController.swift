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

    private let backgroundImageView = UIImageView()
    
    private let pageScrollView = UIScrollView()
    private let pageContentView = UIStackView()
    
    private let summaryStackView = DetailVCSummaryStackView()
    private let weatherTimelineView = DetailVCWeatherTimelineView()
    private let weatherForecastTableView = DetailVCWeatherForecastView()
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
        backgroundImageView.do {
            $0.image = .mainBackground
            $0.contentMode = .scaleAspectFill
        }
        
        pageScrollView.do {
            $0.alwaysBounceVertical = true
            $0.showsVerticalScrollIndicator = false
        }
        
        pageContentView.do {
            $0.axis = .vertical
            $0.alignment = .center
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
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pageScrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(34)
            $0.bottom.equalTo(toolbarView)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        toolbarView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(82)
        }
        
        pageScrollView.addSubViews(pageContentView)
        
        pageContentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        pageContentView.addArrangedSubViews(summaryStackView, weatherTimelineView, weatherForecastTableView)
        summaryStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            //$0.height.equalTo(212)
            $0.horizontalEdges.equalToSuperview()
        }
        
        weatherTimelineView.snp.makeConstraints {
            $0.top.equalTo(summaryStackView).offset(44)
            $0.height.equalTo(212)
            $0.horizontalEdges.equalToSuperview()
        }
        weatherForecastTableView.snp.makeConstraints {
            //$0.top.equalTo(weatherTimelineView.snp.bottom).offset(20)
            $0.height.equalTo(675)
            $0.horizontalEdges.equalToSuperview()
            
        }
    }
    
}

// MARK: - Extensions

