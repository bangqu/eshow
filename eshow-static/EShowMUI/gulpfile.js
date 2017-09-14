
var path = require('path');
var fs = require('fs');
var gulp = require('gulp');
var less = require('gulp-less');
var header = require('gulp-header');
var cssclean = require('gulp-clean-css');
var postcss = require('gulp-postcss');
var autoprefixer = require('autoprefixer');
var rename = require('gulp-rename');
var sourcemaps = require('gulp-sourcemaps');
var browserSync = require('browser-sync');
var concat      = require("gulp-concat");//文件合并
var pkg = require('./package.json');
var runSequence = require('gulp-sequence');
var fileinclude  = require('gulp-file-include');
var yargs = require('yargs')
    .options({
        'w': {
            alias: 'watch',
            type: 'boolean'
        },
        's': {
            alias: 'server',
            type: 'boolean'
        },
        'p': {
            alias: 'port',
            type: 'number'
        }
    }).argv;

var option = {base: 'src'};
var build = __dirname + '/build';


function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}


var day = getNowFormatDate();

gulp.task('build:style', function (){


    var banner = [
        '/*!',
        ' * <%=  name %>样式表 v<%= pkg.version %>',
        ' * @author sql80',
        ' * @email sql80@live.com',
        ' * @Home sql80.com',
        ' * @time <%=  day %>',
        ' */',
        ''].join('\n');
    gulp.src('src/less/eshowmui.less', option)
        .pipe(sourcemaps.init())
        .pipe(less().on('error', function (e) {
            console.error(e.message);
            this.emit('end');
        }))
        .pipe(postcss([autoprefixer(['iOS >= 7', 'Android >= 4.1'])]))
        .pipe(header(banner, { pkg : pkg ,day:day,name:'EShowMUI'} ))
        .pipe(sourcemaps.write())
        .pipe(concat('/css/eshowmui.css'))
        .pipe(gulp.dest(build))

        .pipe(cssclean())
        .pipe(rename(function (path) {
            path.basename += '.min';
        }))
        .pipe(gulp.dest(build))
        .pipe(browserSync.reload({stream: true}));
        gulp.src('src/less/demo.less',option)
        .pipe(less().on('error', function (e) {
            console.error(e.message);
            this.emit('end');
        }))
        .pipe(postcss([autoprefixer(['iOS >= 7', 'Android >= 4.1'])]))
        .pipe(header(banner, { pkg : pkg ,day:day,name:'demo样式'} ))
        .pipe(sourcemaps.write())
        .pipe(concat('/css/demo.css'))
        .pipe(gulp.dest(build))
        .pipe(cssclean())
        .pipe(rename(function (path) {
            path.basename += '.min';
        }))
        .pipe(gulp.dest(build))
        .pipe(browserSync.reload({stream: true}));
});

gulp.task('build:assets', function (){
    gulp.src('src/**/*.?(js|css)', option)
        .pipe(gulp.dest(build))
        gulp.src('src/**/*.html')
              .pipe(fileinclude({
                prefix: '@@',
                basepath: '@file'
              }))

        .pipe(gulp.dest(build))

        .pipe(browserSync.reload({stream: true}))

});

gulp.task('build:images', function (){
    gulp.src('src/images/*',option)
        .pipe(gulp.dest(build))
    gulp.src('src/img/*',option)
        .pipe(gulp.dest(build))
        .pipe(browserSync.reload({stream: true}));
});




gulp.task('release', function(cb) {
    runSequence('build:assets','build:style','build:images')(cb);
})

gulp.task('watch', ['release'], function () {
    gulp.watch('src/less/**/*', ['build:style']);
    gulp.watch('src/**/*.?(js|html)', ['build:assets']);
    gulp.watch('src/**/*.html');

});

gulp.task('server', function () {
    yargs.p = yargs.p || 3000;
    browserSync.init({
        server: {
            baseDir: "./build"
        },
        ui: {
            port: yargs.p + 1,
            weinre: {
                port: yargs.p + 2
            }
        },
        port: yargs.p,
        startPath: '/pages/'
    });
});

// 参数说明
//  -w: 实时监听
//  -s: 启动服务器
//  -p: 服务器启动端口，默认8080
gulp.task('default', ['release'], function () {
    if (yargs.s) {
        gulp.start('server');
    }

    if (yargs.w) {
        gulp.start('watch');
    }
});
