//
//  DetailVCWeatherForecastView.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/10/23.
//

import UIKit
import SnapKit
import Then

final class DetailVCWeatherForecastTableView: UIView {
    
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        setTableViewConfig()
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    private func setStyle() {
        self.do {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.03)
            $0.layer.cornerRadius = 15
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor(white: 1, alpha: 0.25).cgColor
        }
        
        tableView.do {
            $0.sectionHeaderTopPadding = 0
            $0.backgroundColor = .clear
            $0.isScrollEnabled = false
            $0.separatorColor = UIColor(white: 1, alpha: 0.5)
            $0.separatorStyle = .singleLine
            $0.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        }
    }

    private func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setHierarchy() {
        self.addSubViews(tableView)
    }
    
    private func setTableViewConfig() {
        self.tableView.register(DetailVCWeatherForecastTableViewCell.self, forCellReuseIdentifier: DetailVCWeatherForecastTableViewCell.identifier)
        self.tableView.register(DetailVCWeatherForecastHeader.self, forHeaderFooterViewReuseIdentifier: DetailVCWeatherForecastHeader.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension DetailVCWeatherForecastTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WeatherForecastData.dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailVCWeatherForecastTableViewCell.identifier, for: indexPath) as? DetailVCWeatherForecastTableViewCell else {return UITableViewCell()}
        cell.bindData(data: WeatherForecastData.dummyData[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DetailVCWeatherForecastHeader.identifier) as? DetailVCWeatherForecastHeader else {return UIView()}
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38
    }
    
}
