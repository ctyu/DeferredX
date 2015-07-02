module.exports = function(grunt){

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        coffee: {
            compile: {
                files: {
                    'lib/Queue.js': 'src/Queue.coffee', // compile and concat into single file
                    'lib/CallBack.js': 'src/CallBack.coffee',
                    'lib/PromiseX.js': 'src/PromiseX.coffee'
                }
            }
        },
        requirejs: {
          compile: {
            options: {
              baseUrl: "path/to/base",
              mainConfigFile: "path/to/config.js",
              name: "path/to/almond", // assumes a production build using almond 
              out: "path/to/optimized.js"
            }
          }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-requirejs');

}