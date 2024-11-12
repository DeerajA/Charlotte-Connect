import SwiftUI

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    return formatter
}()

struct ContentView: View {
    // State variables
    @State public var banners: [buttonBanner] = []
    @State private var selectedDate = Date()
    @State public var showModal = false
    @State private var showDatePicker = false  // Controls the DatePicker modal

    
    var body: some View {
        VStack {
            // Horizontal stack for buttons
            HStack {
                // Create Event Button
                Button(action: {
                    self.showModal = true
                }) {
                    Text("Create Event")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.leading)

                // Remove Event Button
                Button(action: {
                    self.removeBanner()
                }) {
                    Text("Remove Event")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.leading)
            }
            .padding()  // Add padding around the HStack
            
            // Display all banners
            // Use this to cutomize the main page
            ScrollView {
                VStack {
                    ForEach(banners, id: \.self) { banner in
                        VStack {
                            Image("Banner")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .padding()
                                .transition(.opacity)
                            
                            // Display the banner's event name, description, and date
                            Text(banner.getEventName())
                                .font(.headline)
                                .font(.largeTitle)
                            Text(banner.getEventDescription())
                                .font(.subheadline)
                            Text("Event Date: \(banner.getEventDate(), formatter: dateFormatter)")
                                .font(.footnote)
                            Text(banner.getEventLocation())
                                .font(.subheadline)
                        }
                        .padding(.bottom, 10)  // Add padding between banners
                    }
                }
            }
            .padding()  // Add padding around the ScrollView
        }
        .sheet(isPresented: $showModal) {
            ModalView(onAddBanner: { newBanner in
                self.banners.append(newBanner)
            })
        }
    }
    private func removeBanner() {
        if !banners.isEmpty {
            banners.remove(at: 0)
        }
    }
}

struct ModalView: View {
    @State private var eventName: String = ""
    @State private var eventDescription: String = ""
    @State private var selectedDate = Date()
    @State private var eventLocation: String = ""

    var onAddBanner: (buttonBanner) -> Void  // Closure to pass back the new banner

    @Environment(\.presentationMode) var presentationMode  // For dismissing the modal

    var body: some View {
        
        //Enter Event Info
        ScrollView {
            VStack(spacing: 20) {
                Text("Event Info")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Event Name", text: $eventName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Event Description", text: $eventDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Event Location", text: $eventLocation)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                
                //add event button
                Button("Add Event") {
                    let newBanner = buttonBanner(
                        eventName: eventName,
                        eventDescription: eventDescription,
                        eventDate: selectedDate,
                        eventLocation: eventLocation
                    )
                    onAddBanner(newBanner)  // Pass the new banner back
                    presentationMode.wrappedValue.dismiss()  // Dismiss the modal
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
