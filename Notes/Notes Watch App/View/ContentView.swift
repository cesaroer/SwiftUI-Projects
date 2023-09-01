//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Cesar Vargas Tapia on 27/08/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTY
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    // MARK: - FUNCTION
    
    func getDocumentDirectory() -> URL {
      let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
      return path[0]
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("Saving data has failed!")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                let url = getDocumentDirectory()
                    .appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                // Do nothing
            }
        }
    }
    
    func delete(offsets: IndexSet) {
      withAnimation {
        notes.remove(atOffsets: offsets)
        save()
      }
    }

    var body: some View {
        NavigationStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add new note", text: $text)
                
                Button {
                    // 1. Only run the button's action when the text field is not empty
                    guard text.isEmpty == false else { return }
                    
                    // 2. Create a new note item and initialize it with the text value
                    let note = Note(id: UUID(), text: text)
                    
                    // 3. Add the new note item to the notes array (append)
                    notes.append(note)
                    
                    // 4. Make the text field empty
                    text = ""
                    // 5. Save the notes (function)
                    save()
                } label: {
                    Image(systemName: "plus.circle")
                      .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)

            }//: HStack
            Spacer()
            if notes.count >= 1 {
                List {
                    ForEach(Array(notes.enumerated()), id: \.offset) { index, note in
                        let detail = DetailView(note:note,
                                                count: notes.count,
                                                index: index)
                        NavigationLink(destination: detail) {
                            HStack {
                              Capsule()
                                .frame(width: 4)
                                .foregroundColor(.accentColor)
                              Text(note.text)
                                .lineLimit(1)
                                .padding(.leading, 5)
                            }
                        }
                    }.onDelete(perform: delete)
                }
            } else {
                Spacer()
                Image(systemName: "note.text")
                  .resizable()
                  .scaledToFit()
                  .foregroundColor(.gray)
                  .opacity(0.25)
                  .padding(25)
                Spacer()
            }
        }//Vstack
        .navigationTitle("Notes")
        .onAppear(perform: {
          load()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
