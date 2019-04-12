#!/bin/bash

sudo cpan App::cpanminus
sudo cpanm DateTime 
sudo cpanm App::Gitc::Its::Jira
sudo cpanm XMLRPC::Lite
sudo cpanm Term::ReadKey
sudo cpanm Config::Simple
sudo cpanm JIRA::REST
sudo cpanm Date::PeriodParser --force


echo "Done"
echo "Now Run PrettyLogs.pl"
