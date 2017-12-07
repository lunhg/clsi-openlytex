describe "Command test", ->
        
        it "should make a C major arpeggio", ->
                new Promise (resolve, reject) ->                
                        ly = new CommandRunner({
                                project_id: id
                                directory: path.join(__dirname, '..', 'examples')
                                command: ["lilypond", "-dsafe", "--pdf", "--output", "main", "main.ly"]
                        })
                        ly.run().then(resolve).catch(reject)
