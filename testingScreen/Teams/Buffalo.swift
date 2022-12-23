
import SwiftUI
struct Buffalo: View {
    @ObservedObject var viewModel: CalculatorViewModel
    @ObservedObject var stopWatchManager = StopWatchManager()
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color(red: 0, green: 0, blue: 153/255))
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 0, blue: 0))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Image("bills-stefon_ccexpress")
                    .resizable()
                    .frame(width: 280, height: 350, alignment:.center)
                Spacer()
                if viewModel.stopping{
                    HStack{
                        Text(viewModel.stopWatchManager.secondsCount)
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size:60))
                        Text(String(":"))
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size:60))
                        Text(viewModel.stopWatchManager.millisCount)
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size:60))
                    }
                }
                else {
                    HStack{
                        Text(stopWatchManager.secondsCount)
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size:60))
                        Text(String(":"))
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size:60))
                        Text(stopWatchManager.millisCount)
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size:60))
                    }
                }
                Spacer()
                if viewModel.connected {
                    HStack {
                        if stopWatchManager.mode == .stopped || stopWatchManager.mode == .paused{
                            Spacer()
                            Button(action: {
                                self.stopWatchManager.start()
                                self.viewModel.stopWatchManager.start()
                                viewModel.send(.start)
                            }) {
                                TimerButton(label: "Start", buttonColor: .white)
                                    .foregroundColor(.green)
                            }
                            Spacer()
                            Button(action: {
                                self.stopWatchManager.reset()
                                self.viewModel.stopWatchManager.reset()
                                viewModel.send(.reset)
                            }) {
                                TimerButton(label: "Reset", buttonColor: .white)
                                    .foregroundColor(.red)
                            }
                            Spacer()
                        }
                        if stopWatchManager.mode == .running{
                            Spacer()
                            Button(action: {
                                self.stopWatchManager.pause()
                                self.viewModel.stopWatchManager.pause()
                            }) {
                                TimerButton(label: "Pause", buttonColor: .white)
                                    .foregroundColor(.green)
                            }
                            Spacer()
                            Button(action: {
                                self.stopWatchManager.reset()
                                self.viewModel.stopWatchManager.reset()
                                viewModel.send(.reset)
                            }) {
                                TimerButton(label: "Reset", buttonColor: .white)
                                    .foregroundColor(.red)
                            }
                            Spacer()
                        }
                    }
                }
                else {
                    HStack{
                        if stopWatchManager.mode == .stopped || stopWatchManager.mode == .paused{
                            Spacer()
                            Button(action: {
                                self.stopWatchManager.start()
                            }) {
                                TimerButton(label: "Start", buttonColor: .white)
                                    .foregroundColor(.green)
                            }
                            Spacer()
                            Button(action: {
                                self.stopWatchManager.reset()
                            }) {
                                TimerButton(label: "Reset", buttonColor: .white)
                                    .foregroundColor(.red)
                            }
                            Spacer()
                        }
                        if stopWatchManager.mode == .running{
                            Spacer()
                            Button(action: {
                                self.stopWatchManager.pause()
                            }) {
                                TimerButton(label: "Pause", buttonColor: .white)
                                    .foregroundColor(.green)
                            }
                            Spacer()
                            Button(action: {
                                self.stopWatchManager.reset()
                            }) {
                                TimerButton(label: "Reset", buttonColor: .white)
                                    .foregroundColor(.red)
                            }
                            Spacer()
                        }
                    }
                }
                Spacer()
                HStack {
                    if viewModel.connected {
                        Button(action: {
                            viewModel.disconnectCalculator()
                        }, label: {
                            Text("DISCONNECT")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .padding()
                        }).buttonStyle(ConnectButton())
                    } else {
                        Button(action: {
                            viewModel.connectCalculator()
                        }, label: {
                            Text("CONNECT")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .padding()
                        }).buttonStyle(ConnectButton())
                    }
                }
                .frame(width: 200)
                .font(.system(size: 20))
                .cornerRadius(10)
                
                Spacer()
            }
        }
    }
}
struct Buffalo_Previews: PreviewProvider {
    static var viewModel = CalculatorViewModel()
    static var previews: some View {
        Buffalo(viewModel: viewModel)
    }
}
