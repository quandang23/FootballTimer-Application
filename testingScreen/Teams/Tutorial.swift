
import SwiftUI
struct Tutorial: View {
    var body: some View{
        ScrollView {
            ZStack{
//                Rectangle()
//                    .foregroundColor(.white)
//                    .edgesIgnoringSafeArea(.all)
                VStack() {
                    Text("TUTORIAL")
                        .font(.system(size: 30, weight: .heavy))
                        .offset(y: -10)
                    Group{
                        Text("Turn on IR receiver")
                            .font(.system(size: 15, weight: .heavy))
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                            .background(Color.green)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .offset(x: -90, y: 100)
                        Image("rams_kupp")
                            .resizable()
                            .scaledToFit()
                            .offset(x: 80, y: -50)
                        Text("Turn on IR transmitter")
                            .font(.system(size: 15, weight: .heavy))
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                            .background(Color.red)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .offset(x: 80, y: 80)
                        Image("rams_aaron")
                            .resizable()
                            .scaledToFit()
                            .offset(x: -80, y: -60)
                    }
                    Group{
                        Text("Make sure the green lights are on")
                            .font(.system(size: 15, weight: .heavy))
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                            .background(Color.green)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .offset(y:0)
                        Image("rams_front")
                            .resizable()
                            .scaledToFit()
                            .offset(y:-50)
                    }
                    Group{
                        Text("Set the time up facing each other")
                            .font(.system(size: 15, weight: .heavy))
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                            .background(Color.red)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .offset(y:0)
                        Image("rams_side")
                            .resizable()
                            .scaledToFit()
                            .offset(y:-50)
                    }
                    Group{
                        Text("Pick your favorite team")
                            .font(.system(size: 15, weight: .heavy))
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                            .background(Color.green)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .offset(y:15)
                        Image("rams_screen")
                            .resizable()
                            .scaledToFit()
                            .offset(x:15)
                    }
                    Group{
                        Text("Click")
                            .font(.system(size: 15, weight: .heavy))
                            .offset(x:-140)
                        Text("CONNECT")
                            .font(.system(size: 15))
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                            .background(Color.gray)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .offset(x: -57, y: -40)
                        Text(" to begin communication")
                            .font(.system(size: 15, weight: .heavy))
                            .offset(x:95, y: -75)
                        Text("Confirm green LED of IR receiver stops blinking")
                            .frame(width: 160, height: 80)
                            .font(.system(size: 15, weight: .heavy))
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                            .background(Color.green)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .offset(x: -90, y: -10)
                        Image("rams_kupp")
                            .resizable()
                            .scaledToFit()
                            .offset(x: 80, y: -220)
                    }
                    Group{
                        Text("Click")
                            .font(.system(size: 15, weight: .heavy))
                            .offset(x:-100, y: -150)
                        Image("start")
                            .resizable()
                            .frame(width: 70, height: 40, alignment:.center)
                            .offset(x: -35, y:-190)
//                        Text("Start")
//                            .bold()
//                            .font(.system(size:40))
//                            .foregroundColor(.green)
                        Text(" to start the timer")
                            .font(.system(size: 15, weight: .heavy))
                            .offset(x:70, y:-225)
                    }
                    Group{
                        Text("Click")
                            .font(.system(size: 15, weight: .heavy))
                            .offset(x: -100, y: -150)
                        Image("pause")
                            .resizable()
                            .frame(width: 70, height: 40, alignment:.center)
                            .offset(x: -35, y:-190)
                        Text(" to reset the timer")
                            .font(.system(size: 15, weight: .heavy))
                            .offset(x:70, y:-225)
                    }
                    Group{
                        Text("Click")
                            .font(.system(size: 15, weight: .heavy))
                            .offset(x:-100, y:-150)
                        Image("reset")
                            .resizable()
                            .frame(width: 70, height: 40, alignment:.center)
                            .offset(x:-35, y:-190)
                        Text(" to reset the timer")
                            .font(.system(size: 15, weight: .heavy))
                            .offset(x:70, y:-225)
                    }
                    Group{
                        Text("Click")
                            .font(.system(size: 15, weight: .heavy))
                            .offset(x:-160, y:-150)
                        Text("DISCONNECT")
                            .font(.system(size: 15))
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                            .background(Color.gray)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .offset(x:-65, y:-190)
                        Text(" to stop communication")
                            .font(.system(size: 15, weight: .heavy))
                            .offset(x:95, y:-225)
                        Text("RUN AND HAVE FUN")
                            .font(.system(size: 30, weight: .heavy))
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                            .background(Color.yellow)
                            .cornerRadius(10)
                            .foregroundColor(.blue)
                            .offset(y:-150)
                    }
                }
            }
        }
    }
    
}
struct Tutorial_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial();
    }
}

