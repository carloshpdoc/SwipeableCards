//
//  ContentView.swift
//  SwipeableCards
//
//  Created by Carlos Henrique Pereira do Carmo on 11/10/22.
//

import SwiftUI

struct ContentView: View {
    @State
    private var users: [User] = [User(id: 0,
                                      firstName: "Sandra",
                                      lastName: "Souza",
                                      start: .red,
                                      end: .green),
                                 User(id: 1,
                                      firstName: "John",
                                      lastName: "Carmo",
                                      start: .green,
                                      end: .orange),
                                 User(id: 2,
                                      firstName: "Luan",
                                      lastName: "Carmo",
                                      start: .blue,
                                      end: .green),
                                 User(id: 3,
                                      firstName: "Luana",
                                      lastName: "Cas",
                                      start: .orange,
                                      end: .purple),
    ]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(users) { user in
                    if user.id > users.maxId - 4 {
                        CardView(user: user, onRemove: { removedUser in
                            users.removeAll {
                                $0.id == removedUser.id
                            }
                        })
                        .animation(.spring(), value: users)
                        .frame(width: users
                            .cardWidth(in: geometry, userId: user.id),
                               height: 400)
                        .offset(x: 0, y: users.cardOffset(userId: user.id))
                    }
                }
            }
        }.padding()
    }
}

extension Array where Element == User {
    var maxId: Int {
        map { $0.id }.max() ?? 0
    }

    func cardOffset(userId: Int) -> Double {
        Double(count - 1 - userId) * 8.0
    }

    func cardWidth(in geometry: GeometryProxy, userId: Int) -> Double {
        geometry.size.width - cardOffset(userId: userId)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
