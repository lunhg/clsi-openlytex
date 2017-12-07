var CommandRunner, child_process, clsi, mocha, path, uuid;

path = require('path');

child_process = require('child_process');

mocha = require('mocha');

uuid = require('uuid');

clsi = require('./clsi-lilypond');

CommandRunner = clsi.LilypondRunner;

describe("Lilypond test", function() {
  return it("should echo lilypond Hello World", function() {
    return new Promise(function(resolve, reject) {
      var ly;
      ly = new LilypondRunner({
        directory: path.join(__dirname, '..', 'examples'),
        mainFile: 'main2',
        timeout: 60000
      });
      return ly.run().then(resolve).catch(reject);
    });
  });
});
