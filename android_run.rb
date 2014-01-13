app_path = '/Users/mskrabacz/AndroidStudioProjects/1414-android/ffandroid/ffandroid/build/apk/ffandroid-debug-unaligned.apk'
system("calabash-ancadroid run #{app_path} -v --format html --out reports.html -p android #{ARGV.join(' ')} ")
