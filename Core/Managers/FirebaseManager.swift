//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import FirebaseCore

class FirebaseManager
{
    static var shared = FirebaseManager()
    private init() { }
    
    func start()
    {
        FirebaseApp.configure()
    }
}
