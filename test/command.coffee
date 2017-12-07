describe "Command test", ->
        
        it "should echo lilypond Hello World", ->
                new Promise (resolve, reject) ->                
                        ly = new CommandRunner({
                                project_id: id
                                directory: path.join(__dirname, '..', 'examples')
                                command: ["lilypond", "--pdf", "--output", "main", "main.ly"]
                                mergeNativeEnv: true
                        })
                        ly.run().then(resolve).catch(reject)
