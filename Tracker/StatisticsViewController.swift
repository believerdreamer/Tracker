//
//  ViewController.swift
//  Tracker
//
//  Created by Архип Семёнов on 07.06.2024.
//

import UIKit

final class StatisticsViewController: UIViewController, UISearchBarDelegate {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        applyConstraints()
        view.backgroundColor = .white
        datePicker.date = Date()
        view.layoutIfNeeded()
        
    }
    
    // MARK: - Private Methods
    
    private func formatDate() -> DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.dateFormat = "dd.mm.yy"
        return formatter
    }
    private func addSubviews() {
        view.addSubview(plusButton)
        view.addSubview(datePicker)
        view.addSubview(largeTitle)
        view.addSubview(searchBar)
        view.addSubview(trackingErrorImage)
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
            searchBar.text = ""
            return true
        }
    
    private func applyConstraints() {
            NSLayoutConstraint.activate([
                datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                datePicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
                
                plusButton.widthAnchor.constraint(equalToConstant: 42),
                plusButton.heightAnchor.constraint(equalToConstant: 42),
                plusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
                plusButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
                
                largeTitle.widthAnchor.constraint(equalToConstant: 254),
                largeTitle.heightAnchor.constraint(equalToConstant: 41),
                largeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                largeTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
                
                searchBar.widthAnchor.constraint(equalToConstant: 343),
                searchBar.heightAnchor.constraint(equalToConstant: 36),
                searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                searchBar.topAnchor.constraint(equalTo: largeTitle.bottomAnchor, constant: 7),
                
                trackingErrorImage.widthAnchor.constraint(equalToConstant: 80),
                trackingErrorImage.heightAnchor.constraint(equalToConstant: 80),
                trackingErrorImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 147),
                trackingErrorImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -148),
                trackingErrorImage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
                
            ])
        }
    
    // MARK: - Visual Components
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Plus Button"), for: .normal)
        button.tintColor = .black
        
        if let imageView = button.imageView {
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 18),
                imageView.heightAnchor.constraint(equalToConstant: 19)
            ])
        }
        return button
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.date = Date()
        return datePicker
    }()
    
    private lazy var largeTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Трекеры"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
    }()
    
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.text = "Поиск"
        search.showsCancelButton = false
        search.delegate = self
        search.searchTextField.textColor = UIColor.gray
        search.setImage(UIImage(), for: .clear, state: .normal)
        search.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        if let searchIconView = search.searchTextField.leftView as? UIImageView {
            searchIconView.image = searchIconView.image?.withRenderingMode(.alwaysTemplate)
            searchIconView.tintColor = UIColor.gray
        }
        return search
    }()
    
    private lazy var trackingErrorImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Tracking Error")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
}
