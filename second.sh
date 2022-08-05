#!/bin/bash
echo
echo
echo "Hello Welcome to OSINT module"
echo
echo -n "Your target: "
read target
echo $target
if [ -z $target] ;then echo "Please type INPUT";exit;fi
echo
echo
user=$(whoami)

echo "Hello $user; Lets start doing OSINT on  $target"
firefox https://www.google.com/search?q=site%3A$target&source=hp&ei=EHPnYoS3OY3w4-EP1tWTqAI&iflsig=AJiK0e8AAAAAYueBIGfEPPAPNena5WUpM-jfyS7MofrH&ved=0ahUKEwiE_5ScgqX5AhUN-DgGHdbqBCUQ4dUDCAY&uact=5&oq=site%3Aexample.com&gs_lcp=Cgdnd3Mtd2l6EAM6FAgAEOoCELQCEIoDELcDENQDEOUCOgUIABCRAjoLCAAQgAQQsQMQgwE6EQguEIAEELEDEIMBEMcBENEDOggILhCxAxCDAToICAAQgAQQsQM6CAguEIAEELEDOgUIABCABDoOCC4QgAQQsQMQgwEQ1AI6BAgAEAM6CwguEIAEEMcBEK8BOgsILhCABBCxAxDUAjoICAAQsQMQgwE6CAgAELEDEJECOhEILhCABBCxAxDHARDRAxDUAjoOCC4QsQMQgwEQxwEQ0QM6CggAELEDEIMBEAo6BwgAEIAEEAo6CggAELEDELEDEAo6BAgAEAo6DQgAELEDEIMBELEDEApQ8gVYhHJgn3RoDXAAeAGAAdsCiAGQFZIBCDEuMTguMC4xmAEAoAEBsAEK&sclient=gws-wiz &
firefox --new-tab https://www.google.com/search?client=firefox-b-e&q=site%3A$target+filetype%3Apdf$name &
firefox --new-tab https://www.google.com/search?client=firefox-b-e&q=site%3A$target+filetype%3Adoc &
firefox --new-tab https://www.google.com/search?client=firefox-b-e&q=site%3A$target+inurl%3Abatman &





