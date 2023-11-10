//
//  DetailVCWeatherForecastView.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/10/23.
//

import UIKit
import SnapKit
import Then

final class DetailVCWeatherForecastView: UIView {
    
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
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
        setupTableView()
    }
    
    private func setupStyle() {
        self.do {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.3)
            $0.layer.cornerRadius = 15
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor(white: 1, alpha: 0.25).cgColor
        }
        
        tableView.do {
            $0.backgroundColor = .clear
            $0.rowHeight = 55
            $0.isScrollEnabled = false
        }
        
    }

    private func setupLayout() {
        self.addSubViews(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupTableView() {
        self.tableView.register(DetailVCWeatherForecastTableViewCell.self, forCellReuseIdentifier: DetailVCWeatherForecastTableViewCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension DetailVCWeatherForecastView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WeatherForecastData.dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailVCWeatherForecastTableViewCell.identifier, for: indexPath) as? DetailVCWeatherForecastTableViewCell else {return UITableViewCell()}
        cell.bindData(data: WeatherForecastData.dummyData[indexPath.row])
        
        return cell
    }
}
