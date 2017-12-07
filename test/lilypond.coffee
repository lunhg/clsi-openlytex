describe "Lilypond test", ->
        
        it "should make a G major arpeggio", ->
                new Promise (resolve, reject) ->                
                        ly = new LilypondRunner({
                                project_id: uuid.v4()
                                directory: path.join(__dirname, '..', 'examples')
                                mainFile: 'main2.ly'
                                merge:true
                        })
                        ly.run().then(resolve).catch(reject)
