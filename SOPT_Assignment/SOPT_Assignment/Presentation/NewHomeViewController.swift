//
//  NewHomeViewController.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/6/23.
//

import UIKit
import Then

class NewHomeViewController: UIViewController {
    
    // MARK: - Properties
    private let navigationTitle = "날씨"
    private let searchBarPlaceHolder = "도시 또는 공항 검색"
    
    var arr = ["Zedd", "Alan Walker", "David Guetta", "Avicii", "Marshmello", "Steve Aoki", "R3HAB", "Armin van Buuren", "Skrillex", "Illenium", "The Chainsmokers", "Don Diablo", "Afrojack", "Tiesto", "KSHMR", "DJ Snake", "Kygo", "Galantis", "Major Lazer", "Vicetone"]
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let tableView = UITableView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - @IBAction Properties
    
    // MARK: - @Functions
    private func setup() {
        setupUI()
        setupTableView()
        setupLayout()
    }
    
    // UI 세팅 작업
    private func setupUI() {
        // view
        self.view.backgroundColor = .black
        
        // navigation Title
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "SFProDisplay-Bold", size: 36) ?? UIFont()
        ]
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = navigationTitle
        self.navigationItem.standardAppearance = appearance
        
        // UISearchController
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: searchBarPlaceHolder,
            attributes: [
                .foregroundColor: UIColor(white: 1, alpha: 0.5),
                .font: UIFont(name: "SFProDisplay-Regular", size: 19) ?? UIFont()
            ]
        )
        searchController.searchBar.searchTextField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        searchController.searchBar.placeholder = searchBarPlaceHolder
        searchController.searchBar.setValue("취소", forKey: "cancelButtonText")
        searchController.searchBar.tintColor = .white
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupTableView() {
        self.tableView.register(
            LocationTableViewCell.self,
            forCellReuseIdentifier: LocationTableViewCell.identifier
        )
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
}

// MARK: - Extensions

extension NewHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LocationListData.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier, for: indexPath) as? LocationTableViewCell else {return UITableViewCell()}
        cell.bindData(data: LocationListData.data[indexPath.row])
        
        return cell
    }
}
