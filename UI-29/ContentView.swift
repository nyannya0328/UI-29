//
//  ContentView.swift
//  UI-29
//
//  Created by にゃんにゃん丸 on 2020/11/07.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct Home : View {
    
    
    @State var cordinate = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.335, longitude: -122.0132), latitudinalMeters: 10000, longitudinalMeters: 10000)
    
    
    @State var filters = [
        
        Filter(title: "A", cheked: false),
        Filter(title: "B", cheked: false),
        Filter(title: "C", cheked: false),
        Filter(title: "D", cheked: false),
        Filter(title: "E", cheked: false),
        Filter(title: "F", cheked: false),
        
    ]
    
    @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
            
            Map(coordinateRegion: $cordinate)
                .ignoresSafeArea()
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "slider.vertical.3")
                    .font(.title3)
                    .foregroundColor(.blue)
                    .padding(.vertical,10)
                    .padding(.horizontal,10)
                    .background(Color.white.opacity(0.5))
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                
                
            })
            .padding(.trailing)
            .padding(.top,10)
            
            VStack{
                
                
                
                Spacer()
                
                
                VStack{
                    
                    HStack{
                        
                        Text("search by")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        Spacer()
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Done")
                                .fontWeight(.heavy)
                                .foregroundColor(.green)
                            
                        })
                        
                    }
                    .padding([.horizontal,.top])
                    .padding(.bottom,10)
                    
                    
                    ForEach(filters){filter in
                        
                        cardview(filter: filter)
                        
                        
                        
                    }
                    
                    
                    
                }
                
                .padding(.bottom,10)
                .padding(.bottom,edges?.bottom)
                .padding(.top,10)
                .background(Color.white.clipShape(Coustomshape(cornes: [.topLeft,.topRight])))
                
            }
            .ignoresSafeArea()
            
            
        })
        
        
        
    }
}

struct Coustomshape : Shape {
    var cornes : UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: cornes, cornerRadii: CGSize(width: 35, height: 35))
        
        
        return Path(path.cgPath)
    }
}



struct Filter : Identifiable {
    var id = UUID().uuidString
    var title : String
    var cheked : Bool
}


struct cardview : View {
    
    var filter : Filter
    
    
    
    var body: some View{
        
        HStack{
            
            
            
            Text(filter.title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.red.opacity(0.7))
            
            
            Spacer()
            
            
            ZStack{
                
                Circle()
                    .stroke(Color.gray)
                    .frame(width: 25, height: 25)
                
                
                
            }
        }
        .padding(.horizontal)
        
        
        
    }
}


