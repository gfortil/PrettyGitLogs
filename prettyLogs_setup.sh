#!/bin/bash

sudo cpan App::cpanminus
sudo cpanm DateTime --force
sudo cpanm App::Gitc::Its::Jira
sudo cpanm XMLRPC::Lite
sudo cpanm Term::ReadKey
sudo cpanm Config::Simple
sudo cpanm JIRA::REST

echo "Done"
echo "Now Run PrettyLogs.pl"
