//
//  HomeMenuController.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 18/09/2023.
//

import UIKit

class HomeMenuController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        // Do any additional setup after loading the view.
    }
    
    private func configUI(){
        view.backgroundColor = .systemBackground
    }
    
    private func configCollectionView() {
        collectionView.register(ItemHomeMenuCell.self, forCellWithReuseIdentifier: ItemHomeMenuCell.reuseIdentifier)
    }


}

extension HomeMenuController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemHomeMenuCell.reuseIdentifier, for: indexPath) as? ItemHomeMenuCell
        else { return UICollectionViewCell()}
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
}
