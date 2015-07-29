changed     = require 'gulp-changed'
gulp        = require 'gulp'
imagemin    = require 'gulp-imagemin'
imageResize = require 'gulp-image-resize'
rename      = require 'gulp-rename'
spritesmith = require 'gulp.spritesmith'
config      = require('../config').sprites
sourceFiles = require('../config').sourceFiles
browserSync = require 'browser-sync'

gulp.task 'sprites', ->
  gulp.src("#{config.src}/*@2x.png").pipe(
    imageResize({
      width: '50%',
      height: '50%'
    })).pipe(rename((path) ->
      path.basename = path.basename.slice(0, -3)
    )).pipe(gulp.dest(config.src))

  spriteData = gulp.src("#{config.src}/*.png")
  .pipe spritesmith({
    retinaSrcFilter: "#{config.src}/*@2x.png"
    retinaImgName: 'sprite2x.png',
    imgName: "sprite.png",
    cssName: "sprites.sass"
  })

  spriteData.img.pipe imagemin().pipe gulp.dest(config.dest)
  spriteData.css.pipe(gulp.dest("#{sourceFiles}/stylesheets/helper"))