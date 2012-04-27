task default: :daemon
task :get do
  sh "cd #{pwd}/xml && wget http://www.hydrodaten.admin.ch/lhg/SMS.xml"
end
task :daemon do
  while true
    sh "cd #{pwd}/xml && wget http://www.hydrodaten.admin.ch/lhg/SMS.xml"
    sleep 30 * 60
  end
end
