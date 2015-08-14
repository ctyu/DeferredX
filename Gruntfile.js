module.exports = function(grunt){

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    coffee: {
      compile: {
        files: {
          'lib/Queue.js': 'src/Queue.coffee', // compile and concat into single file
          'lib/PromiseX.js': 'src/PromiseX.coffee'
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-coffee');    
}