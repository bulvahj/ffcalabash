app_path = '/Users/mskrabacz/Library/Developer/Xcode/DerivedData/ff-bthwcocmzlvqvgdkicaxyanuucfs/Build/Products/Debug-iphonesimulator/ff.app'
system("cucumber -p ios #{app_path} -v --format html --out reports.html -p android #{ARGV.join(' ')} ")
