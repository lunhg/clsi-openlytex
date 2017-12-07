describe "Lilypond test", ->
        
        it "should echo lilypond Hello World", ->
                new Promise (resolve, reject) ->                
                        ly = new LilypondRunner({
                                directory: path.join(__dirname, '..', 'examples')
                                mainFile: 'main2.ly'
                                timeout: 60000
                        })
                        ly.run().then(resolve).catch(reject)
