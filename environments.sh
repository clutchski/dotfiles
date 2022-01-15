#
# machine specific config
#

mkdir -p ~/.clutchski

# enable go
which gimme &> /dev/null
if [ $? -eq 0 ]
then
   eval "$(gimme stable &> /dev/null)" 
fi
