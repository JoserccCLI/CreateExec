import Commander

command {
    let createExec = CreateExec()
    do {
        try createExec.create()
    } catch let error {
        print(error.localizedDescription.b.Red)
    }
}.run()
