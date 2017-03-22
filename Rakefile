#################################################################################################################################
#                                                                                                                               #
# This rake file is used to execute the cucumber tests.                                                                         #
# It has two cli one for executing tests on jenkins server and other for executing tests on local machine.                      #
#                                                                                                                               #
# Rake cli options :                                                                                                            #
#   To execute this rake file type on command prompt :  rake <task_name> <parameters>                                           #
#                                                   e.g rake test browser=true                                                  #
#                                                   NOTE : by default it will execute the dfault task.                          #
#                                                                                                                               #
#   To execute tests on different browsers use command : rake <task_name> <browser_name>                                        #
#                                                   e.g rake test firefox=true or rake test chrome=true                         #
#                                                   NOTE: for executing tests on other than firefox browser driver need to be   #
#                                                        downloaded and it's path should be in environment path variable.       #
#                                                                                                                               #
#   To execute tests sequentially on both browsers use command : rake test firefox=true & rake test chrome=true                 #
#                                                                                                                               #
#################################################################################################################################

require 'cucumber'
require 'cucumber/rake/task'
require 'rake'

Cucumber::Rake::Task.new(:feature) do |t|
#  t.cucumber_opts = ['--tags', ':login, :folder']
#  t.cucumber_opts = "--format html --out report.html --format pretty"

  #------- local cli for executing and debugging tests --------#
  #t.cucumber_opts = "features --tags @login --format html --out reports.html --format pretty"
  
  #------jenkins cli -- for executing all @somke features sequentially with single report file. -----------# 
  
 # t.cucumber_opts = "**/features/documents/login.feature --tags @smoke **/features/documents/add_fileroom_active.feature --tags @smoke **/features/documents/folder.feature --tags @smoke **/features/documents/upload.feature --tags @smoke **/features/documents/favorite_folder.feature --tags @smoke **/features/documents/readUnread.feature --tags @smoke **/features/documents/rename_file.feature --tags @smoke **/features/documents/delete_fileroom.feature --tags @smoke **/features/documents/replace.feature --tags @smoke **/features/documents/copy_files_folder_to_folder.feature --tags @smoke **/features/documents/move_doc.feature --tags @smoke --require **/Frontend/jv/features/step_definitions/ --require **/Frontend/jv/features/support/ --format html --out reports.html --format pretty"
    #t.cucumber_opts = "**/features/documents -- tags @demo --require **/Frontend/jv/features/step_definitions/ --require **/Frontend/jv/features/support/ --format html --out reports.html --format pretty"  


 # t.cucumber_opts = "**/features/documents/login.feature --tags @smoke **/features/documents/add_fileroom_active.feature --tags @smoke **/features/documents/folder.feature --tags @smoke **/features/documents/upload.feature --tags @smoke **/features/documents/favorite_folder.feature --tags @smoke **/features/documents/readUnread.feature --tags @smoke **/features/documents/rename_file.feature --tags @smoke **/features/documents/delete_fileroom.feature --tags @smoke **/features/documents/replace.feature --tags @smoke **/features/documents/copy_files_folder_to_folder.feature --tags @smoke **/features/documents/move_doc.feature --tags @smoke --require **/Frontend/jv/features/step_definitions/ --require **/Frontend/jv/features/support/ --format html --out reports.html --format pretty"
    t.cucumber_opts = "**/features/documents/ --require **/features/step_definitions/ --require **/features/support/ --format html --out **/reports.html --format pretty"
#t.cucumber_opts = "**/features/ --require **/Frontend/jv/features/step_definitions/ --require **/Frontend/jv/features/support/ --format html --out reports.html --format pretty" 


end
task :default => [:feature]

  
